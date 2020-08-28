//
//  Matrix.cpp
//  Dynamic Programming
//
//  Created by SUBHASISH BISWAS on 28/08/20.
//  Copyright © 2020 SUBHASISH BISWAS. All rights reserved.
//

#include "Matrix.hpp"
#include<algorithm>
using namespace std;

Matrix::Matrix(int row, int col)
{
    this->row=row;
    this->col=col;
    
    this->data=new int* [row];
    for (int i=0; i<row; i++) {
        this->data[i]=new int[col];
        memset(this->data[i], -1, col*sizeof(int));
    }
}

Matrix::Matrix()
{
    
}

int ** Matrix::GetMatrix(){
    return this->data;
}

void Matrix::Display()
{
    cout<<endl<<"Matrix::";
    for (int i=0; i<row; i++) {
        cout<<endl;
        for (int j=0; j<col; j++) {
            cout<<data[i][j]<<"|";
        }
    }
    cout<<endl;
}
