import semmle.code.cpp.pointsto.PointsTo
import semmle.code.cpp.controlflow.StackVariableReachability

//Basic PointsToExpr has interesting --> none() -->
// Extend it to include interesting expressions as the ones that free the memory
class FreedPointsToExpr extends PointsToExpr {
  FreedPointsToExpr() {     
    exists(Expr Freeexp | Freeexp = this and 
    Freeexp = any(DeallocationExpr DExp).getFreedExpr()
    ) 
  }

  override predicate interesting() { 
    exists(Expr e | e = this and 
    e = any(DeallocationExpr de).getFreedExpr()
    )
  }
}

predicate isExpMalloccedDirectlyOrIndirectly(Expr Exp) {
  Exp.(AllocationExpr).requiresDealloc() and // --> Directly malloced
  exists (AllocationExpr AExp | anythingPointsTo(AExp))   //If the mallocExpression is every freed, and since we have extended PointsToExpr 
  or
  exists(ReturnStmt Ret | //Mostly the malloc memory is just returned --> Then you step back from the wrapper thats allocating it and trace this memory in the layer to the immediate above
    //Account for indirect calls to function f 
    //png_create_info_struct calls malloc 2 levels down --> We need to account for that
    exists(Expr call, Function function | call = Exp and function = Ret.getEnclosingFunction() |
      call.(FunctionCall).getTarget() = function or 
      call.(VariableCall).getVariable().getAnAssignedValue().getAChild*().(FunctionAccess).getTarget() = function
    )
    and
    (
      isExpMalloccedDirectlyOrIndirectly(Ret.getExpr()) // Malloc wrappers generally always return the malloced memory
      or
      exists(Variable v |
        v = Ret.getExpr().(VariableAccess).getTarget() and
        isExpMalloccedDirectlyOrIndirectly(v.getAnAssignedValue())
      )
    )
  )
}

predicate isfreedDirectlyOrIndirectly(ControlFlowNode n, Variable v) {
  n.(DeallocationExpr).getFreedExpr() = v.getAnAccess() and //Directly freed
  not exists(n.(AllocationExpr).getReallocPtr()) //Although Reallocs also free, we are not interested in them
  or
  exists(FunctionCall CallToFreeWrapper, Function FreeWrapper, int arg |
    // indirect free call
    n.(Call).getArgument(arg) = v.getAnAccess() and
    exists(Expr call, Function function | call = n and function = FreeWrapper |
      call.(FunctionCall).getTarget() = function or 
      call.(VariableCall).getVariable().getAnAssignedValue().getAChild*().(FunctionAccess).getTarget() = function
    ) and
    CallToFreeWrapper.getEnclosingFunction() = FreeWrapper and
    isfreedDirectlyOrIndirectly(CallToFreeWrapper, FreeWrapper.getParameter(arg))
  )
}

// Holds for all variables that were every mallocced 
predicate allocationDefinition(StackVariable v, ControlFlowNode def) {
  exists(Expr expr | exprDefinition(v, def, expr) and isExpMalloccedDirectlyOrIndirectly(expr))
}

// Extend StackVariableReachabilityWithReassignment (Cuz we gotta deal with reassignments to vars) with our
// definitions for Source and Sink
class MallocVarReachability extends StackVariableReachabilityWithReassignment {
  MallocVarReachability() { this = "AllocVariableReachability" }

  override predicate isSourceActual(ControlFlowNode node, StackVariable v) {
    allocationDefinition(v, node) // A source is all that we wrote for malloc so far
  }

  override predicate isSinkActual(ControlFlowNode node, StackVariable v) {
    exists(node.(AnalysedExpr).getNullSuccessor(v)) or // Handle NULL check on the val
    isfreedDirectlyOrIndirectly(node, v) //Either you free it  
    or
    v.getFunction() = node.(ReturnStmt).getEnclosingFunction() // or return it for someone else to free it
  }
  override predicate isBarrier(ControlFlowNode node, StackVariable v) { definitionBarrier(v, node) }
}

predicate variableStillAllocatedAtCurr(StackVariable v, ControlFlowNode Src, ControlFlowNode Curr) {
  exists(MallocVarReachability TT | //We are using our own reachability Points To Analysis
    TT.isSource(Src, v) or
    TT.reachesTo(Src, _, Curr, v)
    and    
    Curr = Src
  )
}

class IsMallocStillUnMallocced extends StackVariableReachabilityExt {
  IsMallocStillUnMallocced() { this = "IsMallocStillUnMallocced" }

  override predicate isSource(ControlFlowNode node, StackVariable v) {
    allocationDefinition(v, node) // A source is all that we wrote for malloc so far
  }

  override predicate isSink(ControlFlowNode node, StackVariable v) {
    v.getFunction() = node.(ReturnStmt).getEnclosingFunction() // at this point, if you're walking out (enclosing function) without with a UnMalloced Expr, thats it --> Illegal
  }

  override predicate isBarrier(
    ControlFlowNode source, ControlFlowNode node, ControlFlowNode next, StackVariable v
  ) {
    isSource(source, v) and
    next = node.getASuccessor() and 
    exists(StackVariable NullCheck |
       variableStillAllocatedAtCurr(NullCheck, source, node) |
      node.(AnalysedExpr).getNullSuccessor(NullCheck) = next or
      isfreedDirectlyOrIndirectly(node, NullCheck)
    )
  }
}

predicate doesMallocReachTerminalIllegally(ControlFlowNode def, ControlFlowNode node) {
  exists(IsMallocStillUnMallocced r | r.reaches(def, _, node))
}

from ControlFlowNode MallocPoint, ReturnStmt Terminal
where
  doesMallocReachTerminalIllegally(MallocPoint, Terminal) and //Mallocced and Unfreed Memory reaches terminal point
  not exists(StackVariable v | // and there is not a single variable that continues the life of this malloc beyond the terminal (getAChild*())
    variableStillAllocatedAtCurr(v, MallocPoint, Terminal) and 
    Terminal.getAChild*() = v.getAnAccess()
  )
select MallocPoint, "Memory allocated here -->"+ MallocPoint.getLocation().getFile() +
" At line --> " + MallocPoint.getLocation().getStartLine() + " is not freed before returning from function --> " + Terminal.getEnclosingFunction().getName()

