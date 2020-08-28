//
//  KnapSack.hpp
//  Dynamic Programming
//
//  Created by SUBHASISH BISWAS on 23/08/20.
//  Copyright © 2020 SUBHASISH BISWAS. All rights reserved.
//

#ifndef KnapSack_hpp
#define KnapSack_hpp
#include<iostream>
#include <stdio.h>
#include "Matrix.hpp"
class KanpSack
{
private:
    int numberOfItems;
    int bagCapacity;
    int ** _memozizeMatrix;
    int ** _topDownMatrix;
    Matrix *_matrix;
    
public:
    int KanpSack_TopDown(int weights[], int values[],int bagCapacity, int numberOfItems);
    int KnapSack_Recursive(int weights[], int values[],int bagCapacity, int numberOfItems);
    int KnapSack_Memozize(int weights[], int values[],int bagCapacity, int numberOfItems);
    int ** GetMatrix();
    void Display();
    KanpSack(int bagCapacity,int numberOfItems);
    KanpSack();
    
};
#endif /* KnapSack_hpp */
