//
//  Recursion_SumofNnaturalNumber.c
//  Recursion
//
//  Created by SUBHASISH BISWAS on 16/06/19.
//  Copyright © 2019 SUBHASISH BISWAS. All rights reserved.
//

#include <stdio.h>

int Power_Recursion(int m,int n)
{
    if (n==0)
    {
        return 1;
    }
    else
    {
        return Power_Recursion(m,n-1)*m;
    }
}

int Efficient_Power_Recursion(int m,int n)
{
    if (n==0)
    {
        return 1;
    }
    if (n%2==0) // n is Even number
    {
        return Efficient_Power_Recursion(m*m,n/2);
    }
    
    return m*Efficient_Power_Recursion(m*m,(n-1)/2); //n is odd number
}


 /*
 int main(int argc, const char * argv[])
 {
 int recrsionPower;
 recrsionPower=Power_Recursion(2,5);
 printf("Power_Recusrsion- %d\n",recrsionPower);
 
 int efficienetRecrsionPower;
 efficienetRecrsionPower=Efficient_Power_Recursion(2,5);
 printf("Efficient_Power_Recusrsion- %d\n",efficienetRecrsionPower);
 
 return 0;
 }
*/

