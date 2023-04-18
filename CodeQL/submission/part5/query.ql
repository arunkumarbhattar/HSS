import cpp
// Two free calls, one after the other on the same variable, is a double free
// Additional Governing criteria are that the variable should not be mallocced in the middle of the two free calls
// first realloc can be followed by a free as long as there is a guard condition that ensures that the realloc call does not fail

from FunctionCall FC_1, FunctionCall FC_2, LocalScopeVariable MemoryPointer
where
  freeCall(FC_1, MemoryPointer.getAnAccess()) and
  freeCall(FC_2, MemoryPointer.getAnAccess()) and
  FC_1 != FC_2 and // Free calls are not the same
  FC_1.getASuccessor*() = FC_2 and // Free calls are in sequence
  not exists(Expr LoseMemoryHandle | //Pointer Handle not being moved to a different memory location --> if that happens, then the same pointer can be freed twice (as 2nd time youre pointing elsewhere)
    (LoseMemoryHandle = MemoryPointer.getAnAssignedValue() or LoseMemoryHandle.(AddressOfExpr).getOperand() = MemoryPointer.getAnAccess()) and
    LoseMemoryHandle = FC_1.getASuccessor*() and // Memory handle lost between the two calls makes sense, otherwise its just pointsTo analysis
    LoseMemoryHandle = FC_2.getAPredecessor*()
  ) and
  not exists(FunctionCall OtherFunc |
    not OtherFunc instanceof DeallocationExpr and // I dont want to pass My pointer Handle into other functions between the two free calls
    // Partly cuz, in most of the uses, the user defined function does something like alloccing, making the handle point to a diff memory etc 
    // Its additional complexity analyzing what happens when the pointer handle is passed into a function
    OtherFunc = FC_1.getASuccessor*() and
    OtherFunc = FC_2.getAPredecessor*() and
    OtherFunc.getAnArgument().(VariableAccess).getTarget() = MemoryPointer
  ) and
  (
    FC_1.getTarget().hasGlobalOrStdName("realloc") and
    (
      not FC_1.getParent*() instanceof IfStmt and
      not exists(IfStmt IfGuard |
        IfGuard.getCondition().getAChild*().(VariableAccess).getTarget().getAnAssignedValue() = FC_1 //guarding the function call result of first realloc
      )
    )
    or
    not FC_1.getTarget().hasGlobalOrStdName("realloc")
  )
select FC_2.getArgument(0),
  "Possible double free situation between -->" + FC_1.getLocation().getStartLine() + " and ->>>>" + FC_2.getLocation().getStartLine() + " in file -->" + FC_2.getLocation().getFile().getRelativePath()
