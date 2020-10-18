//
//  CountSort.cpp
//  Sorting
//
//  Created by SUBHASISH BISWAS on 14/10/20.
//

#include "CountSort.hpp"
using namespace::std;

void CountSort::PerformCountSort(int arr[], int n)
{
    int max;
    int *c;
    max=findMax(arr, n);
    c=new int[max+1];
    for (int i=0; i<max+1; i++)
    {
        c[i]=0;
    }
    //Updaing count array index with original array value
    for (int i=0; i<n; i++)
    {
        c[arr[i]]++;
    }
    int i=0;
    int j=0;
    //Copy back from count array index to original array
    while (i<max+1)
    {
        if (c[i]>0)
        {
            arr[j++]=i;
            c[i]--;
        }
        else{
            i++;
        }
    }
    
    Display(arr,n);
}

int CountSort::findMax(int *arr, int n)
{
    int max=arr[0];
    for (int i=0; i<n; i++)
    {
        if (arr[i]>max)
        {
            max=arr[i];
        }
    }
    return max;
}

void CountSort::Display(int arr[], int n)
{
    cout<<endl<<"Sorted Array::"<<endl;
    
    for (int i=0; i<n; i++)
    {
        cout<<arr[i]<<"|";
    }
    
    cout<<endl;
}
