using System;

namespace Recursion_C_
{
    
    class Program
    {
        
        private static void rotateArray(int[] arr,int m)
        {
        int left = 0,right = arr.Length - 1;
        int limit = Math.Min(m,arr.Length/2);
        while(left < limit)
        {
            swap(arr,left++,right--);
        }

            reverse(arr,arr.Length - m,arr.Length-1);
            reverse(arr,m,arr.Length-m-1);
            reverse(arr,0,arr.Length-m-1);
        }

private static void reverse(int[] arr,int left,int right){
    while(left < right){
       swap(arr,left++,right--);
    }
}

private static void swap(int[] arr,int x,int y){
    int temp = arr[x];
    arr[x] = arr[y];
    arr[y] = temp;
}
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
        }




int TripletSum(int [] arr, int n)
{
    int ans = 0;  

    for (int i = 1; i < n - 1; ++i) 
    {

        int max1 = 0, max2 = 0;
        for (int j = 0; j < i; ++j)
            if (arr[j] < arr[i])
                max1 = Math.Max(max1, arr[j]);
        for (int j = i + 1; j < n; ++j)
            if (arr[j] > arr[i])
                max2 = Math.Max(max2, arr[j]);
                if (max1)
                {
                    if (max2)
                    {
                        ans = Math.Max(ans, max1 + arr[i] + max2);
                    }
                }
            }

    return ans;
}



    }



}
