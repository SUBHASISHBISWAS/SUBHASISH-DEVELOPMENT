//
//  BinSort.hpp
//  Sorting
//
//  Created by SUBHASISH BISWAS on 14/10/20.
//

#ifndef BinSort_hpp
#define BinSort_hpp

#include <stdio.h>
#include <stdlib.h>
#include <iostream>

class Node
{
public:
    int data;
    Node * next;
};

class BinSort
{
public:
    void PerformBinSort(int arr[],int n);
    void Insert(Node **ptrBins, int data);
    int findMax(int arr[], int n);
    void Display(int arr[],int n);
};
#endif /* BinSort_hpp */
