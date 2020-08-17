//
//  ArrayCreation.c
//  Array
//
//  Created by SUBHASISH BISWAS on 24/06/19.
//  Copyright © 2019 SUBHASISH BISWAS. All rights reserved.
//

/*
#include <stdio.h>
#include <stdlib.h>
struct Array
{
    int A[20];
    int size;
    int length;
};

void Append(struct Array *arr,int n)
{
    if (arr->length <arr ->size)
    {
        arr->A[arr->length ++] =n;
    }
}

void Insert(struct Array *arr,int index, int x)
{
    if (index >=0 && index <=arr->length )
    {
        for (int i=arr->length; i>index; i--)
        {
            arr->A[i]=arr->A[i-1];
        }
        arr->A[index]=x;
        arr->length++;
    }
}

void Display(struct Array arr)
{
    int i;
    
    printf("\n Elements Are \n");
    for (i=0; i<arr.length; i++)
    {
        printf("Element : %d \n",arr.A[i]);
    }
}

int main()
{
    struct Array arr ={{2,3,4,5,6},20,5};
    
    Append(&arr, 7);
    
    Insert(&arr, 3, 10);
    
    
    Display(arr);
    return 0;
}
*/
