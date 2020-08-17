//
//  Recursion_SumofNnaturalNumber.c
//  Recursion
//
//  Created by SUBHASISH BISWAS on 16/06/19.
//  Copyright © 2019 SUBHASISH BISWAS. All rights reserved.
//

#include <stdio.h>

int SumOfNnaturalNumber_Recursion(int n)
{
    if (n==0)
    {
        return 0;
    }
    else
    {
        return SumOfNnaturalNumber_Recursion(n-1)+n;
    }
}

int SumOfNnaturalNumber_Loop(int n)
{
    int sum=0;
    int i=0;
    for (i=1; i<=n; i++)
    {
        sum =sum+i;
    }
    return sum;
}

int SumOfNnaturalNumber_Formula(int n)
{
    int sum =(n * (n+1))/2;
    return sum;
}


/*

 int main(int argc, const char * argv[])
{
    int recrsion;
    recrsion=SumOfNnaturalNumber_Recursion(5);
    printf("Recusrsion- %d\n",recrsion);
    
    int loop;
    loop=SumOfNnaturalNumber_Loop(5);
    printf("Loop- %d\n",loop);
    
    int exprssion;
    exprssion=SumOfNnaturalNumber_Formula(5);
    printf("Expression- %d\n",loop);
    
    return 0;
 }
 */

