//
//  ArrayCreation.c
//  Array
//
//  Created by SUBHASISH BISWAS on 24/06/19.
//  Copyright © 2019 SUBHASISH BISWAS. All rights reserved.
//


 #include <stdio.h>
 #include <stdlib.h>
 struct Array
 {
 int A[10];
 int size;
 int length;
 };
 

 int BinarySearch(struct Array arr, int key)
 {
     int l,h,mid;
     
     l=0;
     h=arr.length-1;
     
    while(l<=h)
     {
         mid = (l+h)/2;
         if (key==arr.A[mid])
         {
             return mid;
         }
         else if (key<arr.A[mid])
         {
             h=mid-1;
         }
         else if(key>arr.A[mid])
         {
             l=mid+1;
         }
     }
     return -1;
 }
 
 int BinarySearch_Recursive(int a[], int l, int h,int key)
 {
     
     int mid;
     
     if (l<=h)
     {
         mid = (l+h)/2;
         if (key==a[mid])
         {
             return mid;
         }
         else if (key<a[mid])
         {
             return BinarySearch_Recursive(a,l,h=mid-1,key);
         }
         else if (key>a[mid])
         {
             return BinarySearch_Recursive(a,l=mid+1,h,key);
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
     printf("Key Found At index : %d\n",BinarySearch(arr,5));
     printf("Key Found At index : %d\n",BinarySearch_Recursive(arr.A,0,arr.length,8));
     return 0;
 }

