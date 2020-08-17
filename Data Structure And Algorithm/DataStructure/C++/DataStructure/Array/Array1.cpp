//  Created by SUBHASISH BISWAS on 16/08/20.
//  Copyright © 2020 SUBHASISH BISWAS. All rights reserved.
//

#include <stdio.h>
#include <iostream>
using  namespace std;

class Array
{
private:
    
    int length;
    int size;
    int *arr;
public:
    
    void Display();
    Array();
    Array(int size);
    ~Array();
    
    
};

void Array::Display()
{
    for (int i=0; i<length; i++) {
        cout<<arr[i];
    }
}

Array::Array()
{
    //C
    //arr=(int *) malloc(10* sizeof(int));
    arr = new int [10];
    
    arr[0]=1;
    arr[1]=5;
    arr[2]=2;
    arr[3]=6;
    arr[4]=9;
    arr[5]=100;
    arr[6]=200;
    arr[7]=50;
    arr[8]=250;
    arr[9]=350;
    
}

Array::Array(int size)
{
    arr = new int [size];
    
    //arr=(int *) malloc(size* sizeof(int));
}

Array::~Array()
{
    delete [] arr;
}
