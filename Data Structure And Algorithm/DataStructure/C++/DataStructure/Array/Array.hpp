//
//  Array.hpp
//  DataStructure
//
//  Created by SUBHASISH BISWAS on 16/08/20.
//  Copyright © 2020 SUBHASISH BISWAS. All rights reserved.
//

#include <iostream>
#ifndef Array_hpp
#define Array_hpp


class Array
{
private:
    
    int length;
    int size;
    int *arr;
public:
    void MoveNegativeNoOnesidePositiveNoAnotherSide();
    bool IsSorted();
    void Insert_IntoSortedArray(int value);
    void ReverseAnArray_BySwapingElement();
    void ReversingAnArray();
    int BinarySerach_Recursive(int start, int end,int value);
    int BinarySerach(int value);
    int ImprovedLinerSerach_MoveToFirst(int value);
    int ImprovedLinerSerach_SwapWithPrevious_Transposition(int value);
    int LinerSerach(int value);
    void SwapElement(int &x, int &y);
    int Delete(int index);
    void Append(int value);
    void Insert(int index, int value);
    void Display();
    int Length();
    void Initilize();
    Array();
    Array(int size);
    ~Array();
    
    
};

#include <stdio.h>
#include <iostream>

#endif /* Array_hpp */
