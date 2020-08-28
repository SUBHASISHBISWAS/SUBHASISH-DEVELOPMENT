//
//  main.cpp
//  Dynamic Programming
//
//  Created by SUBHASISH BISWAS on 23/08/20.
//  Copyright © 2020 SUBHASISH BISWAS. All rights reserved.
//

#include <iostream>
#include "KnapSack.hpp"
#include <stdlib.h>
using namespace::std;
int main(int argc, const char * argv[]) {
    
    KanpSack knapsack;
    
    int weights []={10,20,30};
    int values[]={60,100,120};
    int bagCapacity=50;
    int numberOfItems=sizeof(weights)/sizeof(weights[0]);
    
    int result=knapsack.KnapSack_Recursive(weights,values,bagCapacity,numberOfItems);
    cout<<endl<<"Result::"<<result<<endl;
    
    
    KanpSack knapsack_memozize(bagCapacity+1,numberOfItems+1);
    int result_1= knapsack_memozize.KnapSack_Memozize(weights, values, bagCapacity, numberOfItems);
    cout<<endl<<"Result::"<<result_1<<endl;
   
    return 0;
}
