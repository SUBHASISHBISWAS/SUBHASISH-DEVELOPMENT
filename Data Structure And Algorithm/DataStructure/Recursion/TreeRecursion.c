//
//  TreeRecursion.c
//  MyFirstProject
//
//  Created by SUBHASISH BISWAS on 15/06/19.
//  Copyright © 2019 SUBHASISH BISWAS. All rights reserved.
//

#include "TreeRecursion.h"
void fun2(int n)
{
    if (n>0) {
        fun2(n-1);
        printf("%d ",n);
    }
}
/*
 int main(int argc, const char * argv[]) {
 
 int x=3;
 fun(x);
 return 0;
 }
 */

