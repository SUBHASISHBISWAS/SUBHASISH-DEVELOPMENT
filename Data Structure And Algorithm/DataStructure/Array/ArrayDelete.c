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


int Delete(struct Array *arr,int index)
{
    int x=0;
    
    if ( index >=0 && index < arr->length)
    {
        x=arr->A[index];
    
        for (int i=index; i<(arr->length-1); i++)
        {
            arr->A[i]=arr->A[i+1];
        }
        arr->length--;
        return x;
        
    }
    return 0;
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
    
    Delete(&arr, 3);
    
    Display(arr);
    return 0;
}
*/
