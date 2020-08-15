#include <iostream>
#include <vector>
#include <string>
#include<stdlib.h>
#include<list>
#include<map>
#include<set>
#include<stack>

using namespace std;

template<class T>
class Math_Template
{
    private:
        T a;
        T b;

    public:
        Math_Template(T a, T b);
        T add();
        T sub();
};

template<class T>
Math_Template<T> :: Math_Template(T a, T b)
{
    this->a=a;
    this->b=b;
}

template<class T>
T Math_Template<T>::add()
{
    return a+b;
}

template<class T>
T Math_Template<T>::sub()
{
    return a-b;
}

class Math 
{
    private:
        int a;
        int b;

    public:
        Math(int a, int b);
        int add();
        int sub();

};

Math :: Math(int a, int b)
{
    this->a=a;
    this->b=b;
}
int Math::add()
{
    return a+b;
}

int Math::sub()
{
    return a-b;
}

class Rectangle_Cpp
{
    private:
        int height;
        int width;
    public:

        Rectangle_Cpp(int h, int w)
        {
            height=h;
            width=w;
        }
        int CalculateArea()
        {
            return height * width;
        }

        void ChangeHeightAndWidth_InMain()
        {
            height=50;
            width=50;
        }
};

class Rectangle_CppScopeResolution
{
    private:
        int height;
        int width;
    public:
        Rectangle_CppScopeResolution();
        Rectangle_CppScopeResolution(int h, int w);
        int CalculateArea();
        void ChangeHeightAndWidth_InMain();
        int getHeight()
        { 
            return height;
        }
        int setHeight(int h)
        { 
            return height=h;
        };

        ~Rectangle_CppScopeResolution();
};

        Rectangle_CppScopeResolution ::Rectangle_CppScopeResolution(int h, int w)
        {
            height=h;
            width=w;
        }
        int Rectangle_CppScopeResolution::CalculateArea()
        {
            return height * width;
        }

        void Rectangle_CppScopeResolution:: ChangeHeightAndWidth_InMain()
        {
            height=50;
            width=50;
        }

        Rectangle_CppScopeResolution::~Rectangle_CppScopeResolution()
        {

        }


    struct Rectangle
    {
        int height;
        int width;
    };

    void Initilize(struct Rectangle *r, int h, int w)
    {
        r->height=h;
        r->width=w;
    }

    int CalculateArea(struct Rectangle r)
    {
        return r.height * r.width;
    }

    void ChangeHeightAndWidth_InMain(struct Rectangle *r)
    {
        r->height=50;
        r->width=50;
    }

    struct StructureWithArray
    {
        int arr[5];
        int n;
    };

    

//x and y -> are formal parameter

void Swap_ByValue(int x , int y)
{
    int temp;
    temp = x;
    y = x;
    x=temp;
}
void Swap_C_ByAddress(int *x , int *y)
{
    int temp;
    temp = *x;
    *y = *x;
    *x=temp;
}

void Swap_Cpp_ByReference(int &x, int &y)
{
    int temp;
    temp = x;
    y = x;
    x=temp;
}

// Array in C , C++ Always pass by  Address
//Here array pass as Address

//A[] -> means Pointer to Array only
// int *A -> Can hold the Address of an array as well as int Object
void ArrayAsParameter_1(int A[], int n)
{
    for (int i = 0; i < n; i++)
    {
        printf("%d", A[i]);
    }
    
}

void ArrayAsParameter_2(int *A, int n)
{
    for (int i = 0; i < n; i++)
    {
        printf("%d", A[i]);
    }
    
}

int * ReturnArrayFromFunction(int n)
{
    int *p;
    p=(int *)malloc(n * sizeof(int));
    return (p);
}

int StructureAsParamater_ByValue(struct Rectangle rectangle)
{
    return rectangle.height * rectangle.width;
}


int StructureAsParamater_ByReference(struct Rectangle &rectangle)
{
    return rectangle.height * rectangle.width;
}

int StructureAsParamater_ByAddress(struct Rectangle *rectangle)
{
    return rectangle->height * rectangle->width;
}

int StructureWithArray_ByValue(struct StructureWithArray s)
{
    return s.arr[0]=10;
}

void Vector_Test(vector<int> v)
{
    for (int i = 0; i < v.size(); i++)
    {
        cout<<v[i]<<"|";
    }
    
}

// Custom Comparator
template<typename type>
struct MyComparator
{
    bool operator()(const type &first, const type &second) const
    {
        return first<second;
    }
};

