#include "Instrument.h"

using namespace llvm;

namespace instrument {
/*
 * Implement your instrumentation for dynamic symbolic execution engine
 */

    void InstrumentForDSEInitInstruction(Instruction *pCurrInstruction, Module *pModule) {

        // Step 1: Create the LLVM function we want to call
        //void __DSE_Init__(void) -->  this be the signature
        auto VoidTyp = Type::getVoidTy(pModule->getContext());
        std::vector<Type*>ParamTyps;
        ParamTyps.push_back(VoidTyp);
        auto CoverageCallFuncCallee = pModule->getOrInsertFunction(DSEInitFunctionName, // Name of the Function to Call
                                                                   FunctionType::get(VoidTyp,// Return Type
                                                                                     ParamTyps,
                                                                                     false
                                                                   ));
        auto F = dyn_cast<Constant>(CoverageCallFuncCallee.getCallee());
        Function* SanFunc = cast<Function>(F);
        // Step 2: Now that our Function is ready, we shall Call if with the right parameters
        // First lets generate the arguments (we intend to pass) from the pInstruction
        // But this function got no arguments, so we finna leave Args empty
        std::vector<Value*> Args;

        IRBuilder<> Blr(pCurrInstruction);

        //Step 3: Now Create the Call instruction
        CallInst *Call = Blr.CreateCall(SanFunc,Args);
        Call->setCallingConv(CallingConv::C);
        Call->setTailCall(true);
        return;
    }

    void InstrumentForDSEAllocaInstruction(Instruction *pCurrInstruction, Module *pModule, Value* Arg1_int32Typ, Value* Arg2_int32ptrType) {

        // Step 1: Create the LLVM function we want to call
        //void __DSE_Alloca__(int R, int *Ptr)  -->  this be the signature
        auto VoidTyp = Type::getVoidTy(pModule->getContext());
        auto Int32Typ = Type::getInt32Ty(pModule->getContext());
        auto Int32PtrTyp = Type::getInt32PtrTy(pModule->getContext());
        std::vector<Type*>ParamTyps;
        ParamTyps.push_back(Int32Typ); ParamTyps.push_back(Int32PtrTyp); // Push Arguments
        auto CoverageCallFuncCallee = pModule->getOrInsertFunction(DSEAllocaFunctionName, // Name of the Function to Call
                                                                   FunctionType::get(VoidTyp,// Return Type
                                                                                     ParamTyps,
                                                                                     false
                                                                   ));
        auto F = dyn_cast<Constant>(CoverageCallFuncCallee.getCallee());
        Function* SanFunc = cast<Function>(F);
        // Step 2: Now that our Function is ready, we shall Call if with the right parameters
        // First lets generate the arguments (we intend to pass) from the pInstruction
        std::vector<Value*> Args;
        Args.push_back(Arg1_int32Typ);
        Args.push_back(Arg2_int32ptrType);
        IRBuilder<> Blr(pCurrInstruction);

        //Step 3: Now Create the Call instruction
        CallInst *Call = Blr.CreateCall(SanFunc,Args);
        Call->setCallingConv(CallingConv::C);
        Call->setTailCall(true);
        return;
    }

    void InstrumentForDSEStoreInstruction(Instruction *pCurrInstruction, Module *pModule, Value* Arg1_int32ptrType) {

        // Step 1: Create the LLVM function we want to call
        //void __DSE_Store__(int *X)  -->  this be the signature
        auto VoidTyp = Type::getVoidTy(pModule->getContext());
        auto Int32PtrTyp = Type::getInt32PtrTy(pModule->getContext());
        std::vector<Type*>ParamTyps;
        ParamTyps.push_back(Int32PtrTyp); // Push Arguments
        auto CoverageCallFuncCallee = pModule->getOrInsertFunction(DSEStoreFunctionName, // Name of the Function to Call
                                                                   FunctionType::get(VoidTyp,// Return Type
                                                                                     ParamTyps,
                                                                                     false
                                                                   ));
        auto F = dyn_cast<Constant>(CoverageCallFuncCallee.getCallee());
        Function* SanFunc = cast<Function>(F);
        // Step 2: Now that our Function is ready, we shall Call if with the right parameters
        // First lets generate the arguments (we intend to pass) from the pInstruction
        std::vector<Value*> Args;
        Args.push_back(Arg1_int32ptrType);
        IRBuilder<> Blr(pCurrInstruction);

        //Step 3: Now Create the Call instruction
        CallInst *Call = Blr.CreateCall(SanFunc,Args);
        Call->setCallingConv(CallingConv::C);
        Call->setTailCall(true);
        return;
    }

