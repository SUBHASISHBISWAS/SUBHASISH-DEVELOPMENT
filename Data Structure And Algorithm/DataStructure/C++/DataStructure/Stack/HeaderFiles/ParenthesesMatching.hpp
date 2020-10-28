//
//  ParenthesesMatching.hpp
//  DataStructure
//
//  Created by SUBHASISH BISWAS on 18/10/20.
//  Copyright © 2020 SUBHASISH BISWAS. All rights reserved.
//

#ifndef ParenthesesMatching_hpp
#define ParenthesesMatching_hpp

#include <stdio.h>
#include <stdlib.h>
#include <iostream>
using namespace::std;

class Node
{
public:
    char data;
    Node * next;
};

class ParenthesesMatching
{
private:
    Node * top;
public:
    bool IsBalanced(char *expression);
    ParenthesesMatching();
    void Display();
    void Push(char data);
    int Pop();
    int Peek(int position);
    int StackTop();
    bool IsFull();
    bool IsEmpty();
};
#endif /* ParenthesesMatching_hpp */
