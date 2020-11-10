//
//  main.cpp
//  Binary_Serach
//
//  Created by SUBHASISH BISWAS on 10/11/20.
//

#include <iostream>
#include "BinarySerach.hpp"


int main(int argc, const char * argv[]) {
   
    BinarySearch binarySerach;
    int arr[] = { 2, 3, 4, 10, 40 };
    int arr1[] = { 40, 10, 4, 3, 2 };
    int x = 10;
    int n = sizeof(arr) / sizeof(arr[0]);
    int result = binarySerach.BinarySearch_OnAscendingSortedArray(x, arr, n);
    (result == -1) ? cout << "Element is not present in array" :
                     cout << "Element is present at index::" <<"["<<result<<"]"<<endl;
    
    result = binarySerach.BinarySearch_MidCalculation(x, arr, n);
    (result == -1) ? cout << "Element is not present in array" :
                     cout << "Element is present at index::" <<"["<<result<<"]"<<endl;
    
    result = binarySerach.BinarySearch_SortingOrderUnknown(x, arr1, n);
    (result == -1) ? cout << "Element is not present in array" :
                     cout << "Element is present at index::" <<"["<<result<<"]"<<endl;
    
    return 0;
}
