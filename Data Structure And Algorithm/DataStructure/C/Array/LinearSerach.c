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
    int A[10];
    int size;
    int length;
};


void swap(int *x, int *y)
{
    int temp;
    temp = *x;
    *x=*y;
    *y=temp;
    
}

int LinearSearch_MoveToHead(struct Array *arr, int key)
{
    int i;
    
    for (i=0; i<arr->length-1; i++)
    {
        if (key==arr->A[i])
        {
            swap(&arr->A[i], &arr->A[0]);
            return i;
        }
    }
    return -1;
}

int LinearSearch_Transposition(struct Array *arr, int key)
{
    int i;
    
    for (i=0; i<arr->length-1; i++)
    {
        if (key==arr->A[i])
        {
            swap(&arr->A[i], &arr->A[i-1]);
            return i;
        }
    }
    return -1;
}
int LinearSearch(struct Array arr, int key)
{
    int i;
    
    for (i=0; i<arr.length-1; i++)
    {
        if (key==arr.A[i])
        {
            return i;
        }
    }
    return -1;
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
     struct Array arr={{2,23,14,5,6,9,8,12},10,8};
 
 
     printf("Key Found At index : %d\n",LinearSearch_Transposition(&arr,5));
     
     printf("Key Found At index : %d\n",LinearSearch_Transposition(&arr,5));
     
     printf("Key Found At index : %d\n",LinearSearch_Transposition(&arr,5));
     
      
     
     printf("Key Found At index : %d\n",LinearSearch_MoveToHead(&arr,5));
     
     printf("Key Found At index : %d\n",LinearSearch_MoveToHead(&arr,5));
     
     printf("Key Found At index : %d\n",LinearSearch_MoveToHead(&arr,5));
     
     return 0;
 }
*/
