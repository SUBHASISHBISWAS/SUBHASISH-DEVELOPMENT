//
//  Array.cpp
//  DataStructure
//
//  Created by SUBHASISH BISWAS on 16/08/20.
//  Copyright © 2020 SUBHASISH BISWAS. All rights reserved.
//

#include "Array.hpp"
using  namespace std;


/*
 scan the element in the array from both side and swap the element with negative and posive
 O(n)
 */

void Array::MoveNegativeNoOnesidePositiveNoAnotherSide()
{
    int i=0;
    int j=length-1;
    
    //contine till start cross end
    while (i<j) {
        //Scan from left till postive element found and get the index of the element
        while (arr[i]<0) {
            i++;
        }
        //Scan from right till negative element found and get the index of the element
        while (arr[j]>0) {
            j--;
        }
        if (i<j) {
            // Once both index found the swap the element with the index
            SwapElement(arr[i], arr[j]);
        }
    }
    
    Display();
}

/*
 Check from left all the element
 if left no is > right no then list is not sorted
 */

bool Array::IsSorted(){
    
    for (int i=0; i<length-1; i++) {
        if (arr[i]>arr[i+1]) {
            return false;
        }
    }
    return true;
}

/*
 No need to Compare element while inserting into sorted Array
 start from last and check the element is > than inserted value
 thne shft the element into right and continue till the element in array is
 less than inserted element
 */

void Array::Insert_IntoSortedArray(int value){
    
    int i=length-1;
    while (arr[i]>value) {
        arr[i+1]=arr[i];
        i--;
    }
    arr[i+1]=value;
}

/*
 Reverse element by Swaping First elemenet and Last element by Scanning Array
 Scan the  element till i reach j
 i-> staring poising of an array : i ++ (i increamenet)
 j-> last postion element : (j--) : (j decrement)
 swap arr[i] with arr[j]
 */
void Array::ReverseAnArray_BySwapingElement(){
    
    for (int i=0, j=length-1; i<j; i++,j--) {
        
        SwapElement(arr[i], arr[j]);
    }
    Display();
}
/*
 O(n)-> O(n)+O(n) -> 2O(n)->O(n)
 Copy in reverse order into auxlary Array and the Copy it back original Array
 */
void Array::ReversingAnArray()
{
    int *bufferArray=new int[length];
    /*
     Reverse Copy 
     */
    for (int i=length-1,j=0; i>=0; i--,j++) {
        bufferArray[j]=arr[i];
    }
    for (int i=0,j=0; i<length; i++,j++) {
        arr[i]=bufferArray[j];
    }
    Display();
}

/*
    O(log(n))
    Work on Sorted Array always
 */
int Array:: BinarySerach_Recursive(int start, int end,int value){
    
    
    int mid=0;
    if(start<=end){
        
        mid=(start+end)/2;
        
        if (arr[mid]==value) {
        cout<<"Element Found:"<<arr[mid]<<endl;
        return mid;
        }
        else if (arr[mid]<value){
            BinarySerach_Recursive(start,end-1,value);
        }
        else if (arr[mid]>value){
            BinarySerach_Recursive(start-1,end,value);
        }
    }
    return -1;
    
}
int Array::BinarySerach(int value){
  
    int start=0;
    int end=length-1;
    int mid=0;
    
    while (start<=end) {
        
        mid=(start+end)/2;
        
        /*
            if start  and end very Big value 10tothepower9  the Start+End
            will overflow integer range
            To Prevent Integer overflow do this
            start + (end-start)/2 -> taking LCM
            = (2Start+end-start)/2
            =(start+end)/2
         */
        //mid = start + (end-start)/2
        
        if (arr[mid]==value) {
            cout<<"Element Found:"<<arr[mid]<<endl;
            return mid;
        }
        else if (arr[mid]<value) {
            end=mid-1;
        }
        else if(arr[mid]>value){
            start=mid+1;
        }
           
    }
    
    cout<<"Element Not Found:"<<endl;
    return -1;
    
}

/*
it is possible that if you sercat once you can serach same element again
To improve the Performance of Serach
1. you can move the element one previous location (i.e swap with Prevous element) so when
again serach comparis time will reduce by 1 -> like every time you serch the element move the
previous location every time
so that comparism time will reduce hence serach time also reduced
 
 2. Move element to the First so next time when serach for the same element it will
 be found O(1)
*/


void Array::SwapElement(int &x, int &y)
{
    int temp=0;
    temp=x;
    x=y;
    y=temp;
}

int Array::ImprovedLinerSerach_MoveToFirst(int value)
{
    for (int i=0; i<length; i++) {
    
        if (arr[i]==value) {
            SwapElement(arr[i], arr[0]);
            Display();
            return i-1;
        }
        
    }
    Display();
    return -1;
}



int Array::ImprovedLinerSerach_SwapWithPrevious_Transposition(int value)
{
    for (int i=0; i<length; i++) {
    
        if (arr[i]==value) {
            SwapElement(arr[i], arr[i-1]);
            Display();
            return i-1;
        }
        
    }
    Display();
    return -1;
}

// Time Average Time total time/number of element : O(n)
//Toal Time foe each Comparism :1+2+3+4...+n =n(n+1)/2
// Average Time : n(n+1)/2/n =(n+1)/2 -> O(n)
int Array:: LinerSerach(int value)
{
    
    for (int i=0; i<length; i++) {
    
        if (arr[i]==value) {
            return i;
        }
        
    }
    return -1;
}
int Array:: Delete(int index)
{
    int elementAtIndex=0;
    if (index>=0 && index<=length) {
        
        elementAtIndex=arr[index];
        // After deleting need to shift element from index -> length
        //of the array from right -> left to fill the gap of deleted element
        for (int i=index; i<length-1; i++) {
            arr[i]=arr[i+1];
        }
        length--;
        
    }
    Display();
    return elementAtIndex;
}

void Array::Insert(int index, int value)
{
    //O(1) ->min
    //O(n) -> Max
    //Index should be valid if not negative and less than the length
    if (index>=0 && index<=length) {
        
        //element should be copied from left->right to create vacan space
        for (int i=length; i>index; i--) {
            arr[i]=arr[i-1];
            
        }
        arr[index]=value;
        length++;
    }
    
    Display();
}

void Array::Append(int value)
{
    //Append in last and increase length
    if (length<size) {
        //arr[length]=value;
        //length++;
        arr[length++]=value;
    }
    
    Display();
}
void Array::Display()
{
    cout<<"Array Content::"<<endl;
    for (int i=0; i<length; i++) {
        cout<<arr[i]<<"|";
    }
    cout<<endl;
}

int Array::Length()
{
    cout<<"Array Length::"<<length <<endl;
    return length;
}

Array::Array()
{
    //C
    //arr=(int *) malloc(10* sizeof(int));
    arr = new int [100];
    size=100;
    Initilize();
    
}

Array::Array(int size)
{
    arr = new int [size];
    size=size;
    //arr=(int *) malloc(size* sizeof(int));
}

Array::~Array()
{
    delete [] arr;
}

void Array::Initilize()
{
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
    length=10;
}
