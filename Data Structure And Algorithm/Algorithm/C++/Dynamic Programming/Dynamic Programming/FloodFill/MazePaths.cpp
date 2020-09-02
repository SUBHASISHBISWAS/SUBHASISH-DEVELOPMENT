//
//  MazePaths.cpp
//  Dynamic Programming
//
//  Created by SUBHASISH BISWAS on 30/08/20.
//  Copyright © 2020 SUBHASISH BISWAS. All rights reserved.
//

#include "MazePaths.hpp"


using namespace::std;

int Maze::DFS_FloodFill(vector<vector<int> > &maze, int sr, int sc, int dr, int dc)
{
    // Check boundary condition and check for if it is visited
    if (sr<0 || sc <0 || sr>dr || sc >dc || maze[sr][sc]==0) {
        return 0;
    }
    
    //Mark the cell is visited
    maze[sr][sc]=0;
    
    // Move Down
    DFS_FloodFill(maze,sr+1,sc,dr,dc);
    //Move Left
    DFS_FloodFill(maze,sr,sc-1,dr,dc);
    //Move Top
    DFS_FloodFill(maze,sr-1,sc,dr,dc);
    //Move Right
    DFS_FloodFill(maze,sr,sc+1,dr,dc);
    
    return 1;
}

int Maze::Display_ConnectedIsland(vector<vector<int> > &maze){
    
    int numIsland =0;
    
    int dr=(int)maze.size()-1;
    if (dr==0) {
        return 0;
    }
    int dc=(int)maze[0].size()-1;
    
    // We explore ecah cell in the maze and try to find connected cell
    for (int i=0; i<dr; i++) {
        for (int j=0; j<dc; j++) {
            
            // if cell=1 then only cell is connected to adjucent cell
            // If cell is allowed then only we explore adjucent cell
            if (maze[i][j]==1) {
                numIsland+=DFS_FloodFill(maze, i, j, dr, dc);
            }
            
        }
    }
    
    return numIsland;
}

/*
int Display_ConnectedIsland(vector<vector<int>>& maze){
    
    int numIsland =0;
    
    int dr=maze.size();
    if (dr==0) {
        return 0;
    }
    int dc=maze[0].size();
    
    for (int i=0; i<dr; i++) {
        for (int j=0; j<dc; j++) {
            
            if (maze[i][j]==1) {
                numIsland+=DFS_FloodFill(maze,i,j,dr,dc);
            }
        }
    }
    
    return numIsland;
}
 
 */
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


