#include "z3++.h"

struct Node {
    z3::expr exprVal;
    Node *parent;
    Node *left;
    Node *right;
    bool IsRootNode;

    Node(const z3::expr &expVal, Node* parent, Node* left, Node* right, bool IsRootNode)
    : exprVal(expVal), parent(parent),
    left(left), right(right), IsRootNode(IsRootNode){}
};

void searchStrategy(z3::expr_vector &OldVec);
