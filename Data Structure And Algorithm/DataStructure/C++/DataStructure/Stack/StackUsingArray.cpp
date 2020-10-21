//
//  Stack.cpp
//  DataStructure
//
//  Created by SUBHASISH BISWAS on 18/10/20.
//  Copyright © 2020 SUBHASISH BISWAS. All rights reserved.
//

#include "HeaderFiles/StackUsingArray.hpp"

int StackA::Pop()
{
    int x=-1;
    if (IsEmpty())
    {
        return x;
    }
    x=arr[top];
    //first take out the element from array using crrent top location then reduce top
    top--;
    return x;
}
void StackA::Push(int x)
{
    if (IsFull())
    {
        return;
    }
    //first increament top as in empty stack it point to -1 so ++ will give 0
    top++;
    arr[top]=x;
    
}
int StackA::StackTop()
{
    if (IsEmpty())
    {
        return -1;
    }
    else
    {
        // return always top element in the stack
        return arr[top];
    }
}
int StackA::Peek(int position)
{
    int x=-1;
    // Can not get any element from stack if position is not valid
    // top always shloud be top <= postion
    if (top-position+1<0)
    {
        cout<<endl<<"Invalid POsition"<<endl;
        return x;
    }
    x=arr[top-position+1];
    return x;
}
bool StackA::IsFull()
{
    //is stack top points to array size then its full
    if (top==size-1)
    {
        cout<<endl<<"Stack is Full"<<endl;
        return true;
    }
    return false;
}
bool StackA::IsEmpty()
{
    //is stack top points to -1 then its empty
    if (top==-1)
    {
        cout<<endl<<"Stack is Empty"<<endl;
        return true;
    }
    return false;
}
