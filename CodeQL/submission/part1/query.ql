import cpp 
import semmle.code.cpp.rangeanalysis.SimpleRangeAnalysis

//Create a Predicate that lights up if "there exists" a path from source to sink (snprintf) that is 
//unguarded
predicate flowsToSnprintfExpr(Expr source, Expr sink, boolean isSnPrintfGonOverflow) {
  exists(boolean isSnPrintfBufGonOverflow | flowsToIllegalSnprintfExpr(source, sink, isSnPrintfBufGonOverflow) | // Check if there is a path from source (snprintf return value) to sink (snprintf buffer) without a guard
    if (convertedExprMightOverflow(sink)) //This is true, when the result of snprintf is not bounded --> hence here snprintf itself is an overflowing expr
      then isSnPrintfGonOverflow = true
      else isSnPrintfGonOverflow = isSnPrintfBufGonOverflow //If the result of snprintf is bounded, then we need to check if the snprintf buffer is bounded 
      )
  
}

//various ways in which snprintf is being used -->
// pos += snprintf(pos,...);
// pos -= snprintf(pos,...); 
predicate flowsToIllegalSnprintfExpr(Expr Memsrc, Expr Memsink, boolean isSnPrintfGonOverflow) {
  Memsrc = Memsink // pos += snprintf(pos,...);  or pos -= snprintf(pos+something,...);
  and isSnPrintfGonOverflow = false // Start off with the assumption that the buffer does not overflow 
  and Memsrc.(FunctionCall).getTarget().(Snprintf).returnsFullFormatLength() // snprintf returns the number of characters 
  // that would have been written if the buffer was large enough
  or
  exists(RangeSsaDefinition  def, StackVariable v |
    isThereUnguarded(Memsrc, def, v, isSnPrintfGonOverflow) and 
    Memsink = def.getAUse(v) ) //is the incrementing or decrementing variable used by snprintf
  or
  flowsToSnprintfExpr(Memsrc, Memsink.(UnaryArithmeticOperation).getOperand(), isSnPrintfGonOverflow)
  or
  flowsToSnprintfExpr(Memsrc, Memsink.(BinaryArithmeticOperation).getAnOperand(), isSnPrintfGonOverflow)
  or 
  flowsToSnprintfExpr(Memsrc, Memsink.(Assignment).getRValue(), isSnPrintfGonOverflow)
}

// Holds if there is an unguarded path between snprintf result and snprintf argument
predicate isThereUnguarded(Expr source, RangeSsaDefinition def, StackVariable v, boolean isSnPrintfGonOverflow) {
  // Might the current definition overflow?
  exists(boolean isSnPrintfBufGonOverflow | isThereNoGuardsRecursive(source, def, v, isSnPrintfBufGonOverflow) |
    if defMightOverflow(def, v)
    then isSnPrintfGonOverflow = true 
    else isSnPrintfGonOverflow = isSnPrintfBufGonOverflow
  )
}

//there is no guards that protects the path from source to def
predicate isThereNoGuardsRecursive(Expr source, RangeSsaDefinition def, StackVariable v, boolean isThereAnOverflowOp) {
  exists (boolean isThereAnOverflowOpElsewhere | 
      exists(Expr e | e = def.getDefiningValue(v) and flowsToSnprintfExpr(source, e, isThereAnOverflowOpElsewhere))
      or 
      exists(CrementOperation c | def = c and c.getOperand() = v.getAnAccess() and flowsToSnprintfExpr(source, c.getOperand(), isThereAnOverflowOpElsewhere)) //is the incrementing or decrementing variable used by snprintf
      or 
      isThereNoGuardsRecursive(source, def.getAPhiInput(v), v, isThereAnOverflowOpElsewhere)
    |
    if defMightOverflow(def, v)
     then isThereAnOverflowOp = true 
     else isThereAnOverflowOp = isThereAnOverflowOpElsewhere
  )
}

from FormattingFunctionCall call, Expr sink
where 
flowsToSnprintfExpr(call, sink, true) and 
  sink = call.getArgument(call.getTarget().getSizeParameterIndex())
  select call ,
  "The call -->" + call.getTarget().getName() +
  " <--in file named--> " + call.getLocation().getFile().getRelativePath() + " at line -->" + call.getLocation().getEndLine()+ " is derived from its unbounded computed value that may exceed the size of mallocced-buffer and overflow it "

