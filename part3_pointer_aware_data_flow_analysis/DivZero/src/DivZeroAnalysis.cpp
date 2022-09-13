#include "DivZeroAnalysis.h"

namespace dataflow {

//===----------------------------------------------------------------------===//
// Dataflow Analysis Implementation
//===----------------------------------------------------------------------===//

/**
 * Implement your data-flow analysis.
 * 1. Define "flowIn" that joins the memory set of all incoming flows
 * 2. Define "transfer" that computes the semantics of each instruction.
 * 3. Define "flowOut" that flows the memory set to all outgoing flows
 * 4. Define "doAnalysis" that stores your results in "InMap" and "OutMap".
 * 5. Define "check" that checks if a given instruction is erroneous or not.
 */


// define the following functions if needed (not compulsory to do so)
Memory* join(Memory *M1, Memory *M2) {
        Memory* Result = new Memory();

        if ( M1 == NULL)
            return M2;
        else if (M2 == NULL)
            return M1;
        /* Result will be the union of memories M1 and M2 */
        /*
         * This is basically merging of two Maps
         */
        // You can NOT do this, because, there can exist duplicate key-value pairs
        //  Result->insert(M1->begin(), M1->end());
        //  Result->insert(M2->begin(), M2->end());
        for (auto entry1 : *M1) {
            Result->insert(std::pair<std::string, Domain *>(entry1.first, entry1.second));
        }
        for (auto entry2 : *M2)
        {
            // If the entry that you are joining, already inserted, then you do a Domain Join and erase and Insert
            if (Result->find(entry2.first) != Result->end())
            {
                auto PreDom = Result->at(entry2.first);
                auto PostDom = entry2.second;
                auto ResultantDomain = Domain::join(PreDom, PostDom);
                Result->erase(entry2.first);
                Result->insert(std::pair<std::string, Domain *>(entry2.first, ResultantDomain));
            }
            else
                Result->insert(std::pair<std::string, Domain *>(entry2.first, entry2.second));
        }
        return Result;
}

bool equal(Memory *M1, Memory *M2) {
    /* Add your code here */
    /* Return true if the two memories M1 and M2 are equal */
    if ( M1 == NULL || M2 == NULL)
        return false;
    if ( M1->size() != M2->size())
        return false;

    for (auto M1_Elem : *M1)
    {
        std::string M1_ElemVarName = M1_Elem.first;
        Domain* M1_ElemDom = M1_Elem.second;
        if (M2->find(M1_ElemVarName) == M2->end())
            return false;
        Domain* M2_ElemDom = M2->at(M1_ElemVarName);
        if (M2_ElemDom->Value != M1_ElemDom->Value)
            return false;
    }
    return true;

}


void DivZeroAnalysis::flowIn(Instruction *I, Memory *In, Function& function) {
    /* Add your code here
     * Context: Perform the flowIn Operation by joining all OUT sets of incoming flows and saving the result in the IN
     * set for the current Instruction. Here, you will use the entries from the InMap and OutMap that you populated in
     * Part1 (transfer function)as the IN and OUT sets.
     * */

    //Step 1: Fetch predecessors of the Current Instruction
    auto IncomingFlows = getPredecessors(I);
    //Step 2: Join all the OUT Memories for the every instruction in the above set
    Memory* UnionizedMemory = NULL;
    for (auto IncomingFlow : IncomingFlows)
    {
        Memory* MemOfIncomingFlow = OutMap[IncomingFlow];
        std::string tmp ="@(%d = alloca i32*, align 8)";
        if (MemOfIncomingFlow->find(tmp) != MemOfIncomingFlow->end())
        {
            auto dom = MemOfIncomingFlow->at(tmp);
            printf("Domain");
        }
//      llvm::outs()<<"Unionizing Memory of Instruction"
//      << IncomingFlow->getName()<<" that bears string "
//      << MemOfIncomingFlow->operator[](tmp) <<"\n";
        if(!UnionizedMemory)
        {
            UnionizedMemory = MemOfIncomingFlow;
        }

        UnionizedMemory = join(UnionizedMemory, MemOfIncomingFlow);
    }

    if (IncomingFlows.empty() && function.getNumOperands()>0)
    {
        // If there are No incoming flows --> this means that this is the first Instruction
        // Fetch the arguments of the function and declare and define domains for them
        int NumOfArgs = function.getNumOperands();
        Memory* MemOfIncomingArgs = new Memory;
        for (int Arg = 0; Arg> NumOfArgs; Arg++)
        {
            auto argument = function.getOperand(Arg);
            auto DomainOfArg = new Domain(Domain::MaybeZero);
            std::string ArgName = variable(argument);
            MemOfIncomingArgs->insert(std::pair<std::string, Domain*>(ArgName, DomainOfArg));
            if(!UnionizedMemory)
            {
                UnionizedMemory = MemOfIncomingArgs;
            }
            UnionizedMemory = join(UnionizedMemory, MemOfIncomingArgs);
        }
    }
    InMap[I] = UnionizedMemory;
    return;
}


void DivZeroAnalysis::transfer(Instruction *I, const Memory *In, Memory *NOut,
                               PointerAnalysis *PA,
                               SetVector<Value *> PointerSet) {
  /* Add your code here */
  /*
   * This would basically contain the same logic as from Part 2, except for a few minor details --
   * TODO: 1.) Phi Nodes are no Longer required
   * TODO: 2.) Instrument to Handle Load and Store Instructions
   *
   */
    errs()<< "Entered transfer function with Instruction: ";
    I->print(errs());
    errs() <<"\n";


    // First Open up the Instruction
    /*
     * Important: Every Instruction Ever must be handled.
     * Thats Cuz, every instruction results in a variable name that will be used somewhere and you gotta propagate the
     * Domain memory without breaking in middle.
     */
    BinaryOperator* BinOpIns = dyn_cast<BinaryOperator>(I);
    CmpInst* ICompareInst  = dyn_cast<CmpInst>(I);
    ConstantInt* ConstantInst = dyn_cast<ConstantInt>(I);
    CastInst* BitCastInst = dyn_cast<CastInst>(I);
    ReturnInst* RetInst = dyn_cast<ReturnInst>(I);
    BranchInst* BranInst = dyn_cast<BranchInst>(I);
    LoadInst* LoadIns = dyn_cast<LoadInst>(I);
    StoreInst* StoreIns = dyn_cast<StoreInst>(I);
    AllocaInst* AllocIns = dyn_cast<AllocaInst>(I);
    CallInst* CallIns = dyn_cast<CallInst>(I);
    // if Input, then this is an obvious assignment

    /*
     * If you face an alloca instruction, just store it and initialize the memory for it as Uninit
     */

    if (isInput(I))
    {
        // Initialize Memory with MaybeZero since we are reading from the I/P
        std::string nameOfVar = variable(I);
        Domain* MaybeZero = new Domain(Domain::MaybeZero);
        NOut->erase(nameOfVar);
        NOut->insert(std::pair<std::string, Domain*>(nameOfVar, MaybeZero));
    }
    else if (AllocIns)
    {
//        std::string InstName = variable(AllocIns);
//        Domain* Uninit = new Domain(Domain::Uninit); // --> This is because the variable is only allocated, not initialized
//        NOut->erase(InstName);
//        NOut->insert(std::pair<std::string, Domain*>(InstName, Uninit));
// We do nothing here
    }
    else if(LoadIns)
    {
        Value* LoadVal = LoadIns->getPointerOperand();
        // If you are Loading as a Pointer, your LoadValName will be address
        std::string LoadValName = "";
        if (LoadVal->getType()->isPointerTy())
            LoadValName = address(LoadVal);
        else
            LoadValName = variable(LoadVal);

        std::string LoadDstName = "";
        if (LoadIns->getType()->isPointerTy())
            LoadDstName = address(LoadIns);
        else
            LoadDstName = variable(LoadIns);

        Domain* LoadValDomain = NULL;
        if (In->find(LoadValName) != In->end())
            LoadValDomain = In->at(LoadValName);
        else
            LoadValDomain = new Domain(Domain::Uninit);
        NOut->erase(LoadValName);
        NOut->insert(std::pair<std::string, Domain*>(LoadDstName, LoadValDomain));

    }
    else if (CallIns)
    {
        // Only handle calls that return "int" type
        auto RetTy = CallIns->getFunctionType()->getReturnType();
        if (RetTy->isIntegerTy())
        {
            Domain* CallInsDomain = NULL;
            std::string CallInsName = variable(CallIns);
            if (In->find(CallInsName) != In->end())
                CallInsDomain = In->at(CallInsName);
            else
                CallInsDomain = new Domain(Domain::Uninit);
            NOut->erase(CallInsName);
            NOut->insert(std::pair<std::string, Domain*>(CallInsName, CallInsDomain));
        }
    }
    else if (StoreIns)
    {
        // store i32 1, i32* %a --> For Instructions like this, PointerAliasing Does not Come into picture
        // ALl you have to do is, Set the Domain for %a to whatever domain SrcOperand is pointing to.
        // Store Instructions can either add new variables or overwrite existing variables into memory
        // maps.  Now, to update (Nout) memory map, we rely on th pointsTo graph
        Value* StoreSrc = StoreIns->getOperand(0);
        Value* StoreDst = StoreIns->getOperand(1);
        std::string StoreSrcName = "";
        std::string StoreDestVar = variable(StoreDst);
        if(StoreSrc->getType()->isPointerTy())
            StoreSrcName = address(StoreSrc);
        else
            StoreSrcName = variable(StoreSrc);

        std::string StoreDstName = "";
        if(StoreDst->getType()->isPointerTy())
            StoreDstName = address(StoreDst);
        else
            StoreDstName = variable(StoreDst);

        auto SrcConst = dyn_cast<ConstantInt>(StoreSrc);
        Domain* SrcDomain = NULL;
        if (SrcConst != nullptr)
        {
            auto SrcConstantVal = SrcConst->getSExtValue();
            if (SrcConstantVal == 0)
                SrcDomain = new Domain(Domain::Zero);
            else
                SrcDomain = new Domain(Domain::NonZero);
        }
        else
        {
            //fetch the Memory for this Instruction
            if (In->find(StoreSrcName) != In->end())
                SrcDomain = In->at(StoreSrcName);
            else
                SrcDomain = new Domain(Domain::Uninit);
        }
        //Iterate through the Provided PointerSet:
        auto PointsToObj = PA->fetchPointsTo();
        // Abstract Value of first Variable will be the Abstract value just computed/discoverd
        Domain* ResultantDomain = SrcDomain;
        for (auto PointersInPointerSet : PointsToObj)
        {
            std::string SomeOtherPointerVariable = PointersInPointerSet.first;

            if (PA->alias(StoreDestVar, SomeOtherPointerVariable))
            {
                //Get Abstract Value of Two Variables
                Domain* AbstractDomainOfSecondAliasingVar = NULL;
                if (In->find(SomeOtherPointerVariable) != In->end())
                    AbstractDomainOfSecondAliasingVar = In->at(SomeOtherPointerVariable);
                else
                    AbstractDomainOfSecondAliasingVar = new Domain(Domain::Uninit);

                // Step 3 --> Join Both of these Domains
                ResultantDomain = Domain::join(ResultantDomain, AbstractDomainOfSecondAliasingVar);


                // Step 5 --> Update the Memory Map of all May-alias assignments with joined abstract value
                NOut->erase(SomeOtherPointerVariable);
                NOut->insert(std::pair<std::string, Domain *>(SomeOtherPointerVariable,ResultantDomain));
            }

        }
        // Step 4 --> Update the Mmeory map of current assignment with joined abstract value
        NOut->erase(StoreDstName);
        NOut->insert(std::pair<std::string, Domain *>(StoreDstName,SrcDomain));

    }
    else if (BranInst)
    {
        Value* condition;
        Value* false_dst;
        Value* true_dst;
        auto successorsOfBranch = getSuccessors(BranInst);
        if ( BranInst->isConditional())
        {
            condition = BranInst->getOperand(0);
            std::string ConditionVarName = variable(condition);
            llvm::outs() << "Condition of Branch Instr: "
                         <<ConditionVarName<<"\n";
            false_dst = BranInst->getOperand(1);
            std::string FalseDstVarName = variable(false_dst);
            llvm::outs() << "False Destination of Branch Instr: "
                         << FalseDstVarName <<"\n";
            true_dst = BranInst->getOperand(2);
            std::string TrueDstVarName = variable(true_dst);
            llvm::outs() << "True Destination of Branch Instr: "
                         <<TrueDstVarName <<"\n";

        } else {
            std::string DstVarName = variable(successorsOfBranch[0]);
            llvm::outs() << "Destination of Unconditional Branch Instr: "
                         <<DstVarName <<"\n";
        }
    }
    else if(BitCastInst)
    {
        //No Manipulation, Simply propagate the received Memory
        std::string BitCastOperandVarName = variable(BitCastInst->getOperand(0));
        std::string BitCastResultantVarName = variable(BitCastInst);
        NOut->erase(BitCastResultantVarName);
        NOut->insert(std::pair<std::string, Domain*>(BitCastResultantVarName, In->at(BitCastOperandVarName)));
    }
    else if(ConstantInst){
        auto ConstantVal = ConstantInst->getSExtValue();
        std::string ConstantInstName = variable(ConstantInst);
        if (ConstantVal == 0) {
            Domain* Zero = new Domain(Domain::Zero);
            NOut->erase(ConstantInstName);
            NOut->insert(std::pair<std::string, Domain *>(ConstantInstName,Zero));
        }
        else
        {
            Domain* NonZero = new Domain(Domain::NonZero);
            NOut->erase(ConstantInstName);
            NOut->insert(std::pair<std::string, Domain *>(ConstantInstName,NonZero));
        }
    }
    else if (ICompareInst){
        //The resultant Domain for the compare instruction is always MaybeZero
        Value* FirstOp = ICompareInst->getOperand(0);
        Value* SecondOp = ICompareInst->getOperand(1);
        auto FirstOpConst = dyn_cast<ConstantInt>(FirstOp);
        auto SecondOpConst = dyn_cast<ConstantInt>(SecondOp);
        std::string Op1VarName = variable(FirstOp);
        std::string Op2VarName = variable(SecondOp);
        Domain* Op1Domain = NULL;
        Domain* Op2Domain = NULL;
        if(In != NULL)
        {
            auto Op1DomainEntry =In->find(Op1VarName);
            auto Op2DomainEntry = In->find(Op2VarName);
            Op1Domain = Op1DomainEntry->second;
            Op2Domain = Op2DomainEntry->second;
        }
        std::string CompareInstName = variable(ICompareInst);
        Domain* NonZero =  new Domain(Domain::NonZero);
        Domain* Zero =  new Domain(Domain::Zero);
        Domain* MaybeZero =  new Domain(Domain::MaybeZero);
        // If both of the instructions are constants, then we shall manually compare and write the domain
        if (FirstOpConst != nullptr && SecondOpConst != nullptr)
        {
            auto FirstOpConstantVal = FirstOpConst->getSExtValue();
            auto SecondOpConstantVal = SecondOpConst->getSExtValue();

            switch (ICompareInst->getPredicate())
            {
                case CmpInst::ICMP_EQ:
                    if(FirstOpConstantVal == SecondOpConstantVal)
                    {
                        NOut->erase(CompareInstName);
                        NOut->insert(std::pair<std::string, Domain *>(CompareInstName,NonZero));
                    }
                    else
                    {
                        NOut->erase(CompareInstName);
                        NOut->insert(std::pair<std::string, Domain *>(CompareInstName,Zero));
                    }
                    break;
                case CmpInst::ICMP_NE:
                    if(FirstOpConstantVal == SecondOpConstantVal)
                    {
                        NOut->erase(CompareInstName);
                        NOut->insert(std::pair<std::string, Domain *>(CompareInstName,Zero));
                    }
                    else
                    {
                        NOut->erase(CompareInstName);
                        NOut->insert(std::pair<std::string, Domain *>(CompareInstName,NonZero));
                    }
                    break;
                case CmpInst::ICMP_SGE:
                case CmpInst::ICMP_UGE:
                    if(FirstOpConstantVal >= SecondOpConstantVal)
                    {
                        NOut->erase(CompareInstName);
                        NOut->insert(std::pair<std::string, Domain *>(CompareInstName,NonZero));
                    }
                    else
                    {
                        NOut->erase(CompareInstName);
                        NOut->insert(std::pair<std::string, Domain *>(CompareInstName,Zero));
                    }
                    break;
                case CmpInst::ICMP_SGT:
                case CmpInst::ICMP_UGT:
                    if(FirstOpConstantVal > SecondOpConstantVal)
                    {
                        NOut->erase(CompareInstName);
                        NOut->insert(std::pair<std::string, Domain *>(CompareInstName,NonZero));
                    }
                    else
                    {
                        NOut->erase(CompareInstName);
                        NOut->insert(std::pair<std::string, Domain *>(CompareInstName,Zero));
                    }
                    break;
                case CmpInst::ICMP_SLE:
                case CmpInst::ICMP_ULE:
                    if(FirstOpConstantVal <= SecondOpConstantVal)
                    {
                        NOut->erase(CompareInstName);
                        NOut->insert(std::pair<std::string, Domain *>(CompareInstName,NonZero));
                    }
                    else
                    {
                        NOut->erase(CompareInstName);
                        NOut->insert(std::pair<std::string, Domain *>(CompareInstName,Zero));
                    }
                    break;
                case CmpInst::ICMP_SLT:
                case CmpInst::ICMP_ULT:
                    if(FirstOpConstantVal < SecondOpConstantVal)
                    {
                        NOut->erase(CompareInstName);
                        NOut->insert(std::pair<std::string, Domain *>(CompareInstName,NonZero));
                    }
                    else
                    {
                        NOut->erase(CompareInstName);
                        NOut->insert(std::pair<std::string, Domain *>(CompareInstName,Zero));
                    }
                    break;
            }
            return;
        }
        // If the Domain of both the Operands if Zero and the operation is eq, even then resultant
        //domain is Zero
        if ((Op1Domain->Value == Domain::Zero) && ((Op2Domain->Value == Domain::Zero))
            && ICompareInst->getPredicate() == llvm::CmpInst::ICMP_EQ)
        {
            NOut->erase(CompareInstName);
            NOut->insert(std::pair<std::string, Domain *>(CompareInstName,NonZero));
            return;
        }

        // In all Other cases, the resultant is MaybeZero

        NOut->erase(CompareInstName);
        NOut->insert(std::pair<std::string, Domain *>(CompareInstName,MaybeZero));
        return;

    }
    else if (BinOpIns) {
        //First Operand is being assigned to -->
        Value *Op1 = BinOpIns->getOperand(0);
        Value *Op2 = BinOpIns->getOperand(1);
        std::string Op1VarName = variable(Op1);
        std::string Op2VarName = variable(Op2);
        Domain *Op1Domain = NULL;
        Domain *Op2Domain = NULL;
        auto FirstOpConst = dyn_cast<ConstantInt>(Op1);
        auto SecondOpConst = dyn_cast<ConstantInt>(Op2);
        Domain *ResultantDomain = NULL;
        // If this Instruction itself is NULL in the InMap, it means this instruction is Unreachable
        std::string InstructionVarName = variable(BinOpIns);
        if (In != NULL && In->find(InstructionVarName) != In->end() &&
            In->at(InstructionVarName)->Value == Domain::Uninit)
        {
            // This means this Instruction is Unreachable
            ResultantDomain = new Domain(Domain::Uninit);
            NOut->erase(InstructionVarName);
            NOut->insert(std::pair<std::string, Domain *>(InstructionVarName, ResultantDomain));
            return;
        }

        if (In != NULL && (In->find(Op1VarName) != In->end()))
            Op1Domain = In->at(Op1VarName);
        else if (FirstOpConst)
        {
            auto FirstOpConstantVal = FirstOpConst->getSExtValue();
            if (FirstOpConstantVal == 0)
                Op1Domain = new Domain(Domain::Zero);
            else
                Op1Domain = new Domain(Domain::NonZero);
        }

        if (In != NULL && (In->find(Op2VarName) != In->end()))
            Op2Domain = In->at(Op2VarName);


        else if (SecondOpConst)
        {
            auto SecondOpConstantVal = SecondOpConst->getSExtValue();
            if (SecondOpConstantVal == 0)
                Op2Domain = new Domain(Domain::Zero);
            else
                Op2Domain = new Domain(Domain::NonZero);
        }

        if (Op1Domain == NULL)
            Op1Domain = new Domain(Domain::Uninit);

        if (Op2Domain == NULL)
            Op2Domain = new Domain(Domain::Uninit);

        switch (BinOpIns->getOpcode()) {
            // Check that integer arithmetic operators are only used with
            // integral operands.
            case Instruction::Add:
                //Resultant domain would be the add of Op1 and Op2 domains
                ResultantDomain = Domain::add(Op1Domain, Op2Domain);
                break;
            case Instruction::Sub:
                ResultantDomain = Domain::sub(Op1Domain, Op2Domain);
                break;
            case Instruction::Mul:
                ResultantDomain = Domain::mul(Op1Domain, Op2Domain);
                break;
            case Instruction::SDiv:
            case Instruction::UDiv:
            case Instruction::FDiv:
                ResultantDomain = Domain::div(Op1Domain, Op2Domain);
                break;
            default:
                assert(false && "Oh Snap! Unknown Instruction Type encountered");
        }
        NOut->erase(InstructionVarName);
        NOut->insert(std::pair<std::string, Domain *>(InstructionVarName, ResultantDomain));
    }
    // As of Now I shall treat all other instructions as NOP on Out Memory State
}

void DivZeroAnalysis::flowOut(Instruction *I, Memory *Pre, Memory *Post,  SetVector <Instruction *> &WorkSet) {
    /* Add your code here */
    /*
     * Context: Perform the flowOut Operation by updating the WorkSet accordingly.
     * The current Instruction's successors should be added only if the OUT set was changed by the transfer function.
     */
    auto successors = getSuccessors(I);
    if(!equal(Pre, Post))
    {
        for (auto SuccessiveInst : successors)
        {
            WorkSet.insert(SuccessiveInst);
        }
        // The current Instruction's Successors must be added, NOT the current Instruction
        auto temp = join(Pre, Post);
        *Post = *temp;
    }
}

void DivZeroAnalysis::doAnalysis(Function &F, PointerAnalysis *PA) {
  /* Add your code here */
  SetVector<Instruction *> WorkSet;
  SetVector<Value *> PointerSet;
  for (inst_iterator I = inst_begin(F), E = inst_end(F); I != E; ++I) {
    WorkSet.insert(&(*I));
    // By the End of the Pass, this should contain all the pointers Of the Pass.
    PointerSet.insert(&(*I));
  }

    //iterate through the Workset --> Instructions that need additional work
    do {
        SetVector<Instruction*>SampleWorkSet;
        for (auto InstructionThatNeedsWork: WorkSet) {
            /* Add your code here */
            /* Basic Workflow-
                 Visit instruction in WorkSet
                 For each visited instruction I, construct its In memory by joining all memory sets of incoming flows (predecessors of I)
                 Based on the type of instruction I and the In memory, populate the NOut memory
                 Based on the previous Out memory and the current Out memory, check if there is a difference between the two and
                   flow the memory set appropriately to all successors of I and update WorkSet accordingly
            */

            /*
             * Fetch the input arguments of the Function
             */
            //Step 1: Perform flowIn Operation
            flowIn(InstructionThatNeedsWork, /*Join on all OUT sets of incoming flows must be saved to InMap[Instr]*/
                   InMap[InstructionThatNeedsWork], F);

            //Step 2: Apply Transfer function to populate OUT set for Instruction --> InstructionThatNeedsWork
            Memory *OutMem = new Memory;
            transfer(InstructionThatNeedsWork, InMap[InstructionThatNeedsWork], OutMem, PA, PointerSet);
            //flowOut(InstructionThatNeedsWork, OutMap[InstructionThatNeedsWork], OutMem, SampleWorkSet);
            flowOut(InstructionThatNeedsWork, InMap[InstructionThatNeedsWork], OutMem, SampleWorkSet);
            OutMap[InstructionThatNeedsWork] = OutMem;
            llvm::outs()<<"WorkSet Size "<< WorkSet.size()<<"\n";
        }
        WorkSet = SampleWorkSet;
    } while (WorkSet.size() != 0);
}

bool DivZeroAnalysis::check(Instruction *I) {
    /* Add your code here */
    /*
     * Firstly the incoming Instruction must be a Binary Instruction
     */
    if (auto BinOp = dyn_cast<BinaryOperator>(I))
    {
        // Secondly, the Operator kind must be a divide operator
        if ((BinOp->getOpcode() == Instruction::SDiv) ||
            (BinOp->getOpcode() == Instruction::UDiv) ||(BinOp->getOpcode() == Instruction::FDiv))
        {
            std::string InstructionName = variable(BinOp);
            auto CurrInstructionInMem = InMap[BinOp];
            auto CurrInstructionOutMem = OutMap[BinOp];
            Domain* ResultantDom = CurrInstructionOutMem->at(InstructionName);
//            // if ResultantDomain is Uninitialized, then bail out (this instruction is unreachable)
//            if (ResultantDom->Value == Domain::Uninit)
//                return false;
            //else
            {
                // Now check if the second operand instruction is Zero Domain -->
                Value* Denominator = BinOp->getOperand(1);
                std::string SecondaryOpVarName = variable(Denominator);
                //First check if the second Operand is a Constant or Not.
                auto SecondOpConst = dyn_cast<ConstantInt>(BinOp->getOperand(1));
                if (SecondOpConst)
                {
                    // Yo this guy a constant
                    auto FirstOpConstantVal = SecondOpConst->getSExtValue();
                    if (FirstOpConstantVal == 0)
                        return true;
                }
                else
                {
                    Domain* DenominatorDom = CurrInstructionInMem->at(SecondaryOpVarName);
                    if (DenominatorDom->Value == Domain::Zero || DenominatorDom->Value == Domain::MaybeZero) //<-- This has been done to reduce false negatives
                        return true;
                }
            }
        }
    }
  return false;
}

char DivZeroAnalysis::ID = 1;
static RegisterPass<DivZeroAnalysis> X("DivZero", "Divide-by-zero Analysis",
                                       false, false);
} // namespace dataflow
