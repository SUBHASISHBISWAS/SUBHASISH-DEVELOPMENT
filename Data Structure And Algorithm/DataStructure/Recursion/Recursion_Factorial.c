//
//  Recursion_SumofNnaturalNumber.c
//  Recursion
//
//  Created by SUBHASISH BISWAS on 16/06/19.
//  Copyright © 2019 SUBHASISH BISWAS. All rights reserved.
//

#include <stdio.h>

int Factorial_Recursion(int n)
{
    if (n==0)
    {
        return 1;
    }
    else
    {
        return Factorial_Recursion(n-1)*n;
    }
}

int Factorial_Loop(int n)
{
    int mul=1;
    int i=0;
    for (i=1; i<=n; i++)
    {
        mul =mul*i;
    }
    return mul;
}

 /*
 int main(int argc, const char * argv[])
 {
 int recrsion;
 recrsion=Factorial_Recursion(5);
 printf("Recusrsion- %d\n",recrsion);
 
 int loop;
 loop=Factorial_Loop(5);
 printf("Loop- %d\n",loop);
 
 
 return 0;
 }
*/

