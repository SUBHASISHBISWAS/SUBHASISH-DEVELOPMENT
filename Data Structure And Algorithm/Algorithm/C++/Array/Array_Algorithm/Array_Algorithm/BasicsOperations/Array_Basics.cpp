//
//  Array_Basics.cpp
//  Array_Algorithm
//
//  Created by SUBHASISH BISWAS on 14/10/20.
//

#include "Array_Basics.hpp"
using namespace::std;
void ArrayBasics::DisplayArray(int *arr, int size)
{
    
    int i;
    for(i = 0; i < size; i++)
    cout << arr[i] << " ";
    cout << endl;
}

void ArrayBasics::SwapArray(int arr[], int firstIndex, int secondIndex, int d)
{
    int i, temp;
    for(i = 0; i < d; i++)
    {
        temp = arr[firstIndex + i];
        arr[firstIndex + i] = arr[secondIndex + i];
        arr[secondIndex + i] = temp;
    }
}

void ArrayBasics::RotateArray(int *arr, int d, int n)
{
    if(d == 0 || d == n)
        return;
    if(n - d == d)
    {
        SwapArray(arr, 0, n - d, d);
        return;
    }
    if(d < n - d)
    {
        SwapArray(arr, 0, n - d, d);
        RotateArray(arr, d, n - d);
    }
    else
    {
        SwapArray(arr, 0, d, n - d);
        RotateArray(arr + n - d, 2 * d - n, d);
    }
}

void ArrayBasics::ReadInputArrayFromConsole()
{
    int* arr;
    int size;
    cout << "Enter size of array";
    cin >> size;
    cin.ignore();
    arr = new int[size];
    string input;
    
    cout << "Enter numbers, separated by single space:\n";
    getline(cin, input);
    istringstream iss(input);
    string str;

    int i = 0;
    while (getline(iss, str, ' ') && i < size) {
        int num = atoi(str.c_str());
        arr[i] = num;
        printf("%d\n", num);
        ++i;
    }
    
    this->array=arr;
    this->size=size;
    
}

int ArrayBasics:: FindMinElement(int arr[], int size)
{
    int min=0;
    for(int i = 0;i<size;i++)
    {
        if(i==0)
            {
            min=arr[i]; //smallest_element=arr[0];
            }
        else if(arr[i]<min)
            {
            min = arr[i];
            }
    }
    
    cout<< min;
    return min;
}
