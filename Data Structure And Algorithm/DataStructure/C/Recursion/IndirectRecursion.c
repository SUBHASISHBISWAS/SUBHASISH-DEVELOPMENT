 //
//  IndirectRecursion.c
//  MyFirstProject
//
//  Created by SUBHASISH BISWAS on 15/06/19.
//  Copyright © 2019 SUBHASISH BISWAS. All rights reserved.
//

#include "IndirectRecursion.h"

void IndirectRecrsion_B( int n);

void IndirectRecrsion_A( int n)
{
    if (n>0) {
        printf("%d ", n);
        IndirectRecrsion_B(n-1);
    }
}
void IndirectRecrsion_B( int n)
{
    if (n>1) {
        printf("%d ", n);
        IndirectRecrsion_A(n/2);
    }
}


/*
 int main(int argc, const char * argv[]) {
 
 int x=20;
 IndirectRecrsion_A(x);
 return 0;
 }
*/
 
