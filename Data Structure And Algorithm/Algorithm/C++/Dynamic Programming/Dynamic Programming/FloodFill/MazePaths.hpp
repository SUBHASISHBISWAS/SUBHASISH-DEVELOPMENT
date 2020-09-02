//
//  MazePaths.hpp
//  Dynamic Programming
//
//  Created by SUBHASISH BISWAS on 30/08/20.
//  Copyright © 2020 SUBHASISH BISWAS. All rights reserved.
//



#ifndef MazePaths_hpp
#define MazePaths_hpp

#include <stdio.h>
#include <iostream>
#include <vector>


using namespace::std;
class Maze
{
private:
    bool IsInvalidPath(int maze[][1000],bool visited[][1000], int sr, int sc, int dr, int dc);
    
    int DFS_FloodFill(vector<vector<int> >& maze, int sr, int sc, int dr, int dc);
public:
    int  Display_ConnectedIsland(vector<vector<int> >& maze);
    void DisplayMazePath_WithObstracle(int maze[][1000],bool visited[][1000],int sr, int sc, int dr, int dc, string pathSoFar);
    void DisplayMazePath_Proactive(int sr, int sc, int dr, int dc, string pathSoFar);
    void DisplayMazePath_Reactive(int sr, int sc, int dr, int dc, string pathSoFar);
    
};
#endif /* MazePaths_hpp */
