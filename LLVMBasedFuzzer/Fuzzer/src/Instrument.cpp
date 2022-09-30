#include "Instrument.h"
#include "llvm/ADT/SetVector.h"
using namespace llvm;

namespace instrument {

static const char *SanitizerFunctionName = "__sanitize__";
static const char *CoverageFunctionName = "__coverage__";

    void InstrumentForCoverageAtInstruction(Instruction *pInstruction, Module *pModule);
    void InstrumentForSanitizerAtInstruction(Instruction *pInstruction, Module *pModule, Value* Divisor);
/*
 * Implement divide-by-zero sanitizer.
 */
void instrumentSanitize(Module *M, Function &F, Instruction *I) {
  /* Add you code here */
 //Step 2 --> Now Insert Special Sanitizers for Div/Zero
 BinaryOperator* BinOp = dyn_cast<BinaryOperator>(I);
 if(BinOp && (BinOp->getOpcode() == Instruction::FDiv
          || BinOp->getOpcode() == Instruction::SDiv
          || BinOp->getOpcode() == Instruction::UDiv)){
    Value* Divisor = BinOp->getOperand(1);
    InstrumentForSanitizerAtInstruction(I, M, Divisor);
  }
}

    void InstrumentForCoverageAtInstruction(Instruction *pInstruction, Module *pModule) {
    // Step 1: Create the LLVM function we want to call
    auto VoidTyp = Type::getVoidTy(pModule->getContext());
    auto Int32Typ = Type::getInt32Ty(pModule->getContext());
    std::vector<Type*>ParamTyps;
    ParamTyps.push_back(Int32Typ); ParamTyps.push_back(Int32Typ);
    auto CoverageCallFuncCallee = pModule->getOrInsertFunction("__coverage__", // Name of the Function to Call
        FunctionType::get(VoidTyp,// Return Type
                          ParamTyps,
                          false// Arg2 --> col
        ));
    auto F = dyn_cast<Constant>(CoverageCallFuncCallee.getCallee());
    Function* CovFunc = cast<Function>(F);
    // Step 2: Now that our Function is ready, we shall Call if with the right parameters
    // First lets generate the arguments (we intend to pass) from the pInstruction

    DILocation *Loc = pInstruction->getDebugLoc();
    if(!Loc)
        return;
    auto LineArg = Loc->getLine();
    auto ColArg = Loc->getColumn();
    llvm::Type *i32_type = llvm::IntegerType::getInt32Ty(pModule->getContext());
    llvm::Constant *LineArgVal = llvm::ConstantInt::get(i32_type, LineArg, false);
    llvm::Constant *ColArgVal = llvm::ConstantInt::get(i32_type, ColArg, false);
    std::vector<Value*> Args;
    Args.push_back(LineArgVal);
    Args.push_back(ColArgVal);
    IRBuilder<> Blr(pInstruction);

    //Step 3: Now Create the Call instruction
    CallInst *Call = Blr.CreateCall(CovFunc,Args);
   Call->setCallingConv(CallingConv::C);
   Call->setTailCall(true);
    return;
    }

    void InstrumentForSanitizerAtInstruction(Instruction *pInstruction, Module *pModule, Value* Divisor) {
        // Step 1: Create the LLVM function we want to call
        auto VoidTyp = Type::getVoidTy(pModule->getContext());
        auto Int32Typ = Type::getInt32Ty(pModule->getContext());
        std::vector<Type*>ParamTyps;
        ParamTyps.push_back(Int32Typ); ParamTyps.push_back(Int32Typ);ParamTyps.push_back(Int32Typ);
        auto CoverageCallFuncCallee = pModule->getOrInsertFunction("__sanitize__", // Name of the Function to Call
                                                                   FunctionType::get(VoidTyp,// Return Type
                                                                                     ParamTyps,
                                                                                     false
                                                                   ));
        auto F = dyn_cast<Constant>(CoverageCallFuncCallee.getCallee());
        Function* SanFunc = cast<Function>(F);
        // Step 2: Now that our Function is ready, we shall Call if with the right parameters
        // First lets generate the arguments (we intend to pass) from the pInstruction
        auto DebugLoc = pInstruction->getDebugLoc();
        auto LineArg = DebugLoc->getLine();
        auto ColArg = DebugLoc.getCol();
        llvm::Type *i32_type = llvm::IntegerType::getInt32Ty(pModule->getContext());
        llvm::Constant *LineArgVal = llvm::ConstantInt::get(i32_type, LineArg, false);
        llvm::Constant *ColArgVal = llvm::ConstantInt::get(i32_type, ColArg, false);
        std::vector<Value*> Args;

        Args.push_back(Divisor);
        Args.push_back(LineArgVal);
        Args.push_back(ColArgVal);


        IRBuilder<> Blr(pInstruction);

        //Step 3: Now Create the Call instruction
        CallInst *Call = Blr.CreateCall(SanFunc,Args);
        Call->setCallingConv(CallingConv::C);
        Call->setTailCall(true);
        return;
    }
/*
 * Implement code coverage instrumentation.
 */
void instrumentCoverage(Module *M, Function &F, Instruction *I) {
  /* Add you code here */
  return InstrumentForCoverageAtInstruction(I, M);
}

bool Instrument::runOnFunction(Function &F) {
  /* Add you code here */
    /*
   * Yo Whatsup G-->
   * We gon iterate through all the instructions of a function and
   * look do the following.
   * a.) Insert Coverage Function for this instruction, if there exists a debugLoc for it
   * b.) If the instruction is a binary operator instruction that performs a division, then you gon
   * insert a instrumentation __sanitize__ on the second operand of the Division instruction right before the actual
   * div Operation
   */
    SetVector<Instruction *> WorkSet;
//    outs() << "Running " << "LLVM DivSan Pass" << " on " << F.getName() << "\n";
    for (auto &BB:F) {
        for(auto &Instruction: BB)
        {
//            outs() << "Dealing with Instruction \n" <<"\n";
//            Instruction.print(outs());
//            outs() <<"\n";

            //Step 1 --> Insert Coverage (Literally every Function gets it)-->
            instrumentCoverage(F.getParent(), F, &Instruction);
            instrumentSanitize(F.getParent(), F, &Instruction);
        }
    }
  return true;
}

char Instrument::ID = 1;
static RegisterPass<Instrument>
    X("Instrument", "Instrumentations for Dynamic Analysis", false, false);

} // namespace instrument
