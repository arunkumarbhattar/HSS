#include <vector>
#include "Strategy.h"

/*
 * Implement your search strategy.
 */
z3::context Z3Context;
Node RootNode = Node(Z3Context.int_val(0), NULL, NULL, NULL, true);

bool AreZ3ExprEqual(z3::expr expr1, z3::expr expr2)
{
    extern z3::solver Solver;
    bool RetVal;
    Solver.reset();
    Solver.add(z3::implies(expr1, expr2));
    Solver.add(z3::implies(expr2, expr1));
    RetVal = Solver.check() == z3::sat;
    return RetVal;
}

void searchStrategy(z3::expr_vector &OldVec) { /* Add your code here */

    Node* Ptr = &RootNode;
    for (auto CurrExprVecNode : OldVec)
    {
        if (Ptr->right == NULL)
        {
            auto prevCondition = CurrExprVecNode;
            Node *RightNode = new Node(prevCondition,
                                       Ptr, NULL, NULL, Ptr);
            Ptr->right = RightNode;
            Ptr = RightNode;
        }
        else if (Ptr->left == NULL)
        {
            auto prevCondition = CurrExprVecNode;
            Node* LeftNode = new Node(prevCondition, Ptr,
                                      NULL, NULL, false);
            Ptr->left = LeftNode;
            Ptr = LeftNode;
        }
        else if (AreZ3ExprEqual(Ptr->right->exprVal, CurrExprVecNode))
        {
            Ptr = Ptr->right;
        }
        else if(AreZ3ExprEqual(Ptr->left->exprVal, CurrExprVecNode))
        {
            Ptr = Ptr->left;
        }
    }

    if (Ptr->parent == NULL) {  // Pour out the OldVec
        while (!OldVec.empty())
            OldVec.pop_back();
        return;
    }

    while(Ptr->parent->right){
        Ptr = Ptr->parent;
        if(!Ptr->parent)
        {
            while(!OldVec.empty())
            {
                OldVec.pop_back();
            }
            return;
        }
    }

    z3::expr RightCondition = !(Ptr->exprVal);
    Node* newRight = new Node(RightCondition, Ptr->parent, NULL, NULL, false);
    Ptr->parent->right = newRight;
    Ptr = newRight;

    std::vector<z3::expr> TempVec;
    while(!Ptr->IsRootNode)
    {
        TempVec.push_back(Ptr->exprVal);
        Ptr = Ptr->parent;
    }

    while(!OldVec.empty())
    {
        OldVec.pop_back();
    }

    while(!TempVec.empty())
    {
        auto last = TempVec.end()-1;
        OldVec.push_back(*last);
        TempVec.pop_back();
    }
}
