//
//  main.cpp
//  Sorting
//
//  Created by SUBHASISH BISWAS on 14/10/20.
//

#include <iostream>
#include "CountSort.hpp"

int main(int argc, const char * argv[]) {
    
    CountSort countSort;
    
    int A[]={10,20,3,7,4,3,2};
    int n = sizeof(A) / sizeof(A[0]);
    countSort.PerformCountSort(A,n);
    
    return 0;
}
