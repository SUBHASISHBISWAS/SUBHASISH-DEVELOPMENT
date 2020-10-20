//
//  StackUsingLinkedList.cpp
//  DataStructure
//
//  Created by SUBHASISH BISWAS on 18/10/20.
//  Copyright © 2020 SUBHASISH BISWAS. All rights reserved.
//

#include "HeaderFiles/StackUsingLinkedList.hpp"

void StackUsingLinkedList::Push(int data)
{
    Node *t=new Node();
    if (t==NULL)
    {
        cout<<endl<<"Stack is FULL"<<endl;
    }
    else
    {
        t->next=top;
        t->data=data;
        top=t;
    }
}

int StackUsingLinkedList::Pop()
{
    int x=-1;
    if (top==NULL)
    {
        cout<<endl<<"Stack is Empty"<<endl;
        return x;
    }
    else
    {
        x=top->data;
        Node *t=top;
        top=top->next;
        delete t;
    }
    return x;
}
int StackUsingLinkedList::Peek(int position)
{
    Node *p=top;
    
    for (int i=0; i<position-1 && p!=NULL; i++)
    {
        p=p->next;
    }
    if (p)
    {
        return p->data;
    }
    else
    {
        return -1;
    }
}

void StackUsingLinkedList :: Display()
{
    Node *p=top;
    while (p!=NULL)
    {
        cout<<p->data<<"|";
        p=p->next;
    }
}
StackUsingLinkedList::StackUsingLinkedList()
{
    top=NULL;
}
