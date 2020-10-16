//
//  Subset_Sum.hpp
//  Dynamic Programming
//
//  Created by SUBHASISH BISWAS on 13/10/20.
//  Copyright © 2020 SUBHASISH BISWAS. All rights reserved.
//

#ifndef Subset_Sum_hpp
#define Subset_Sum_hpp

#include <stdio.h>
#include<iostream>
#include <stdio.h>
#include "Matrix.hpp"

class Subset_Sum
{
private:
    int ** _matrix;
public:
    bool Calculate_Subset_sum(int arr[],int arraySum, int numberOfItems);
    
};
#endif /* Subset_Sum_hpp */
