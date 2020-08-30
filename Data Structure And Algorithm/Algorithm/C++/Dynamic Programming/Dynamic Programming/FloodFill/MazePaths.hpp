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


using namespace::std;
class Maze
{
private:
    bool IsInvalidPath(int maze[][1000],bool visited[][1000], int sr, int sc, int dr, int dc);
public:
    void DisplayMazePath_WithObstracle(int maze[][1000],bool visited[][1000],int sr, int sc, int dr, int dc, string pathSoFar);
    void DisplayMazePath_Proactive(int sr, int sc, int dr, int dc, string pathSoFar);
    void DisplayMazePath_Reactive(int sr, int sc, int dr, int dc, string pathSoFar);
    
};
#endif /* MazePaths_hpp */
