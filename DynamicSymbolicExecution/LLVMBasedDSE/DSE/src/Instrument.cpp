#include <iostream>
#include "Instrument.h"

using namespace llvm;

namespace instrument {
/*
 * Implement your instrumentation for dynamic symbolic execution engine
 */

    void InstrumentForDSEInitInstruction(Function &F, BasicBlock &BB) {

        // Step 1: Create the LLVM function we want to call
        //void __DSE_Init__(void) -->  this be the signature
        auto VoidTyp = Type::getVoidTy(F.getContext());
        auto CoverageCallFuncCallee = F.getParent()->getOrInsertFunction(DSEInitFunctionName, // Name of the Function to Call
                                                                   FunctionType::get(VoidTyp,// Return Type
                                                                                     false
                                                                   ));
        auto Func = dyn_cast<Constant>(CoverageCallFuncCallee.getCallee());
        Function* SanFunc = cast<Function>(Func);
        // Step 2: Now that our Function is ready, we shall Call if with the right parameters
        // First lets generate the arguments (we intend to pass) from the pInstruction
        // But this function got no arguments, so we finna leave Args empty
        std::vector<Value*> Args;
        IRBuilder<> Blr(&*BB.begin());
        //Step 3: Now Create the Call instruction
        Blr.CreateCall(SanFunc);
        return;
    }

