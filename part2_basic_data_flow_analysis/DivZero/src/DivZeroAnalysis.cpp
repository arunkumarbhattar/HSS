#include "DivZeroAnalysis.h"

namespace dataflow {

//===----------------------------------------------------------------------===//
// DivZero Analysis Implementation
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
            if (PreDom->Value == PostDom->Value)
                continue;
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

void DivZeroAnalysis::flowIn(Instruction *I, Memory *In) {
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
//      llvm::outs()<<"Unionizing Memory of Instruction"
//      << IncomingFlow->getName()<<" that bears string "
//      << MemOfIncomingFlow->operator[](tmp) <<"\n";
      if(!UnionizedMemory)
      {
          UnionizedMemory = MemOfIncomingFlow;
      }
      else
      {
        UnionizedMemory = join(UnionizedMemory, MemOfIncomingFlow);;
      }

      UnionizedMemory = join(UnionizedMemory, In);
  }
  InMap[I] = UnionizedMemory;
  return;
}

Domain *evalPhiNode(PHINode *PHI, const Memory *Mem)
{
    Value *cv = PHI->hasConstantValue();
    if(cv){
        // This means PhiNode always merges to this value
        // Find the Domain of this value
        std::string ValName = variable(cv);
        return Mem->at(ValName);
    }

    unsigned int n = PHI->getNumIncomingValues();
    Domain* joined = NULL;
    for (unsigned int i = 0 ; i < n; i++)
    {
        Value* IncomingVal = PHI->getIncomingValue(i);
        Domain* V = NULL;
        auto IncomingValConst = dyn_cast<ConstantInt>(IncomingVal);
        if (IncomingValConst)
        {
            auto FirstOpConstantVal = IncomingValConst->getSExtValue();
            if (FirstOpConstantVal == 0)
                V = new Domain(Domain::Zero);
            else
                V = new Domain(Domain::NonZero);
        }
        else if (Mem->find(variable(PHI->getIncomingValue(i))) != Mem->end())
            V = Mem->at(variable(PHI->getIncomingValue(i)));
        else
            V = new Domain(Domain::Uninit);
        /*
         *
         */
        if(!joined){
            joined = V;
        }
        joined = Domain::join(joined, V);
    }
    return joined;
}
void DivZeroAnalysis::transfer(Instruction *I, const Memory *In, Memory *NOut) {
//    errs()<< "Entered transfer function with Instruction: ";
//    I->print(errs());
//    errs() <<"\n";

// First Open up the Instruction

  BinaryOperator* BinOpIns = dyn_cast<BinaryOperator>(I);
  CmpInst* ICompareInst  = dyn_cast<CmpInst>(I);
  ConstantInt* ConstantInst = dyn_cast<ConstantInt>(I);
  PHINode *phyI = dyn_cast<PHINode>(I);
  CastInst* BitCastInst = dyn_cast<CastInst>(I);
  ReturnInst* RetInst = dyn_cast<ReturnInst>(I);
  BranchInst* BranInst = dyn_cast<BranchInst>(I);
  // if Input, then this is an obvious assignment
  if (isInput(I))
  {
      // Initialize Memory with MaybeZero since we are reading from the I/P
      std::string nameOfVar = variable(I);
      Domain* MaybeZero = new Domain(Domain::MaybeZero);
      NOut->erase(nameOfVar);
      NOut->insert(std::pair<std::string, Domain*>(nameOfVar, MaybeZero));
  }
  else if (RetInst)
  {
      NOut->insert(std::pair<std::string, Domain *>(
              variable(RetInst),new Domain(Domain::Uninit)));
  }
  else if (BranInst)
  {
      // We finna gon do nothing in here
      /*
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
       */
      if(In)
        *NOut = *In;
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
          if(In->find(Op1VarName) != In->end()){
              auto Op1DomainEntry =In->at(Op1VarName);
              Op1Domain = Op1DomainEntry;
          }

          if (In->find(Op2VarName) != In->end())
          {
              auto Op2DomainEntry = In->at(Op2VarName);
              Op2Domain = Op2DomainEntry;
          }
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
      if ((Op1Domain && Op1Domain->Value == Domain::Zero) && ((Op2Domain && Op2Domain->Value == Domain::Zero))
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
  else if(phyI)
  {
      Domain* ResultantDomain = evalPhiNode(phyI,In);
      std::string ResultantName = variable(phyI);
      NOut->erase(ResultantName);
      NOut->insert(std::pair<std::string, Domain *>(ResultantName, ResultantDomain));
  }
  else if(RetInst)
  {
      *NOut = *In;
  }


  // As of Now I shall treat all other instructions as NOP on Out Memory State
  }

void DivZeroAnalysis::flowOut(Instruction *I, Memory *Pre, Memory *Post,  SetVector <Instruction *> &WorkSet, bool &flagPhiSetChanged) {
  /* Add your code here */
  /*
   * Context: Perform the flowOut Operation by updating the WorkSet accordingly.
   * The current Instruction's successors should be added only if the OUT set was changed by the transfer function.
   */
  auto successors = getSuccessors(I);
  // The current Instruction's Successors must be added, NOT the current Instruction
  auto temp = join(Pre, Post);
  *Post = *temp;
  if(!equal(Pre, temp))
  {
      /*
       * Phy Type instructions can be changed throughout the program
       * within while loops. Hence if there is a change in Pre and Post of a Phi Instruction.
       * This very Phi Instruction Must be recalculated
       *
       */
      auto isPhyNode = isa<PHINode>(I);
      if(isPhyNode)
      {
          InMap[I] = temp;
          WorkSet.insert(I);
          /*
           * You may not have a succeeding Phi dependency instruction.
           * So the instruction that depends on the updated result of Phi May never be reached.
           * Hence, all instructions are reworked with updated In and Out maps
           */
          flagPhiSetChanged = true;
      }
      for (auto SuccessiveInst : successors)
      {
          WorkSet.insert(SuccessiveInst);
      }
  }
}

void DivZeroAnalysis::doAnalysis(Function &F) {
    SetVector<Instruction *> WorkSet;
    SetVector<Instruction *> OriginalWorkSet;
    for (inst_iterator I = inst_begin(F), E = inst_end(F); I != E; ++I) {
        WorkSet.insert(&(*I));
    }
    OriginalWorkSet = WorkSet;
    bool flagPhiSetChanged = false;
    //iterate through the Workset --> Instructions that need additional work
    do {
        SetVector<Instruction*>SampleWorkSet;
        flagPhiSetChanged = false;
        for (auto InstructionThatNeedsWork: WorkSet) {
            /* Add your code here */
            /* Basic Workflow-
                 Visit instruction in WorkSet
                 For each visited instruction I, construct its In memory by joining all memory sets of incoming flows (predecessors of I)
                 Based on the type of instruction I and the In memory, populate the NOut memory
                 Based on the previous Out memory and the current Out memory, check if there is a difference between the two and
                   flow the memory set appropriately to all successors of I and update WorkSet accordingly
            */

            flowIn(InstructionThatNeedsWork, /*Join on all OUT sets of incoming flows must be saved to InMap[Instr]*/
                   InMap[InstructionThatNeedsWork]);
            //Step 2: Apply Transfer function to populate OUT set for Instruction --> InstructionThatNeedsWork
            Memory *OutMem = new Memory;
            transfer(InstructionThatNeedsWork, InMap[InstructionThatNeedsWork], OutMem);
            flowOut(InstructionThatNeedsWork, InMap[InstructionThatNeedsWork], OutMem, SampleWorkSet, flagPhiSetChanged);
            OutMap[InstructionThatNeedsWork] = OutMem;
        }
        if (flagPhiSetChanged)
            WorkSet = OriginalWorkSet;
        else
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
          {
              // Now check if the second operand instruction is Zero Domain -->
              std::string SecondaryOpVarName = variable(BinOp->getOperand(1));
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
                  if (DenominatorDom->Value == Domain::Zero || DenominatorDom->Value == Domain::MaybeZero) //<-- Flow insensitive, thats why we are allowing MaybeZero also
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
