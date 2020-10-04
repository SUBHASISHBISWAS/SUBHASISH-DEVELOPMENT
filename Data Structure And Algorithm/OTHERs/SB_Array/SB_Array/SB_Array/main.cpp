//
//  main.cpp
//  SB_Array
//
//  Created by SUBHASISH BISWAS on 16/08/20.
//  Copyright © 2020 SUBHASISH BISWAS. All rights reserved.
//

#include <iostream>

int main(int argc, const char * argv[]) {
    
    int A[]={1,2,3,4,5};
    
    printf("%d", A[2]);
    
    printf("%d", 2[A]);
    
    //Accessing Array Using Pointer Arithmetic
    printf("%d", *(A+2));
    
    
    // insert code here...
    std::cout << "Hello, World!\n";
    return 0;
}
