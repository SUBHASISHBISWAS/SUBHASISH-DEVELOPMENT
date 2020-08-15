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
    int * A;
    int size;
    int length;
};

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
    struct Array arr;
    
    printf("Enter size of an Array: ");
    scanf("%d", &arr.size);
    
    arr.A = (int *)malloc(arr.size * sizeof(int));
    arr.length =0;
    
    int i,n;
    
    printf("Enter numbers of Element: ");
    scanf("%d",&n);
    
    for (i=0; i<n; i++)
    {
        scanf("%d",&arr.A[i]);
    }
    arr.length =n;
    
    Display(arr);
}
*/
