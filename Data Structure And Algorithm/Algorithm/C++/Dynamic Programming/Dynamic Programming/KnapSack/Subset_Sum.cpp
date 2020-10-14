//
//  Subset_Sum.cpp
//  Dynamic Programming
//
//  Created by SUBHASISH BISWAS on 13/10/20.
//  Copyright © 2020 SUBHASISH BISWAS. All rights reserved.
//

#include "HeaderFiles/Subset_Sum.hpp"
#include "Matrix.hpp"
#include<algorithm>
using namespace std;

bool Subset_Sum::Calculate_Subset_sum(int *weights, int bagCapacity, int numberOfItems){
    
    Matrix *matrix=new Matrix(numberOfItems+1,bagCapacity+1);
    this->_matrix=matrix->GetMatrix();
    
    //Matrix Initilization
    /*
     |T| F | F | F | F |
     |T|---|---|---|---|
     |T|---|---|---|---|
     |T|---|---|---|---|
     |T|---|---|---|---|
     */
    for (int i=0; i<numberOfItems;i++) {
        for (int j=0; j<bagCapacity; j++) {
            if (i==0) {
                _matrix[i][j]=true;
            }
            if (j==0) {
                _matrix[i][j]=false;
            }
        }
    }
    
    return false;
}