int main()
{
    int arr[5]={10,20,30};
    struct Rectangle rect;

    rect.height=5;
    rect.width=10;

    cout<< "Area :" << rect.height * rect.width <<" ";
/*
    for (int i = 0; i < sizeof(arr)-1; i++)
    {
       cout<<i;
    }
    */

    //pointer
    int a=10;
    // pointer variable stored in stack used to access external memory 
    //( Example : Heap, Database, Network, Keyboard memory) from Program
    int *p;
    p=&a;
    printf("%d",*p);

    // C -> Allocating Memory in Heap
    int *myPointerC;
    //C -> Allocating Memory in Heap and assigning it to a Pointer variable stored in Stack
    myPointerC = (int *) malloc(5 * sizeof(int));



    //C++
    int *myPointeCpp;
    //C++ -> Allocating Memory in Heap and assigning it to a Pointer variable stored in Stack
    myPointeCpp = new int[5];


    //C++ Reference ->Just another name (alias) give to existing variable
    int myVar=10;
    int & refMyVar = myVar;
    cout<< refMyVar;
    
    
    // Pointer to structure

    struct Rectangle myRect={10,10};
    struct Rectangle *myRectPointer=&myRect;

    // Accessing Member variable through Pointer
     (*myRectPointer).height=10;
     (*myRectPointer).width=10;

     //using shortcut : insted (*myRectPointer) use ->
     myRectPointer->height=10;
     myRectPointer->width=20;

    // Creating Object in Heap C
    struct Rectangle *myRectPointer_1;
    myRectPointer_1=(struct Rectangle *)malloc(sizeof(struct Rectangle));
    myRectPointer_1->height=10;
    myRectPointer_1->width=10;

    // Creating Object in Heap C++
    struct Rectangle *myRectPointer_2;
    myRectPointer_1=(struct Rectangle *)malloc(sizeof(struct Rectangle));
    myRectPointer_1->height=10;
    myRectPointer_1->width=10;


    // Parameter Passing
    //C  ->Call by Address
    int c=10;
    int d=20;
    Swap_C_ByAddress(&c,&d);
    cout<<"C_Swap By Address: "<<c<<" "<<d;

    // C++ -> Call By Reference -> in call by Reference action method body
    //of the called funcation is gets Copied in calling Function at run time

    int e=10;
    int f=20;
    Swap_Cpp_ByReference(e,f);
    cout<<"Cpp_Swap By Reference: "<<e<<" "<<f<<"\n";

    //Array As Paramater
    // Array in C , C++ Always pass by  Address
    

    int A[6]={1,2,3,4,5,6};
    ArrayAsParameter_1(A,6);

    int B[6]={1,2,3,4,5,6};
    ArrayAsParameter_2(B,6);

    int *arr_1;
    arr_1=ReturnArrayFromFunction(10);

    // Structure as Paramater
    struct Rectangle rect_byValue={10,50};
    StructureAsParamater_ByValue(rect_byValue);

    struct Rectangle rect_byReference={10,50};
    StructureAsParamater_ByValue(rect_byReference);

    struct Rectangle rect_byAddress={10,50};
    StructureAsParamater_ByAddress(&rect_byAddress);

    // Structure With Array Inside (Array can not be passed by value but if array is 
    //inside structure then structure can be passed as value array also get copied by 
    //value by compiler)
    struct StructureWithArray structureWithArray={{1,2,3,4,5},5};
    StructureWithArray_ByValue(structureWithArray);

    // C++ Object

    Rectangle_Cpp rect_cpp(10,10);
    
    rect_cpp.CalculateArea();
    rect_cpp.ChangeHeightAndWidth_InMain();


    // using Template Class

          Math_Template<int> mathObject_int(10,10);
          cout<<mathObject_int.add(); 

          Math_Template<float> mathObject_float(1.0,1.5);
          cout<<mathObject_float.add();  


    // STL -> Standard Template Library
    // Vectors

        vector<int> v(5);
        
        cout <<"|";

        v[0]=1;
        v[1]=5;
        v[2]=7;
        v.push_back(4);

        cout<<"FRONT ::"<<v.front();
        cout<< "BACK ::"<<v.back();
        cout<<"AT@ ::"<<v.at(2); 
        cout <<"|";

        cout <<"SIZE::"<<v.size();
        //cout <<"SIZE::"<<v.clear();

        Vector_Test(v);

        // Vector are Container and Container are accessed by iterator
        // iterator is like pointer
        //Vector Contigious Memory Allocation
        // Vector Iterator are random Access Iterator
        vector<int> :: iterator itr;
        itr=v.begin();
        cout<<"Iterator Begin Value :"<<*itr<<endl;
        cout<<"Iterator 3rd Value :"<<*(itr+3)<<endl;

        // Lopping through Iterator

        for (; itr!=v.end() ; itr++)
        {   
            cout<<*itr<<"|";
        }

        // Sorting Vector
        sort(v.begin(),v.end());
        for (; itr!=v.end() ; itr++)
        {   
            cout<<*itr<<"|";
        }

        // Removing From Vector
        vector<int> myVector;
        myVector.push_back(10);
        myVector.push_back(20);
        myVector.push_back(20);
        myVector.push_back(20);
        myVector.push_back(30);
        myVector.push_back(40);
        myVector.push_back(50);

        cout<<endl<<"Vector Values ::"<<endl;
        //New type of Iteration
        for (auto &val :myVector)
        {
            cout<<val<<"|";
        }
        // Erase -> Vector size reduce
        
        cout<<endl<<"Erase ::"<<endl;
        myVector.erase(myVector.begin()+3,myVector.begin()+4);
        for (auto &val :myVector)
        {
            cout<<val<<"|";
        }
        cout<<endl<<"Remove ::"<<endl;
        // Remove all occurrance of 20
        std::remove(myVector.begin(),myVector.end(),20);
        for (auto &val :myVector)
        {
            cout<<val<<"|";
        }

        // Erase with Remove
        auto myRemoveItr=std::remove(myVector.begin(),myVector.end(),30);
        //myVector.erase(myRemoveItr,v.end(),30);

        /*
        //remove_if -> Lambda Function passed as Condition
        std:: remove_if(myVector.begin(),myVector.end(),[](int &val){
            if (val==40)
            {
                return true;
            }
            return false;
        });
        */
       
        // LIST -> Double LinkList
        //#include<list>
        
        list<int> myList(5);
        
        cout <<endl<<"LIST ::"<<endl;

        myList.push_back(10);
        myList.push_back(20);
        myList.push_back(30);
        myList.push_back(40);

        list<int> :: iterator listItr;
        listItr=myList.begin();
        
        for (; listItr!=myList.end() ; listItr++)
        {   
            cout<<*listItr<<"|";
        }

        //MAP
        // internal Data structure -> Balance Binary Tree
       cout <<endl<<"MAP ::"<<endl;

        map<int,string> myStingMap;
        map<int,int> myMap;

        myMap[4]=500;
        myMap[5]=100;
        myMap.insert(make_pair(10,600));
        myMap[1]=50;

        // Print Sorted Oreder -> autometically sort by Key
        for (auto it = myMap.begin(); it!=myMap.end(); it++)
        {
            cout<<it->first<<"---"<<it->second<<endl;
        };

        //Set
        // Associative Container : just like Map: same Key act as Value
        //only one value(Key as Value)
        //Duplicate not Allowed
        cout <<endl<<"SET ::"<<endl;
        set<int> mySet;
        mySet.insert(10);
        mySet.insert(10);
        mySet.insert(20);
        mySet.insert(30);

        for (auto &mySetValue:mySet)
        {
             cout<<mySetValue<<"|";
        }
        cout <<endl<<"MULTI-SET ::"<<endl;
        multiset<int> mymultiSet;
        mymultiSet.insert(10);
        mymultiSet.insert(10);
        mymultiSet.insert(20);
        mymultiSet.insert(30);

        for (auto &mySetValue:mymultiSet)
        {
             cout<<mySetValue<<"|";
        }
        
        //Remove from Set
        cout <<endl<<"Remove From set ::"<<endl;

        mySet.erase(10);
        //mySet.erase(mySet.end());


        // Sorting 

        cout <<endl<<"Sorting Map ::"<<endl;
        map<int,string, greater<int> > mySortedMap;

        mySortedMap[10]="Subhasish";
        mySortedMap[30]="Asmita";
        mySortedMap.insert(make_pair(20,"Adrita"));
        

        // Print Sorted Oreder -> autometically sort by Key
        for (auto &elem: mySortedMap)
        {
            cout<<elem.first<<"---"<<elem.second<<endl;
        };

        cout <<endl<<"Sorting Set ::"<<endl;
        set<int, less<int> > mySortedSet;
        mySortedSet.insert(40);
        mySortedSet.insert(30);
        mySortedSet.insert(50);
        mySortedSet.insert(100);

        for (auto &mySetValue:mySortedSet)
        {
             cout<<mySetValue<<"|";
        }

        // using Own comparator

        // Sorting 

        cout <<endl<<"Sorting Map using Custom Comparator ::"<<endl;
        map<int,string, MyComparator<int> > mySortedMap_1;

        mySortedMap_1[10]="Subhasish";
        mySortedMap_1[30]="Asmita";
        mySortedMap_1.insert(make_pair(20,"Adrita"));
        // Print Sorted Oreder -> autometically sort by Key
        for (auto &elem: mySortedMap_1)
        {
            cout<<elem.first<<"---"<<elem.second<<endl;
        };

        //  Stack

        //By default stack use dequeue as internal Data Structure
        cout <<endl<<"Stack ::"<<endl;
        stack<int> myStack;
        myStack.push(10);
        myStack.push(20);
        myStack.push(30);
        myStack.push(40);

        while (!myStack.empty())
        {
            cout<<myStack.top()<<endl;
            myStack.pop();
        }

        //Use Vector as Internal Data Structure in Stack
        stack<int,vector<int> > myStack_vector; 

         //Use Linked List as Internal Data Structure in Stack
        stack<int,list<int> > myStack_list; 
        

}

