//
//  Matrix.hpp
//  Dynamic Programming
//
//  Created by SUBHASISH BISWAS on 28/08/20.
//  Copyright © 2020 SUBHASISH BISWAS. All rights reserved.
//

#ifndef Matrix_hpp
#define Matrix_hpp

#include <stdio.h>
#include<iostream>

class Matrix
{
private:
    int** data;
public:
    int row,col;
    void Display();
    int** GetMatrix();
    Matrix(int row, int col);
    Matrix();
};

#endif /* Matrix_hpp */
