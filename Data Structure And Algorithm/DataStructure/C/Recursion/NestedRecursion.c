//
//  NestedRecursion.c
//  MyFirstProject
//
//  Created by SUBHASISH BISWAS on 15/06/19.
//  Copyright © 2019 SUBHASISH BISWAS. All rights reserved.
//

#include <stdio.h>


int NestedRecrsion(int n)
{
    if (n>100)
    {
        return n-10;
    }
    else
    {
        return NestedRecrsion(NestedRecrsion(n+11));
    }
}

/*
int main(int argc, const char * argv[]) {
    
    int x=NestedRecrsion(95);
    printf("%d\n",x);
    return 0;
}
 */
