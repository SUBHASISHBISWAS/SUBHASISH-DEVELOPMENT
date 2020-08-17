//
//  TailorSeries.c
//  Recursion
//
//  Created by SUBHASISH BISWAS on 20/06/19.
//  Copyright © 2019 SUBHASISH BISWAS. All rights reserved.
//

#include <stdio.h>
double TailorSeries(int x,int n)
{
    static double p=1,f=1;
    double r;
    
    if(n==0)
        return 1;
    r= TailorSeries(x, n-1);
    p=p*x;
    f=f*n;
    return r+p/f;
}


 int main(int argc, const char * argv[])
{
 
 double x;
     x=TailorSeries(1,10);
    printf("%lf ",x);
 return 0;
 }

