//
//  LinkedList.cpp
//  Sorting
//
//  Created by SUBHASISH BISWAS on 14/10/20.
//

#include "LinkedList.hpp"
using namespace::std;
LinkedList::LinkedList(int data)
{
    
    //this->next= (Node*)malloc(sizeof(Node));
    head=new Node();
    head->data=data;
    tail=head;
}
LinkedList::LinkedList()
{
    
}

void LinkedList::Display()
{
    Node * p=head;
    if (p!=NULL)
    {
        cout<<p->data<<endl;
        p=p->next;
    }
}

int LinkedList::Lenght(Node * p)
{
    int length=0;
    while (p)
    {   length++;
        p=p->next;
    }
    return length;
}
void LinkedList::Insert(int index,int data)
{
    
    //invalid Index
    if (index<0 || index > Lenght(head))
    {
        return;
    }
    
    Node *t,*p;
    p=head;
    
    //Create New Node
    t=new Node();
    t->data=data;
    
    //Insert in before first Node
    if (index==0)
    {
        t->next=head;
        head=t;
    }
    else if (index>0)
    {
        // if node not null and then move the pointer till the index
        for (int i=0; i<index-1 && p; i++)
        {
            p=p->next;
        }
        // if node present
        if (p)
        {
            t=new Node();
            t->data=data;
            t->next=p->next;
            p->next=t;
        }
        
    }
}

void LinkedList::Insert(int data)
{
    //Create New Node
    Node *t=new Node();
    t->data=data;
    t->next=NULL;
    if (head==NULL)
    {
        head=tail=t;
    }
    else
    {
        tail->next=t;
        tail=t;
    }
}