    void InstrumentForDSEAllocaInstruction(Instruction *pCurrInstruction, Value* Arg1_int32Typ, Value* Arg2_int32ptrType) {

        // Step 1: Create the LLVM function we want to call
        //void __DSE_Alloca__(int R, int *Ptr)  -->  this be the signature
        auto VoidTyp = Type::getVoidTy(pCurrInstruction->getModule()->getContext());
        auto Int32Typ = Type::getInt32Ty(pCurrInstruction->getModule()->getContext());
        auto Int32PtrTyp = Type::getInt32PtrTy(pCurrInstruction->getModule()->getContext());
        std::vector<Type*>ParamTyps;
        ParamTyps.push_back(Int32Typ); ParamTyps.push_back(Int32PtrTyp); // Push Arguments
        auto CoverageCallFuncCallee = pCurrInstruction->getModule()->getOrInsertFunction(DSEAllocaFunctionName, // Name of the Function to Call
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
        IRBuilder<> Blr(pCurrInstruction->getNextNode());
        //Step 3: Now Create the Call instruction
        Blr.CreateCall(SanFunc,Args);
        return;
    }

    void InstrumentForDSEStoreInstruction(Instruction *pCurrInstruction, Value* Arg1_int32ptrType) {

        // Step 1: Create the LLVM function we want to call
        //void __DSE_Store__(int *X)  -->  this be the signature
        auto VoidTyp = Type::getVoidTy(pCurrInstruction->getModule()->getContext());
        auto Int32PtrTyp = Type::getInt32PtrTy(pCurrInstruction->getModule()->getContext());
        std::vector<Type*>ParamTyps;
        ParamTyps.push_back(Int32PtrTyp); // Push Arguments
        auto CoverageCallFuncCallee = pCurrInstruction->getModule()->getOrInsertFunction(DSEStoreFunctionName, // Name of the Function to Call
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
        return;
    }

    void InstrumentForDSELoadInstruction(Instruction *pCurrInstruction,  Value* Arg1_int32Typ, Value* Arg2_int32ptrType) {

        // Step 1: Create the LLVM function we want to call
        // void __DSE_Load__(int Y, int *X) -->  this be the signature
        auto VoidTyp = Type::getVoidTy(pCurrInstruction->getModule()->getContext());
        auto Int32Typ = Type::getInt32Ty(pCurrInstruction->getModule()->getContext());
        auto Int32PtrTyp = Type::getInt32PtrTy(pCurrInstruction->getModule()->getContext());
        std::vector<Type*>ParamTyps;
        ParamTyps.push_back(Int32Typ); ParamTyps.push_back(Int32PtrTyp); // Push Arguments
        auto CoverageCallFuncCallee = pCurrInstruction->getModule()->getOrInsertFunction(DSELoadFunctionName, // Name of the Function to Call
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
        return;
    }

    void InstrumentForDSEConstInstruction(Instruction *pCurrInstruction,  Value* Arg1_int32Typ) {

        // Step 1: Create the LLVM function we want to call
        // void __DSE_Const__(int X) -->  this be the signature
        auto VoidTyp = Type::getVoidTy(pCurrInstruction->getModule()->getContext());
        auto Int32Typ = Type::getInt32Ty(pCurrInstruction->getModule()->getContext());
        std::vector<Type*>ParamTyps;
        ParamTyps.push_back(Int32Typ); // Push Arguments
        auto CoverageCallFuncCallee = pCurrInstruction->getModule()->getOrInsertFunction(DSEConstFunctionName, // Name of the Function to Call
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
        return;
    }

    void InstrumentForDSERegisterInstruction(Instruction *pCurrInstruction,  Value* Arg1_int32Typ) {

        // Step 1: Create the LLVM function we want to call
        // void __DSE_Const__(int X) -->  this be the signature
        auto VoidTyp = Type::getVoidTy(pCurrInstruction->getModule()->getContext());
        auto Int32Typ = Type::getInt32Ty(pCurrInstruction->getModule()->getContext());
        std::vector<Type*>ParamTyps;
        ParamTyps.push_back(Int32Typ); // Push Arguments
        auto CoverageCallFuncCallee = pCurrInstruction->getModule()->getOrInsertFunction(DSERegisterFunctionName, // Name of the Function to Call
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
        return;
    }

    void InstrumentForDSEIcmpInstruction(Instruction *pCurrInstruction,  uint32_t Arg1_int32Typ, uint32_t Arg2_int32Typ) {

        // Step 1: Create the LLVM function we want to call
        // void __DSE_ICmp__(int R, int Op) -->  this be the signature
        auto VoidTyp = Type::getVoidTy(pCurrInstruction->getModule()->getContext());
        auto Int32Typ = Type::getInt32Ty(pCurrInstruction->getModule()->getContext());
        std::vector<Type*>ParamTyps;
        ParamTyps.push_back(Int32Typ); ParamTyps.push_back(Int32Typ); // Push Arguments
        auto CoverageCallFuncCallee = pCurrInstruction->getModule()->getOrInsertFunction(DSEICmpFunctionName, // Name of the Function to Call
                                                                   FunctionType::get(VoidTyp,// Return Type
                                                                                     ParamTyps,
                                                                                     false
                                                                   ));
        auto F = dyn_cast<Constant>(CoverageCallFuncCallee.getCallee());
        Function* SanFunc = cast<Function>(F);
        // Step 2: Now that our Function is ready, we shall Call if with the right parameters
        // First lets generate the arguments (we intend to pass) from the pInstruction
        std::vector<Value*> Args;
        llvm::Constant *Arg1 = llvm::ConstantInt::get(Int32Typ, Arg1_int32Typ, false);
        llvm::Constant *Arg2 = llvm::ConstantInt::get(Int32Typ, Arg2_int32Typ, false);
        Args.push_back(Arg1);
        Args.push_back(Arg2);
        IRBuilder<> Blr(pCurrInstruction);

        //Step 3: Now Create the Call instruction
        CallInst *Call = Blr.CreateCall(SanFunc,Args);
        Call->setCallingConv(CallingConv::C);
        return;
    }

    void InstrumentForDSEConditionalBranchInstruction(Instruction *pCurrInstruction,  Function &Func) {

        // Step 1: Create the LLVM function we want to call
        // void __DSE_Branch__(int BID, int RID, int B) -->  this be the signature
        auto VoidTyp = Type::getVoidTy(pCurrInstruction->getModule()->getContext());
        auto Int32Typ = Type::getInt32Ty(pCurrInstruction->getModule()->getContext());
        std::vector<Type *> ParamTyps;
        ParamTyps.push_back(Int32Typ);
        ParamTyps.push_back(Int32Typ);
        ParamTyps.push_back(Int32Typ); // Push Arguments
        auto CoverageCallFuncCallee = pCurrInstruction->getModule()->getOrInsertFunction(
                DSEBranchFunctionName, // Name of the Function to Call
                FunctionType::get(VoidTyp,// Return Type
                                  ParamTyps,
                                  false
                ));
        auto F = dyn_cast<Constant>(CoverageCallFuncCallee.getCallee());
        Function *SanFunc = cast<Function>(F);
        // Step 2: Now that our Function is ready, we shall Call if with the right parameters
        // First lets generate the arguments (we intend to pass) from the pInstruction
        auto Condition = dyn_cast<ICmpInst>(pCurrInstruction->getOperand(0));
        auto TrueCond = pCurrInstruction->getSuccessor(0);
        auto FalseCond = pCurrInstruction->getSuccessor(1);

        auto TrueBB = BasicBlock::Create(pCurrInstruction->getContext(), TrueCond->getName() + ".spl", &Func);
        auto FalseBB = BasicBlock::Create(pCurrInstruction->getContext(), FalseCond->getName() + ".spl", &Func);

        IRBuilder<> TrueBrBlr(TrueBB);
        TrueBrBlr.SetInsertPoint(TrueBB, TrueBB->begin());
        std::vector<Value *> TrueArgs;
        TrueArgs.push_back(TrueBrBlr.getInt32(getBranchID(pCurrInstruction)));
        TrueArgs.push_back(TrueBrBlr.getInt32(getRegisterID(Condition)));
        TrueArgs.push_back(TrueBrBlr.getInt32(1));
        TrueBrBlr.CreateCall(SanFunc, TrueArgs);
        TrueBrBlr.CreateBr(TrueCond);

        IRBuilder<> FalseBrBlr(FalseBB);
        TrueBrBlr.SetInsertPoint(FalseBB, FalseBB->begin());
        std::vector<Value *> FalseArgs;
        FalseArgs.push_back(FalseBrBlr.getInt32(getBranchID(pCurrInstruction)));
        FalseArgs.push_back(FalseBrBlr.getInt32(getRegisterID(Condition)));
        FalseArgs.push_back(FalseBrBlr.getInt32(0));
        FalseBrBlr.CreateCall(SanFunc, FalseArgs);
        FalseBrBlr.CreateBr(TrueCond);

        pCurrInstruction->setSuccessor(0,TrueBB);
        pCurrInstruction->setSuccessor(1,FalseBB);
    }

    void InstrumentForDSEBinOpInstruction(Instruction *pCurrInstruction,  uint32_t Arg1_int32Typ, uint32_t Arg2_int32Typ) {

        // Step 1: Create the LLVM function we want to call
        // void __DSE_BinOp__(int R, int Op) -->  this be the signature
        auto VoidTyp = Type::getVoidTy(pCurrInstruction->getModule()->getContext());
        auto Int32Typ = Type::getInt32Ty(pCurrInstruction->getModule()->getContext());
        std::vector<Type*>ParamTyps;
        ParamTyps.push_back(Int32Typ); ParamTyps.push_back(Int32Typ); // Push Arguments
        auto CoverageCallFuncCallee = pCurrInstruction->getModule()->getOrInsertFunction(DSEBinOpFunctionName, // Name of the Function to Call
                                                                   FunctionType::get(VoidTyp,// Return Type
                                                                                     ParamTyps,
                                                                                     false
                                                                   ));
        auto F = dyn_cast<Constant>(CoverageCallFuncCallee.getCallee());
        Function* SanFunc = cast<Function>(F);
        // Step 2: Now that our Function is ready, we shall Call if with the right parameters
        // First lets generate the arguments (we intend to pass) from the pInstruction
        std::vector<Value*> Args;
        llvm::Constant *Arg1 = llvm::ConstantInt::get(Int32Typ, Arg1_int32Typ, false);
        llvm::Constant *Arg2 = llvm::ConstantInt::get(Int32Typ, Arg2_int32Typ, false);
        Args.push_back(Arg1);
        Args.push_back(Arg2);
        IRBuilder<> Blr(pCurrInstruction);

        //Step 3: Now Create the Call instruction
        CallInst *Call = Blr.CreateCall(SanFunc,Args);
        Call->setCallingConv(CallingConv::C);
        return;
    }

    void InstructionEvaluatorAndInstrumentor(Instruction* I, Function &F)
{
        // if the instruction has no previous instruction, its the first instruction,
        // we gotta insert dse init here -->
//        if (I->getPrevNode() == NULL)
//        {
//            // This be the first instruction
//            InstrumentForDSEInitInstruction(I);
//        }
        IRBuilder<>Blr(&*I);
        if(auto AllocaIns = dyn_cast<AllocaInst>(I))
        {

            InstrumentForDSEAllocaInstruction(AllocaIns, Blr.getInt32(getRegisterID(AllocaIns)), AllocaIns);
        }
        else if (isa<StoreInst>(I))
        {
            auto StoreIns = dyn_cast<StoreInst>(I);
            // Store would be preceeded by two instructions
            // 1.) __DSE_Const__(i32 0) (if const) --------> this will store the constant value that is being stored
            if (auto ConstantStoreValue = dyn_cast<Constant>(StoreIns->getOperand(0)))
                InstrumentForDSEConstInstruction(StoreIns, ConstantStoreValue);
            else
                InstrumentForDSERegisterInstruction(StoreIns, Blr.getInt32(getRegisterID(StoreIns->getOperand(0))));
            InstrumentForDSEStoreInstruction(StoreIns, StoreIns->getOperand(1));
        }
        else if (auto CompareInstValue = dyn_cast<ICmpInst>(I))
        {
            auto FirstOperand = CompareInstValue->getOperand(0);
            auto SecondOperand = CompareInstValue->getOperand(1);

            //Deal with the first operand
            if (auto ConstantFirstOperand = dyn_cast<ConstantInt>(FirstOperand))
                InstrumentForDSEConstInstruction(CompareInstValue, ConstantFirstOperand);
            else
                InstrumentForDSERegisterInstruction(CompareInstValue, Blr.getInt32(getRegisterID(FirstOperand)));

            //Deal with the Second operand
            if (auto ConstantSecondOperand = dyn_cast<ConstantInt>(SecondOperand))
                InstrumentForDSEConstInstruction(CompareInstValue, ConstantSecondOperand);
            else
                InstrumentForDSERegisterInstruction(CompareInstValue, Blr.getInt32(getRegisterID(SecondOperand)));

            // Now call in the Compare instruction

            InstrumentForDSEIcmpInstruction(CompareInstValue, getRegisterID(CompareInstValue), CompareInstValue->getOpcode());
        }
        else if (auto LoadInstValue = dyn_cast<LoadInst>(I))
        {
            InstrumentForDSELoadInstruction(LoadInstValue, Blr.getInt32(getRegisterID(LoadInstValue)), LoadInstValue->getPointerOperand());
        }
        else if (auto BranchInstValue = dyn_cast<BranchInst>(I))
        {
            // First up, finna check if it be conditional or not
            // If branch aint condition, we got nothing to do as its just a jump
            if (BranchInstValue->isConditional())
                InstrumentForDSEConditionalBranchInstruction(BranchInstValue, F);
        }
        else if(auto BinOpInstValue = dyn_cast<BinaryOperator>(I))
        {
            auto FirstOperand = BinOpInstValue->getOperand(0);
            auto SecondOperand = BinOpInstValue->getOperand(1);

            //Deal with the first operand
            if (auto ConstantFirstOperand = dyn_cast<ConstantInt>(FirstOperand))
                InstrumentForDSEConstInstruction(BinOpInstValue, ConstantFirstOperand);
            else
                InstrumentForDSERegisterInstruction(BinOpInstValue, Blr.getInt32(getRegisterID(FirstOperand)));

            //Deal with the Second operand
            if (auto ConstantSecondOperand = dyn_cast<ConstantInt>(SecondOperand))
                InstrumentForDSEConstInstruction(BinOpInstValue, ConstantSecondOperand);
            else
                InstrumentForDSERegisterInstruction(BinOpInstValue, Blr.getInt32(getRegisterID(SecondOperand)));

            InstrumentForDSEBinOpInstruction(BinOpInstValue, getRegisterID(BinOpInstValue), BinOpInstValue->getOpcode());
        }
}
bool Instrument::runOnFunction(Function &F) {
  /* Add your code here */
  for (auto BasicBlockIter = F.begin(); BasicBlockIter != F.end(); ++BasicBlockIter)
  {
      if (BasicBlockIter->getName() == "entry") {
          InstrumentForDSEInitInstruction(F, *BasicBlockIter);
      }

      for (auto InstructionIter = BasicBlockIter->begin(); InstructionIter != BasicBlockIter->end(); InstructionIter++)
      {
          InstructionEvaluatorAndInstrumentor(&*InstructionIter, F);
      }
  }
  return true;
}

char Instrument::ID = 1;
static RegisterPass<Instrument>
    X("Instrument", "Instrumentations for Dynamic Symbolic Execution", false,
      false);

} // namespace instrument