    void InstrumentForDSELoadInstruction(Instruction *pCurrInstruction, Module *pModule,  Value* Arg1_int32Typ, Value* Arg2_int32ptrType) {

        // Step 1: Create the LLVM function we want to call
        // void __DSE_Load__(int Y, int *X) -->  this be the signature
        auto VoidTyp = Type::getVoidTy(pModule->getContext());
        auto Int32Typ = Type::getInt32Ty(pModule->getContext());
        auto Int32PtrTyp = Type::getInt32PtrTy(pModule->getContext());
        std::vector<Type*>ParamTyps;
        ParamTyps.push_back(Int32Typ); ParamTyps.push_back(Int32PtrTyp); // Push Arguments
        auto CoverageCallFuncCallee = pModule->getOrInsertFunction(DSELoadFunctionName, // Name of the Function to Call
                                                                   FunctionType::get(VoidTyp,// Return Type
                                                                                     ParamTyps,
                                                                                     false
                                                                   ));
        auto F = dyn_cast<Constant>(CoverageCallFuncCallee.getCallee());
        Function* SanFunc = cast<Function>(F);
        // Step 2: Now that our Function is ready, we shall Call if with the right parameters
        // First lets generate the arguments (we intend to pass) from the pInstruction
        std::vector<Value*> Args;
        Args.push_back(Arg1_int32Typ);
        Args.push_back(Arg2_int32ptrType);
        IRBuilder<> Blr(pCurrInstruction);

        //Step 3: Now Create the Call instruction
        CallInst *Call = Blr.CreateCall(SanFunc,Args);
        Call->setCallingConv(CallingConv::C);
        Call->setTailCall(true);
        return;
    }

    void InstrumentForDSEConstInstruction(Instruction *pCurrInstruction, Module *pModule,  Value* Arg1_int32Typ) {

        // Step 1: Create the LLVM function we want to call
        // void __DSE_Const__(int X) -->  this be the signature
        auto VoidTyp = Type::getVoidTy(pModule->getContext());
        auto Int32Typ = Type::getInt32Ty(pModule->getContext());
        std::vector<Type*>ParamTyps;
        ParamTyps.push_back(Int32Typ); // Push Arguments
        auto CoverageCallFuncCallee = pModule->getOrInsertFunction(DSEConstFunctionName, // Name of the Function to Call
                                                                   FunctionType::get(VoidTyp,// Return Type
                                                                                     ParamTyps,
                                                                                     false
                                                                   ));
        auto F = dyn_cast<Constant>(CoverageCallFuncCallee.getCallee());
        Function* SanFunc = cast<Function>(F);
        // Step 2: Now that our Function is ready, we shall Call if with the right parameters
        // First lets generate the arguments (we intend to pass) from the pInstruction
        std::vector<Value*> Args;
        Args.push_back(Arg1_int32Typ);
        IRBuilder<> Blr(pCurrInstruction);

        //Step 3: Now Create the Call instruction
        CallInst *Call = Blr.CreateCall(SanFunc,Args);
        Call->setCallingConv(CallingConv::C);
        Call->setTailCall(true);
        return;
    }

    void InstrumentForDSERegisterInstruction(Instruction *pCurrInstruction, Module *pModule,  Value* Arg1_int32Typ) {

        // Step 1: Create the LLVM function we want to call
        // void __DSE_Const__(int X) -->  this be the signature
        auto VoidTyp = Type::getVoidTy(pModule->getContext());
        auto Int32Typ = Type::getInt32Ty(pModule->getContext());
        std::vector<Type*>ParamTyps;
        ParamTyps.push_back(Int32Typ); // Push Arguments
        auto CoverageCallFuncCallee = pModule->getOrInsertFunction(DSERegisterFunctionName, // Name of the Function to Call
                                                                   FunctionType::get(VoidTyp,// Return Type
                                                                                     ParamTyps,
                                                                                     false
                                                                   ));
        auto F = dyn_cast<Constant>(CoverageCallFuncCallee.getCallee());
        Function* SanFunc = cast<Function>(F);
        // Step 2: Now that our Function is ready, we shall Call if with the right parameters
        // First lets generate the arguments (we intend to pass) from the pInstruction
        std::vector<Value*> Args;
        Args.push_back(Arg1_int32Typ);
        IRBuilder<> Blr(pCurrInstruction);

        //Step 3: Now Create the Call instruction
        CallInst *Call = Blr.CreateCall(SanFunc,Args);
        Call->setCallingConv(CallingConv::C);
        Call->setTailCall(true);
        return;
    }

