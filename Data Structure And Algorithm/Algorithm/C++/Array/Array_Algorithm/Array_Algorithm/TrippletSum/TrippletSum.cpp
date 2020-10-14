//
//  TrippletSum.cpp
//  Array_Algorithm
//
//  Created by SUBHASISH BISWAS on 14/10/20.
//

#include "TrippletSum.hpp"
using namespace::std;
int TrippletSum::Calculate_TripletSum(int arr[], int n)
{
    int ans = 0;
    for (int i = 1; i < n - 1; ++i) {
        int max1 = 0, max2 = 0;
        for (int j = 0; j < i; ++j)
            if (arr[j] < arr[i])
                max1 = max(max1, arr[j]);
        for (int j = i + 1; j < n; ++j)
            if (arr[j] > arr[i])
                max2 = max(max2, arr[j]);
        if(max1 && max2)
             ans=max(ans,max1+arr[i]+max2);
    }
    return ans;
}
