//
//  KnapSack.cpp
//  Dynamic Programming
//
//  Created by SUBHASISH BISWAS on 23/08/20.
//  Copyright © 2020 SUBHASISH BISWAS. All rights reserved.
//


#include "HeaderFiles/KnapSack.hpp"
#include "Matrix.hpp"
#include<algorithm>
using namespace std;

int KanpSack::KanpSack_TopDown(int *weights, int *values, int bagCapacity, int numberOfItems){
    
    Matrix *matrix=new Matrix(numberOfItems+1,bagCapacity+1);
    this->_topDownMatrix=matrix->GetMatrix();
    matrix->Display();
    
    for (int i=0; i<=numberOfItems; i++) {
        for (int j=0; j<=bagCapacity; j++) {
            if (i==0 || j==0) {
                _topDownMatrix[i][j]=0;
            }
        }
    }
    
    for (int i=1; i<numberOfItems+1; i++) {
        for (int j=1; j<bagCapacity+1; j++) {
             if (j>=weights[i-1]){
                 _topDownMatrix[i][j]=max(values[i-1]+_topDownMatrix[i-1][j-weights[i-1]],_topDownMatrix[i-1][j]);
             }
             else{
                 _topDownMatrix[i][j]=_topDownMatrix[i-1][j];
                 
             }
        }
    }
    
    
    return _topDownMatrix[numberOfItems][bagCapacity];
}

int KanpSack::KnapSack_Memozize(int *weights, int *values, int bagCapacity, int numberOfItems){
    
   
    
    if (numberOfItems==0 || bagCapacity==0) {
        return 0;
    }
    
    //Dynamic Matrix is created in Constructor
    if (_memozizeMatrix[numberOfItems][bagCapacity]!=-1) {
        return _memozizeMatrix[numberOfItems][bagCapacity];
    }
    
    if (bagCapacity>=weights[numberOfItems-1]) {
        
        return _memozizeMatrix[numberOfItems][bagCapacity]= max(values[numberOfItems-1]+KnapSack_Memozize(weights, values, bagCapacity-weights[numberOfItems-1], numberOfItems-1),
                                                           KnapSack_Memozize(weights, values, bagCapacity, numberOfItems-1));
    }
    return _memozizeMatrix[numberOfItems][bagCapacity]=KnapSack_Memozize(weights, values, bagCapacity, numberOfItems-1);
    
}
// Returns Maximum Profit
int KanpSack:: KnapSack_Recursive(int weights[], int values[],int bagCapacity, int numberOfItems){
    
    /*
     Base case
     size=0 -> no item present so what will be the profit?
    
     capacity=0 -> bag is full so no more item can be put into it or bag give has no capcity to hold any element--> in this case what will be the profit
    */
    if (numberOfItems==0 || bagCapacity==0) {
        return 0;
    }
    
    /*
        weight-> 10|20|6|60|90|
        capacity-50
        
        if weight of the item in weights array is less than the capacity of the bag then only we
        consider wheathe we can include it in the bag or not
     
        if after including it in the bag if bag capacity does not cross the capacity of the bag then we consider it and
        its value-> [values[size-1]] and we reduce the bag capcity by the same weight of the item-> [(capacity-weights[size-1])]
        and we move forward to next item-> [(size-1)]
        
        We are taking last element of the weight array and values array first time and we reduce array size by 1 to move next item-> size-1
     
        values[size]+KnapSack_Recursive(weights, values, capacity-weights[size-1],size-1)
     
        if after adding the item if it exceeds bag capacity the we discard the item and its value and we move forward to next item
        KnapSack_Recursive(weights,values,capacity, size-1)
     */
    if (weights[numberOfItems-1]<=bagCapacity) {
        
        return max(values[numberOfItems-1]+KnapSack_Recursive(weights, values, bagCapacity-weights[numberOfItems-1], numberOfItems-1),KnapSack_Recursive(weights,values,bagCapacity, numberOfItems-1));
    }
    /*
     if weight of the item is > than the capacity of the bag then we dont consider it and move to the next item -> (size-1) and
     perform same operation Recursively on the next item
     
     KnapSack_Recursive(weights,values,capacity, size-1)
     */
    return KnapSack_Recursive(weights,values,bagCapacity, numberOfItems-1);
    
    
}

void KanpSack::Display()
{
    
}
KanpSack::KanpSack(){
    
}
int** KanpSack::GetMatrix(){
    
    return _matrix->GetMatrix();
}

KanpSack::KanpSack(int bagCapacity,int numberOfItems)
{
    this->bagCapacity=bagCapacity;
    this->numberOfItems=numberOfItems;
    
    _matrix=new Matrix(numberOfItems+1, bagCapacity+1);
    
    
    this->_memozizeMatrix=_matrix->GetMatrix();
    _matrix->Display();
    
    //_topDownMatrix=(new Matrix(numberOfItems+1, bagCapacity+1))->GetMatrix();
    
}
