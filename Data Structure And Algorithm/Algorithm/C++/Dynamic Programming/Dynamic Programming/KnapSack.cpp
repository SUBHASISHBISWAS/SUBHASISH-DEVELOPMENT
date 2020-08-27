//
//  KnapSack.cpp
//  Dynamic Programming
//
//  Created by SUBHASISH BISWAS on 23/08/20.
//  Copyright © 2020 SUBHASISH BISWAS. All rights reserved.
//


#include "KnapSack.hpp"
#include<algorithm>
using namespace std;

// Returns Maximum Profit
int KanpSack:: KnapSack_Recursive(int weights[5], int values[5],int capacity, int size){
    
    /*
     Base case
     size=0 -> no item present so what will be the profit?
    
     capacity=0 -> bag is full so no more item can be put into it or bag give has no capcity to hold any element--> in this case what will be the profit
    */
    if (size==0 || capacity==0) {
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
    if (weights[size-1]<=capacity) {
        
        return max(values[size-1]+KnapSack_Recursive(weights, values, capacity-weights[size-1], size-1),KnapSack_Recursive(weights,values,capacity, size-1));
    }
    /*
     if weight of the item is > than the capacity of the bag then we dont consider it and move to the next item -> (size-1) and
     perform same operation Recursively on the next item
     
     KnapSack_Recursive(weights,values,capacity, size-1)
     */
    return KnapSack_Recursive(weights,values,capacity, size-1);
    
    
}
