//
//  ParenthesesMatching.cpp
//  DataStructure
//
//  Created by SUBHASISH BISWAS on 18/10/20.
//  Copyright © 2020 SUBHASISH BISWAS. All rights reserved.
//

#include "ParenthesesMatching.hpp"


bool ParenthesesMatching::IsBalanced(char *expression)
{
    for (int i=0; expression[i]!='\0'; i++)
    {
        if (expression[i]=='(')
        {
            Push(expression[i]);
        }
        else if(expression[i]==')')
        {
            if (IsEmpty())
            {
                return false;
            }
            Pop();
        }
    }
    
    return IsEmpty()?true:false;
}

void ParenthesesMatching::Push(char data)
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

int ParenthesesMatching::Pop()
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

bool ParenthesesMatching::IsEmpty()
{
    return top?true:false;
}

int ParenthesesMatching::Peek(int position)
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

void ParenthesesMatching :: Display()
{
    Node *p=top;
    while (p!=NULL)
    {
        cout<<p->data<<"|";
        p=p->next;
    }
}
ParenthesesMatching::ParenthesesMatching()
{
    top=NULL;
}
