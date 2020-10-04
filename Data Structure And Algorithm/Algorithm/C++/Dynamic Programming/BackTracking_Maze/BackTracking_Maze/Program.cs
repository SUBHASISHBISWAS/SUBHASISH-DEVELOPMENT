using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackTracking_Maze
{
    public class BackTracking
    {

        public void findPath1(int[,] maze, int n, int x, int y, int[,] path)
        {
            if (x < 0 || x >= n || y < 0 || y >= n)
            {
                return;
            }
            if (x == n - 1 && y == n - 1)
            {
                //Printing Martix
                for (int i = 0; i < n; i++)
                {
                    for (int j = 0; j < n; j++)
                    {
                        Console.Write(path[i, j] + " ");
                    }
                }
                return;
            }
            if (maze[x, y] == 0 || path[x, y] == 1)
            {
                return;
            }
            path[x, y] = 1;
            //Right
            findPath(maze, n, x, y + 1, path);
            findPath(maze, n, x, y - 1, path);
            findPath(maze, n, x - 1, y, path);
            findPath(maze, n, x + 1, y, path);

            

            return;
        }

        public bool findPath(int[,] maze, int n, int x, int y, int[,] path)
        {
            if (x < 0 || x >= n || y < 0 || y >= n)
            {
                return false;
            }
            if (x == n - 1 && y == n - 1)
            {
                //Printing Martix
                for (int i = 0; i < n; i++)
                {
                    for (int j = 0; j < n; j++)
                    {
                        Console.Write(path[i,j] +" ");
                    }
                }
                return true;
            }
            if (maze[x, y] == 0 || path[x, y] == 1)
            {
                return false;
            }
            path[x, y] = 1;
            //Right
            if (findPath(maze, n, x, y + 1, path))
            {
                path[x, y] = 0;
                return true;
            }

            //Left 
            if (findPath(maze,n,x,y-1,path))
            {
                path[x, y] = 0;
                return true;
            }

            //Top
            if (findPath(maze,n,x-1,y,path))
            {
                path[x, y] = 0;
                return true;
            }

            //Button
            if (findPath(maze,n,x+1,y,path))
            {
                path[x, y] = 0;
                return true;
            }

            return false;
        }

        public bool findPath(int[,] maze, int n)
        {
            int[,] path = new int[20, 20];
            return findPath(maze,3, 0, 0, path);
        }
    }

     

    class Program
    {


        static void Main(string[] args)
        {
            int[,] maze = new int[3, 3]
                {
                    {1,1,0 },
                    {1,1,0 },
                    { 0,1,1},
                };
            BackTracking backTracking = new BackTracking();
            bool isPathExist=backTracking.findPath(maze, 3);

            Console.WriteLine(isPathExist.ToString());
            Console.ReadLine();

        }
    }
}
