//
//  BinarySerach.cpp
//  Binary_Serach
//
//  Created by SUBHASISH BISWAS on 10/11/20.
//

#include "BinarySerach.hpp"

int BinarySearch::BinarySearch_OnAscendingSortedArray(int element, int arr[], int size)
{
    int start=0;
    int end=size-1;
    
    while (start<=end)
    {
        int mid=(start+end)/2;
        
        if (element==arr[mid])
        {
            return mid;
        }
        else if(element<arr[mid])
        {
            end=mid-1;
        }
        else if(element>arr[mid])
        {
            start=mid+1;
        }
    }
    
    return -1;
}

int BinarySearch::BinarySearch_MidCalculation(int element, int arr[], int size)
{
    int start=0;
    int end=size-1;
    
    while (start<=end)
    {
        int mid=start+(end-start)/2;
        
        if (element==arr[mid])
        {
            return mid;
        }
        else if(element<arr[mid])
        {
            end=mid-1;
        }
        else if(element>arr[mid])
        {
            start=mid+1;
        }
    }
    
    return -1;
}

int BinarySearch::BinarySearch_ArraySortedInDescendingOrder(int element, int arr[], int size)
{
    int start=0;
    int end=size-1;
    
    while (start<=end)
    {
        int mid=start+(end-start)/2;
        
        if (element==arr[mid])
        {
            return mid;
        }
        else if(element<arr[mid])
        {
            start=mid+1;
        }
        else if(element>arr[mid])
        {
            end=mid-1;
        }
    }
    
    return -1;
}

int BinarySearch::BinarySearch_SortingOrderUnknown(int element, int arr[], int size)
{
    int start=0;
    int end=size-1;
    
    // If only one element is present in the array
    if (size==1)
    {
        return -1;
    }
    // If arry sorted in ascending Order then next element will be bigger than previios element
    //Apply ascending serach logic
    if (arr[0]<arr[1])
    {
        while (start<=end)
        {
            int mid=start+(end-start)/2;
            
            if (element==arr[mid])
            {
                return mid;
            }
            else if(element<arr[mid])
            {
                end=mid-1;
            }
            else if(element>arr[mid])
            {
                start=mid+1;
            }
        }
    }
    // If arry sorted in descending Order then next element will be smaller than previios element
    //Apply descending serach logic
    if (arr[0]>arr[1])
    {
        while (start<=end)
        {
            int mid=start+(end-start)/2;
            
            if (element==arr[mid])
            {
                return mid;
            }
            else if(element<arr[mid])
            {
                start=mid+1;
            }
            else if(element>arr[mid])
            {
                end=mid-1;
            }
        }
    }
    
    
    return -1;
}

int BinarySearch::BinarySearch_FindFirstandLastOccuranceOfElement(int element, int arr[], int size)
{
    int start=0;
    int end=size-1;
    
    while (start<=end)
    {
        int mid=start+(end-start)/2;
        
        if (element==arr[mid])
        {
            return mid;
        }
        else if(element<arr[mid])
        {
            end=mid-1;
        }
        else if(element>arr[mid])
        {
            start=mid+1;
        }
    }
    
    return -1;
}