    void InstrumentForDSEIcmpInstruction(Instruction *pCurrInstruction, Module *pModule,  Value* Arg1_int32Typ, Value* Arg2_int32Typ) {

        // Step 1: Create the LLVM function we want to call
        // void __DSE_ICmp__(int R, int Op) -->  this be the signature
        auto VoidTyp = Type::getVoidTy(pModule->getContext());
        auto Int32Typ = Type::getInt32Ty(pModule->getContext());
        std::vector<Type*>ParamTyps;
        ParamTyps.push_back(Int32Typ); ParamTyps.push_back(Int32Typ); // Push Arguments
        auto CoverageCallFuncCallee = pModule->getOrInsertFunction(DSEICmpFunctionName, // Name of the Function to Call
                                                                   FunctionType::get(VoidTyp,// Return Type
                                                                                     ParamTyps,
                                                                                     false
                                                                   ));
        auto F = dyn_cast<Constant>(CoverageCallFuncCallee.getCallee());
        Function* SanFunc = cast<Function>(F);
        // Step 2: Now that our Function is ready, we shall Call if with the right parameters
        // First lets generate the arguments (we intend to pass) from the pInstruction
        std::vector<Value*> Args;
        Args.push_back(Arg1_int32Typ);
        Args.push_back(Arg2_int32Typ);
        IRBuilder<> Blr(pCurrInstruction);

        //Step 3: Now Create the Call instruction
        CallInst *Call = Blr.CreateCall(SanFunc,Args);
        Call->setCallingConv(CallingConv::C);
        Call->setTailCall(true);
        return;
    }


    void InstrumentForDSEBranchInstruction(Instruction *pCurrInstruction, Module *pModule,  Value* Arg1_int32Typ, Value* Arg2_int32Typ, Value* Arg3_int32Typ) {

        // Step 1: Create the LLVM function we want to call
        // void __DSE_Branch__(int BID, int RID, int B) -->  this be the signature
        auto VoidTyp = Type::getVoidTy(pModule->getContext());
        auto Int32Typ = Type::getInt32Ty(pModule->getContext());
        std::vector<Type*>ParamTyps;
        ParamTyps.push_back(Int32Typ); ParamTyps.push_back(Int32Typ); ParamTyps.push_back(Int32Typ); // Push Arguments
        auto CoverageCallFuncCallee = pModule->getOrInsertFunction(DSEBranchFunctionName, // Name of the Function to Call
                                                                   FunctionType::get(VoidTyp,// Return Type
                                                                                     ParamTyps,
                                                                                     false
                                                                   ));
        auto F = dyn_cast<Constant>(CoverageCallFuncCallee.getCallee());
        Function* SanFunc = cast<Function>(F);
        // Step 2: Now that our Function is ready, we shall Call if with the right parameters
        // First lets generate the arguments (we intend to pass) from the pInstruction
        std::vector<Value*> Args;
        Args.push_back(Arg1_int32Typ);
        Args.push_back(Arg2_int32Typ);
        Args.push_back(Arg3_int32Typ);
        IRBuilder<> Blr(pCurrInstruction);

        //Step 3: Now Create the Call instruction
        CallInst *Call = Blr.CreateCall(SanFunc,Args);
        Call->setCallingConv(CallingConv::C);
        Call->setTailCall(true);
        return;
    }

    void InstrumentForDSEBinOpInstruction(Instruction *pCurrInstruction, Module *pModule,  Value* Arg1_int32Typ, Value* Arg2_int32Typ) {

        // Step 1: Create the LLVM function we want to call
        // void __DSE_BinOp__(int R, int Op) -->  this be the signature
        auto VoidTyp = Type::getVoidTy(pModule->getContext());
        auto Int32Typ = Type::getInt32Ty(pModule->getContext());
        std::vector<Type*>ParamTyps;
        ParamTyps.push_back(Int32Typ); ParamTyps.push_back(Int32Typ); // Push Arguments
        auto CoverageCallFuncCallee = pModule->getOrInsertFunction(DSEBinOpFunctionName, // Name of the Function to Call
                                                                   FunctionType::get(VoidTyp,// Return Type
                                                                                     ParamTyps,
                                                                                     false
                                                                   ));
        auto F = dyn_cast<Constant>(CoverageCallFuncCallee.getCallee());
        Function* SanFunc = cast<Function>(F);
        // Step 2: Now that our Function is ready, we shall Call if with the right parameters
        // First lets generate the arguments (we intend to pass) from the pInstruction
        std::vector<Value*> Args;
        Args.push_back(Arg1_int32Typ);
        Args.push_back(Arg2_int32Typ);
        IRBuilder<> Blr(pCurrInstruction);

        //Step 3: Now Create the Call instruction
        CallInst *Call = Blr.CreateCall(SanFunc,Args);
        Call->setCallingConv(CallingConv::C);
        Call->setTailCall(true);
        return;
    }

    void InstructionEvaluatorAndInstrumentor(Instruction* I)
{
        // if the instruction has no previous instruction, its the first instruction,
        // we gotta insert dse init here -->
        if (I->getPrevNode() == NULL)
        {
            // This be the first instruction

        }
}
bool Instrument::runOnFunction(Function &F) {
  /* Add your code here */

  return true;
}

char Instrument::ID = 1;
static RegisterPass<Instrument>
    X("Instrument", "Instrumentations for Dynamic Symbolic Execution", false,
      false);

} // namespace instrument
