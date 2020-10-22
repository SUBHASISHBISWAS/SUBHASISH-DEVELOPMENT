//
//  LinkedList.hpp
//  Sorting
//
//  Created by SUBHASISH BISWAS on 14/10/20.
//

#ifndef LinkedList_hpp
#define LinkedList_hpp

#include <stdio.h>
#include <stdio.h>
#include <stdlib.h>
#include <iostream>


class Node
{
public:
    int data;
    Node * next;
};

class LinkedList
{
private:
    Node * head;
    Node * tail;
public:
    void Insert(int data);
    void Insert(int index,int data);
    int Lenght(Node * p);
    void Display();
    LinkedList(int data);
    LinkedList();
    
    
};
#endif /* LinkedList_hpp */
