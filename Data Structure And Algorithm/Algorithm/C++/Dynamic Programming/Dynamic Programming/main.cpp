//
//  main.cpp
//  Dynamic Programming
//
//  Created by SUBHASISH BISWAS on 23/08/20.
//  Copyright © 2020 SUBHASISH BISWAS. All rights reserved.
//

#include <iostream>
#include "KnapSack.hpp"
#include <stdlib.h>
#include "MazePaths.hpp"
#include <string>
#include <sstream>
#include <iostream>
using namespace::std;
int main(int argc, const char * argv[]) {
    
    KanpSack knapsack;
    
    int weights []={10,20,30};
    int values[]={60,100,120};
    int bagCapacity=50;
    int numberOfItems=sizeof(weights)/sizeof(weights[0]);
    
    int result=knapsack.KnapSack_Recursive(weights,values,bagCapacity,numberOfItems);
    cout<<endl<<"Result::"<<result<<endl;
    
    
    KanpSack knapsack_memozize(bagCapacity,numberOfItems);
    int result_1= knapsack_memozize.KnapSack_Memozize(weights, values, bagCapacity, numberOfItems);
    cout<<endl<<"Result::"<<result_1<<endl;
   
    int result_2=knapsack.KanpSack_TopDown(weights,values,bagCapacity,numberOfItems);
    cout<<endl<<"Result::"<<result_2<<endl;
    
    
    int maze [][1000]={
        {1,0,1,1},
        {1,1,1,1},
        {1,0,1,1},
        {1,1,0,1}};
    
    bool visited [][1000]={
           {0,0,0,0},
           {0,0,0,0},
           {0,0,0,0},
           {0,0,0,0}};
    
    Maze mazePath;
    mazePath.DisplayMazePath_Reactive(0, 0, 2, 2, "");
    mazePath.DisplayMazePath_WithObstracle(maze,visited, 0, 0, 3, 3, "");
    
    vector<vector<int>> myIsland;
    
    myIsland.push_back({1,1,0,0});
    myIsland.push_back({0,1,0,0});
    myIsland.push_back({1,0,1,1});
    myIsland.push_back({1,1,0,1});
    
    
    cout<<endl<<"Total Number of Island:"<<mazePath.Display_ConnectedIsland(myIsland)<<endl;
    
    
    // Sample code to perform I/O:

    /*
    int num;
     cin >> num;                                        // Reading input from STDIN
     cout << "Input number is " << num << endl;
       */
    int* arr;
    int size;
    cout << "Enter size of array";
    cin >> size;
    cin.ignore();
    arr = new int[size];
    string input;
    
    cout << "Enter numbers, separated by single space:\n";
    getline(cin, input);
    istringstream iss(input);
    string str;

    int i = 0;
    while (getline(iss, str, ' ') && i < size) {
        int num = atoi(str.c_str());
        arr[i] = num;
        printf("%d\n", num);
        ++i;
    }
    
    int min=0;
    for(int i = 0;i<size;i++)
    {
        if(i==0)
            {
            min=arr[i]; //smallest_element=arr[0];
            }
        else if(arr[i]<min)
            {
            min = arr[i];
            }
    }
    
    cout<< min;
    
    
    /*
     int myNumber;
     for (int i=0; i<num; i++) {
         cin>>myNumber;
         arr[i]=myNumber;
     }
     */
    
    
    // Warning: Printing unwanted or ill-formatted data to output will cause the test cases to fail
    
    
    return 0;
}