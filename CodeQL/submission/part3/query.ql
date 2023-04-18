import cpp 
import semmle.code.cpp.controlflow.Guards
import semmle.code.cpp.valuenumbering.HashCons


// Non returning function call (abort, exit, etc..) 
class Terminator extends FunctionCall {
  Terminator() {
        not exists(this.(ControlFlowNode).getASuccessor()) // function call which has no successors 
        or
        exists( Terminator SomeTerminalCall | getTarget() = SomeTerminalCall.getEnclosingFunction()) 
    }
}
// A call to realloc which is of the form v = realloc (v, size), for some variable v.

// An Illegal realloc call is a realloc call that assigns to the same memory it accepts --> directly
class IllegalReallocCall extends FunctionCall {
    Variable Memory;
  
    IllegalReallocCall() {
      // Constructor Predicate --> 
      // The Root Cause is at the assignment --> if you are assigning to same value, its illegal
      // Check for that first
      exists(AssignExpr IllegalAssignment |
        this.getTarget().hasGlobalOrStdName("realloc") and //Stage 1 --> Expression Realloc
        this = IllegalAssignment.getRValue() and // Stage 2 --> Realloc is on the RHS
        hashCons(IllegalAssignment.getLValue()) = hashCons(this.getArgument(0)) and // Stage 3 (core illegality) --> hashCons (expression content) on LHS and Realloc Arg 0 are same
        Memory.getAnAccess() = this.getArgument(0) // Stage 4 --> Catch hold of the memory that is at the core of this illegality
      )
    }
  
    // Effort to reduce false positives 
    // Many places after illegal assigment, (buf = realloc(buf...) --> the buf is checked for NULL)
    // If we are exiting on buf == NULL --> No problem --> Since whole memory allocated to this process on RAM is freed.
    // Hence check for terminating calls -->
    predicate isTerminallyGuarded() {
      // We gon make use of control flow guards here 
      // If the Possibly Illegal Memory is guarded (in a way leading to a termination) following the call
      // We are not gon flag this illegal -->
      exists(GuardCondition BBG, Terminator exit |
        this.(ControlFlowNode).getASuccessor*() = BBG and //Among all successors down the AST, look for a guard to the Memory that leads to terminator if violated 
        BBG.getAChild*() = Memory.getAnAccess() and
        BBG.controls(exit.getBasicBlock(), _)
      )
    }
  }

from IllegalReallocCall illegalCall
where not illegalCall.isTerminallyGuarded()
select illegalCall,
"The call -->" + illegalCall.getTarget().getName() +
  " <--in file named--> " + illegalCall.getLocation().getFile().getRelativePath() + " at line -->" + illegalCall.getLocation().getEndLine()+  " has a chance of causing memory leak in the program"
