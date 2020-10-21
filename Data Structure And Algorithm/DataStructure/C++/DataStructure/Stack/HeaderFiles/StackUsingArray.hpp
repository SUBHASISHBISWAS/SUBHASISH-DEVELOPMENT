//
//  Stack.hpp
//  DataStructure
//
//  Created by SUBHASISH BISWAS on 18/10/20.
//  Copyright © 2020 SUBHASISH BISWAS. All rights reserved.
//

#ifndef Stack_hpp
#define Stack_hpp

#include <stdio.h>
#include <stdlib.h>
#include <iostream>
using namespace::std;

class StackA
{
private:
    int size;
    int top;
    int *arr;
public:
    void Push(int x);
    int Pop();
    int Peek(int position);
    int StackTop();
    bool IsFull();
    bool IsEmpty();
};



#endif /* Stack_hpp */
