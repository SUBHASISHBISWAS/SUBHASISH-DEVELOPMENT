//
//  StackUsingLinkedList.hpp
//  DataStructure
//
//  Created by SUBHASISH BISWAS on 18/10/20.
//  Copyright © 2020 SUBHASISH BISWAS. All rights reserved.
//

#ifndef StackUsingLinkedList_hpp
#define StackUsingLinkedList_hpp

#include <stdio.h>
#include <stdlib.h>
#include <iostream>
using namespace::std;

class Node
{
public:
    int data;
    Node * next;
};

class StackUsingLinkedList
{
private:
    Node * top;
public:
    StackUsingLinkedList();
    void Display();
    void Push(int data);
    int Pop();
    int Peek(int position);
    int StackTop();
    bool IsFull();
    bool IsEmpty();
};
#endif /* StackUsingLinkedList_hpp */
