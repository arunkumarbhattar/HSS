#include <iostream>

#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/Instruction.h"

#include "SymbolicInterpreter.h"

extern SymbolicInterpreter SI;

/*
 * Implement your transfer functions.
 */
extern "C" void __DSE_Alloca__(int R, int *Ptr) { /* Add your code here */
    //First up, fetch the address of the register
    auto RAddr = Address(R);
    auto StringName = std::to_string(uintptr_t (Ptr));
    z3::expr Z3expr = SI.getContext().int_const(StringName.c_str());
    auto SymbolicMemory = SI.getMemory();
    SymbolicMemory.insert(std::make_pair(RAddr, Z3expr));
}

extern "C" void __DSE_Store__(int *X) { /* Add your code here */
    // There must exist a symbolic expression of value on top of the stack
    std::cout<<"At DSE_Store"<<std::endl;
    auto StackTop = SI.getStack().top();
    SI.getStack().pop();
    auto Addr = Address(X);
    auto SymbolicMemory = SI.getMemory();
    if (StackTop.to_string()[0] ==  'R')
    {
        // else finna gon get it from the memory
        StackTop = SymbolicMemory.at(Address(StackTop));
    }
    SymbolicMemory.insert(std::make_pair(Addr, StackTop));
    std::cout<<"Left DSE_Store"<<std::endl;
}

extern "C" void __DSE_Load__(int Y, int *X) { /* Add your code here */
    std::cout<<"At DSE_Load"<<std::endl;
    auto XAddr = Address(X);
    auto XMem = SI.getMemory().at(XAddr);
    auto YAddr = Address(Y);
    auto SymbolicMemory = SI.getMemory();
    SymbolicMemory.insert(std::make_pair(YAddr, XMem));
}

extern "C" void __DSE_ICmp__(int R, int Op) { /* Add your code here */
    std::cout<<"At DSE_Icmp"<<std::endl;
    auto SecondOperand = SI.getStack().top();
    SI.getStack().pop();
    auto SymbolicMemory = SI.getMemory();
    if (SecondOperand.to_string()[0] ==  'R')
    {
        SecondOperand = SymbolicMemory.at(Address(SecondOperand));
    }

    auto FirstOperand = SI.getStack().top();
    SI.getStack().pop();
    if (FirstOperand.to_string()[0] ==  'R')
    {
        FirstOperand = SymbolicMemory.at(Address(FirstOperand));
    }
    auto RAddr = Address(R);
    if (llvm::CmpInst::ICMP_EQ == Op)
    {
        SymbolicMemory.insert(std::make_pair(RAddr, FirstOperand == SecondOperand));
    }
    else if (llvm::CmpInst::ICMP_SGE == Op)
    {
        SymbolicMemory.insert(std::make_pair(RAddr, FirstOperand >= SecondOperand));
    }
    else if (llvm::CmpInst::ICMP_SGT == Op)
    {
        SymbolicMemory.insert(std::make_pair(RAddr, FirstOperand > SecondOperand));
    }
    else if (llvm::CmpInst::ICMP_SLE == Op)
    {
        SymbolicMemory.insert(std::make_pair(RAddr, FirstOperand <= SecondOperand));
    }
    else if (llvm::CmpInst::ICMP_SLT == Op)
    {
        SymbolicMemory.insert(std::make_pair(RAddr, FirstOperand < SecondOperand));
    }
    else if (llvm::CmpInst::ICMP_NE == Op)
    {
        SymbolicMemory.insert(std::make_pair(RAddr, FirstOperand != SecondOperand));
    }
}

extern "C" void __DSE_BinOp__(int R, int Op) { /* Add your code here */
    std::cout<<"At DSE_BinOp"<<std::endl;
    auto SecondOperand = SI.getStack().top();
    SI.getStack().pop();
    auto SymbolicMemory = SI.getMemory();
    if (SecondOperand.to_string()[0] ==  'R')
    {
        SecondOperand = SymbolicMemory.at(Address(SecondOperand));
    }

    auto FirstOperand = SI.getStack().top();
    SI.getStack().pop();
    if (FirstOperand.to_string()[0] ==  'R')
    {
        FirstOperand = SymbolicMemory.at(Address(FirstOperand));
    }
    auto RAddr = Address(R);

    if (Op == llvm::BinaryOperator::Add)
    {
        SymbolicMemory.insert(std::make_pair(RAddr, FirstOperand + SecondOperand));
    }
    else if (Op == llvm::BinaryOperator::Sub)
    {
        SymbolicMemory.insert(std::make_pair(RAddr, FirstOperand - SecondOperand));
    }
    else if (Op == llvm::BinaryOperator::Mul)
    {
        SymbolicMemory.insert(std::make_pair(RAddr, FirstOperand * SecondOperand));
    }
    else if (Op == llvm::BinaryOperator::SDiv)
    {
        SymbolicMemory.insert(std::make_pair(RAddr, FirstOperand / SecondOperand));
    }
    else if (Op == llvm::BinaryOperator::SRem)
    {
        SymbolicMemory.insert(std::make_pair(RAddr, FirstOperand%SecondOperand));
    }
}
