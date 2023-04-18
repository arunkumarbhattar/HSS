import cpp 
import semmle.code.cpp.rangeanalysis.SimpleRangeAnalysis

// Create a Predicate that lights up if "there exists" a path from source to sink (snprintf) that is 
//unguarded

predicate flowsToDesiredFunction(Expr source) {
  source.(FunctionCall).getTarget().hasGlobalOrStdName("sprintf") or 
  source.(FunctionCall).getTarget().hasGlobalOrStdName("sscanf") or
  source.(FunctionCall).getTarget().hasGlobalOrStdName("fscanf")
}

from FunctionCall call, Expr sink
where 
flowsToDesiredFunction(call)
and call.(FunctionCall).getTarget().getACallToThisFunction().getAnArgument().getValueText().matches("%\\%s%")
and sink.getValueText().matches("%\\%s%") and 
sink = call.getAnArgument()
  select call ,
  "The call -->" + call.getTarget().getName() +
  " <--in file named--> " + call.getLocation().getFile().getRelativePath() + " at line -->" + call.getLocation().getEndLine()+ " <-- has a format string with a %s specifier --> "+
  sink.getValueText()
