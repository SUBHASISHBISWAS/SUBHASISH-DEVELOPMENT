    //
    //  LinkedList.hpp
    //  DataStructure
    //
    //  Created by SUBHASISH BISWAS on 17/08/20.
    //  Copyright © 2020 SUBHASISH BISWAS. All rights reserved.
    //

#ifndef LinkedList_hpp
#define LinkedList_hpp

#include <stdio.h>
#include "Node.hpp"
#include <iostream>


class LinkedList
{
private:
    Node *firstNode;
public:
    
    Node * Search_Improved(int value);
    Node * Search_Recursive(int value,Node * node);
    Node * Search(int value);
    int MaxNode();
    int SumOfAllNode_Recursive(Node * node);
    int SumOfAllNode();
    int TotalNoNodeInList_Recursive(Node * node);
    int TotalNoNodeInList();
    void Insert_InLast(int data);
    void Insert(int data, int index);
    void Display_Recursive(Node * node);
    void Display();
    Node * GetHead();
    void Intilize(Node * lastNode,int data[], int n);
    LinkedList();
    LinkedList(int data[], int n);
    
    
};

#endif /* LinkedList_hpp */
