#include "DataflowAnalysis.h"

using namespace llvm;

namespace dataflow {

//===----------------------------------------------------------------------===//
// Memory Access
//===----------------------------------------------------------------------===//

const char *WhiteSpaces = " \t\n\r";

std::string variable(Value *V) {
  std::string Code;
  raw_string_ostream SS(Code);
  V->print(SS);
  Code.erase(0, Code.find_first_not_of(WhiteSpaces));
  return Code;
}

std::string address(Value *V) {
  std::string Code;
  raw_string_ostream SS(Code);
  V->print(SS);
  Code.erase(0, Code.find_first_not_of(WhiteSpaces));
  Code = "@(" + Code + ")";
  return Code;
}

//===----------------------------------------------------------------------===//
// Dataflow Analysis Implementation
//===----------------------------------------------------------------------===//

DataflowAnalysis::DataflowAnalysis(char ID) : FunctionPass(ID) {}

void DataflowAnalysis::collectErrorInsts(Function &F) {
  for (inst_iterator I = inst_begin(F), E = inst_end(F); I != E; ++I) {
    if (check(&*I))
      ErrorInsts.insert(&*I);
  }
}

bool DataflowAnalysis::runOnFunction(Function &F) {
  outs() << "Running " << getAnalysisName() << " on " << F.getName() << "\n";
  for (inst_iterator I = inst_begin(F), E = inst_end(F); I != E; ++I) {
    InMap[&(*I)] = new Memory;
    OutMap[&(*I)] = new Memory;
  }

  /*
   * The only extra thing here is thatWe perform Global Pointer Analysis  --> Which basically keeps track of Pointers
   * In order to perform Pointer Aliasing
   *
   * TODO: THIS BUILDS A Points-To-Graph.
   * TODO: This basically represents a mapping from variables to a PointsToSet <-- Which is the set of allocation sites
   * TODO: a variable can point to.
   *
   * TODO: To model a memory location that corresponds to variable %a (variable(I1)) you can use --> address (i1)
   * Similarly you can model memory locations of other variables (instructions) too.
   *
   * Now here's the best part -->
   * If you are making another pointer point to the address of some other variable -->
   * sstore i32* %a, i32** %c, align 8 -->
   * TODO: Here memory allocated at I2 (%c alloca i32*) will store the mmeomry location allocated at I1 (%a alloca i32)
   * using PointsToSet = std::set<std::string>;
     using PointsToInfo = std::map<std::string, PointsToSet>;
   * TODO: Now PointsToInfo is just a type --> THe actual Object is PointsToInfo PointsTo
   *
   * TODO: Now to store information of an Address <-- You would generally look at Load and Store Instructions
   * */
  PointerAnalysis *PA = new PointerAnalysis(F);
  doAnalysis(F, PA);

  collectErrorInsts(F);
  outs() << "Potential Instructions by " << getAnalysisName() << ": \n";
  for (auto I : ErrorInsts) {
    outs() << *I << "\n";
  }

  for (inst_iterator I = inst_begin(F), E = inst_end(F); I != E; ++I) {
    delete InMap[&(*I)];
    delete OutMap[&(*I)];
  }
  return false;
}
} // namespace dataflow
