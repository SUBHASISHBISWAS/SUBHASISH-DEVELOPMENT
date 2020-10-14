//
//  Array_Basics.hpp
//  Array_Algorithm
//
//  Created by SUBHASISH BISWAS on 14/10/20.
//

#ifndef Array_Basics_hpp
#define Array_Basics_hpp

#include <stdio.h>
#include <string>
#include <sstream>
#include <iostream>
#include <stdlib.h>
class ArrayBasics
{
public:
    int *array;
    int size;
    void DisplayArray(int arr[], int size);
    void SwapArray(int arr[], int firstIndex, int secondIndex, int d);
    void RotateArray(int arr[], int d, int n);
    void ReadInputArrayFromConsole();
    
    int FindMinElement(int arr[], int size);
};
#endif /* Array_Basics_hpp */
