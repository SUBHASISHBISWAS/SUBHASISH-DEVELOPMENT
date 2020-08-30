//
//  MazePaths.cpp
//  Dynamic Programming
//
//  Created by SUBHASISH BISWAS on 30/08/20.
//  Copyright © 2020 SUBHASISH BISWAS. All rights reserved.
//

#include "MazePaths.hpp"


using namespace::std;

bool Maze::IsInvalidPath(int maze[][1000],bool visited[][1000], int sr, int sc, int dr, int dc){
    
    /*
     2 →NBC
     1. If we get 0 we have to back Track
     2. If we go Array out of boundary then  we have to back track
     */
    if (sc<0 || sr<0 || sc>dc || sr>dr) {
        return true;
    }
    /*
     If we reach to cell where movement is not allowed i.e if maze has cell where 0 is preasent
     if current location where ima standing (sr,sc) is is invalid or not
     */
    if (maze[sr][sc]==0) {
        return true;
    }
    
    /*
     To stop infinite recursion when ever i visit any point (SR,SC) we will mark it
     and if i go to again same position i will never visit marked place again
     So its a in valid path
     */
    if (visited[sr][sc]==true) {
        return true;
    }
    return false;
}
void Maze::DisplayMazePath_WithObstracle(int maze[][1000],bool visited[][1000], int sr, int sc, int dr, int dc, string pathSoFar){
    
    if (sr==dr && sc==dc) {
        
        cout<<"Path with avoiding obstacle: "<<pathSoFar<<endl;
        return;
    }
    
    // if path i
    if (IsInvalidPath(maze, visited, sr, sc, dr, dc)) {
        return;
    }
    
    /*
     Whenever I visit any point First thing i have to make that point as visited
     */
    visited[sr][sc]=true;
    
    // Move Down
    DisplayMazePath_WithObstracle(maze,visited, sr+1,sc,dr,dc,pathSoFar+"D");
    //Move Left
    DisplayMazePath_WithObstracle(maze,visited, sr,sc-1,dr,dc,pathSoFar+"L");
    //Move Top
    DisplayMazePath_WithObstracle(maze,visited, sr-1,sc,dr,dc,pathSoFar+"T");
    //Move Right
    DisplayMazePath_WithObstracle(maze, visited,sr,sc+1,dr,dc,pathSoFar+"R");
    
}

void Maze::DisplayMazePath_Reactive(int sr, int sc, int dr, int dc, string pathSoFar)
{
    //Negative Base Case [NBC]
    if (sr>dr || sc>dc) {
        return;
    }
    
    //Positive Base Case [PBC]
    if (sr==dr && sc==dc) {
        cout<<pathSoFar<<endl;
        return;
    }
    
    //Move Horizontally ->H
    DisplayMazePath_Reactive(sr, sc+1, dr, dc, pathSoFar+"H");
    // Move Vertically->V
    DisplayMazePath_Reactive(sr+1, sc, dr, dc, pathSoFar+"V");
}

void Maze::DisplayMazePath_Proactive(int sr, int sc, int dr, int dc, string pathSoFar)
{
    //Positive Base Case
    if (sr==dr && sc==dc) {
        cout<<pathSoFar<<endl;
        return;
    }
    
    /*
     We are preventing Wrong Choice -> i.e if After Incrementing SC by 1 we we are not moving
     out of boundary then we making Recursive call
     */
     
    if (sc+1<=dc) {
        //Move Horizontally ->H
        DisplayMazePath_Proactive(sr, sc+1, dr, dc, pathSoFar+"H");
    }
    if (sr+1<=dr) {
        // Move Vertically->V
        DisplayMazePath_Proactive(sr+1, sc, dr, dc, pathSoFar+"V");
    }
    
    
}


