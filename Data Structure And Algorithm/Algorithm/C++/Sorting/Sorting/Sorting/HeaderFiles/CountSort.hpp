//
//  CountSort.hpp
//  Sorting
//
//  Created by SUBHASISH BISWAS on 14/10/20.
//

#ifndef CountSort_hpp
#define CountSort_hpp

#include <stdio.h>
#include <stdlib.h>
#include <iostream>

class CountSort
{
public:
    void PerformCountSort(int arr[],int n);
    int findMax(int arr[], int n);
    void Display(int arr[],int n);
};
#endif /* CountSort_hpp */
