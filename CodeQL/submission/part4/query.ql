import cpp
import semmle.code.cpp.rangeanalysis.SimpleRangeAnalysis
import semmle.code.cpp.ir.dataflow.TaintTracking
import semmle.code.cpp.ir.IR
import semmle.code.cpp.controlflow.IRGuards
import semmle.code.cpp.security.FlowSources
import DataFlow::PathGraph

predicate mallocWithASTaintedSinkArg(Expr malloc, DataFlow::Node PossiblyOverflowsink) {
  exists(Expr exp | exp = PossiblyOverflowsink.asConvertedExpr() |
    isAllocationExpr(malloc) and // The DataNode that is being passed into an allocation expression is Integer type
    exp = malloc.getAChild() and
    exp.getUnspecifiedType() instanceof IntegralType
  )
}

predicate isGuardedVariable(Variable Var) {
  exists(RelationalOperation Op, VariableAccess access |
    access.getTarget() = Var and
    Op.getAnOperand() = access and
    not Op.getAnOperand().getValue() = "0" //  if (val != 0) --> This is very common and is useless 
  )
}

predicate isFlowSource(FlowSource source, string sourceType) { sourceType = source.getSourceType() }

class TaintedAllocationSizeConfiguration extends TaintTracking::Configuration {
  TaintedAllocationSizeConfiguration() { this = "TaintedAllocationSizeConfiguration" }

  override predicate isSource(DataFlow::Node source) { exists(FlowSource userInput, string sourceType | sourceType = userInput.getSourceType() )}

  override predicate isSink(DataFlow::Node sink) { mallocWithASTaintedSinkArg(_, sink) }

  override predicate isSanitizer(DataFlow::Node node) {
    // Any Arithmetic expression resulting in a possible overflow must be guarded before being passed into the allocation size 
    exists(Expr ShouldGuardExp |ShouldGuardExp = node.asExpr() |
      (
        ShouldGuardExp instanceof AssignArithmeticOperation or 
        ShouldGuardExp instanceof UnaryArithmeticOperation or
        ShouldGuardExp instanceof BinaryArithmeticOperation 
      ) // Possible Overflows
      and
      not convertedExprMightOverflow(ShouldGuardExp) //Check for overflow
    ) //Case 1 : Overflow is not possible
    or //Case 2: Overflow possible but guarded --> done below
    exists(Variable guardedVar, Operand access |
      access.getDef().(LoadInstruction).getSourceAddress().(VariableAddressInstruction).getASTVariable() = guardedVar and
      node.asInstruction().(LoadInstruction).getSourceAddress().(VariableAddressInstruction).getASTVariable() = guardedVar and 
      any(IRGuardCondition guard).ensuresEq(access, _, _, node.asInstruction().getBlock(), true)
    )
    or
    exists(Variable guardedVar |
      node.asInstruction().(LoadInstruction).getSourceAddress().(VariableAddressInstruction).getASTVariable() = guardedVar and
      isGuardedVariable(guardedVar)
    )
  }
}

from
  Expr alloc, DataFlow::PathNode source, DataFlow::PathNode sink, string IllegalReason,
  TaintedAllocationSizeConfiguration TConf
where
  exists(FlowSource userInput | userInput = source.getNode() and IllegalReason = userInput.getSourceType() ) and
  TConf.hasFlowPath(source, sink) and
  mallocWithASTaintedSinkArg(alloc, sink.getNode())
select alloc, source, sink, 
" Call to malloc at --> " + alloc.getLocation().getFile().getRelativePath() +
" at line --> " + alloc.getLocation().getEndLine() + " <-- is tainted due to a --> " + IllegalReason
+ " originating at --> " + source.getNode().getLocation().getFile().getRelativePath() + " at line --> " + source.getNode().getLocation().getEndLine()
