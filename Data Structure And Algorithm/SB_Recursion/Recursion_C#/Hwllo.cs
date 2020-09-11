using System;
class Program { 

    static int TripletSum(int[] arr, int n) 

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

            // store maximum answer 

        if(max1 !=0 &&  max2!=0) 

            ans = Math.Max(ans, max1 + arr[i] + max2); 

        } 

        return ans; 
    }
/*
5
11
13 16 2 7 3 18 19 6 15 11 17 
10
7 4 14 11 10 13 6 17 7 20 
7
16 6 10 18 15 13 11 
8
2 12 20 18 1 12 7 8 
4
5 20 11 19 
*/

    public static void Main() 

    { 
        string n=Console.ReadLine();
        int 

        int[] arr = { 2, 5, 3, 1, 4, 9 }; 
        int n = arr.Length; 
        Console.WriteLine(TripletSum(arr, n)); 

    } 

    /*
    Console.Out.WriteLine(arr.ToString());

                var line_1 = Console.ReadLine().Split();
                int N = Convert.ToInt32(line_1[0]);
                int K = Convert.ToInt32(line_1[1]);

          
                for (int i_A = 0; i_A < N; i_A++)
                {
                    arr = Array.ConvertAll(Console.ReadLine().Split(' '), k => Convert.ToInt32(k));
                }
    */
}
