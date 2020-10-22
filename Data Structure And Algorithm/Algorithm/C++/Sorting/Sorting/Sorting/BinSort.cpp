//
//  BinSort.cpp
//  Sorting
//
//  Created by SUBHASISH BISWAS on 14/10/20.
//

#include "BinSort.hpp"
using namespace::std;
void BinSort::PerformBinSort(int arr[], int n)
{
    int max;
    Node **Bins;
    max=findMax(arr, n);
    Bins=new Node*[max+1];
    LinkedList linkedList;
    
    for (int i=0; i<max+1; i++)
    {
        Bins[i]=NULL;
    }
    //Updaing count array index with original array value
    for (int i=0; i<n; i++)
    {
        linkedList.Insert(Bins[arr[i]], arr[i]);
    }
    int i=0;
    int j=0;
    //Copy back from count array index to original array
    while (i<max+1)
    {
        
    }
    
    Display(arr,n);
}

int BinSort::findMax(int *arr, int n)
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

void BinSort::Display(int arr[], int n)
{
    cout<<endl<<"Sorted Array::"<<endl;
    
    for (int i=0; i<n; i++)
    {
        cout<<arr[i]<<"|";
    }
    
    cout<<endl;
}
