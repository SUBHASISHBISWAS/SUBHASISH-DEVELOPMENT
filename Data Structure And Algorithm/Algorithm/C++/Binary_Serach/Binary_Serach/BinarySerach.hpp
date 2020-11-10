//
//  BinarySerach.hpp
//  Binary_Serach
//
//  Created by SUBHASISH BISWAS on 10/11/20.
//

#ifndef BinarySerach_hpp
#define BinarySerach_hpp

#include <stdio.h>
using namespace::std;
class BinarySearch
{
public:
    int BinarySearch_OnAscendingSortedArray(int element, int arr[], int size);
    int BinarySearch_MidCalculation(int element, int arr[], int size);
    int BinarySearch_ArraySortedInDescendingOrder(int element, int arr[], int size);
    int BinarySearch_SortingOrderUnknown(int element, int arr[], int size);
    int BinarySearch_FindFirstandLastOccuranceOfElement(int element, int arr[], int size);
};
#endif /* BinarySerach_hpp */
