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

bool Subset_Sum::Calculate_Subset_sum(int *arr,int arraySum, int numberOfItems){
    
    bool _matrix[numberOfItems+1][arraySum+1];
    
    //Matrix Initilization
    /* --->arraySum
     |T| F | F | F | F |
     |T|---|---|---|---|
     |T|---|---|---|---|
     |T|---|---|---|---|
     |T|---|---|---|---|
     */
    for (int i=0; i<=numberOfItems;i++) {
        for (int j=0; j<=arraySum; j++) {
            if (i==0) {
                 _matrix[i][j]=false;
            }
            if (j==0) {
                 _matrix[i][j]=true;
            }
        }
    }
    
    if (arraySum == 0)
        return true;
    if (numberOfItems == 0)
        return false;
    
    /*
     set[]={3, 4, 5, 2}
     target=6
      
         0    1    2    3    4    5    6

     0   T    F    F    F    F    F    F

     3   T    F    F    T    F    F    F
          
     4   T    F    F    T    T    F    F
           
     5   T    F    F    T    T    T    F

     2   T    F    T    T    T    T    T
     */
    
    // i and j->starts from -> 1
    // view order of i and j in matrix _matrix[i-1][j-arr[i-1]]
    for (int i=1; i<=numberOfItems; i++) {
        for (int j=1; j<=arraySum; j++) {
            //if sum < one of the element in array then consider it to include in subset or calculate sub problem
            if (arr[i]<j) {
                 _matrix[i][j]=_matrix[i-1][j-arr[i-1]] || _matrix[i-1][j];
            }
            //if one of the element in array > sum then dont consider it to include in subset
            else if(arr[i]>j){
                 _matrix[i][j]=_matrix[i-1][j];
            }
        }
    }
    
    // uncomment this code to print table
    for (int i = 0; i <= numberOfItems; i++)
    {
        for (int j = 0; j <= arraySum; j++)
        {
            printf ("%4d", _matrix[i][j]);
        }
        printf("\n");
    }

    
    
    return _matrix[numberOfItems][arraySum];
}

