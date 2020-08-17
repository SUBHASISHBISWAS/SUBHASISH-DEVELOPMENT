
#include <iostream>
#include "Array.hpp"
#include "LinkedList.hpp"
using namespace::std;

int main(int argc, const char * argv[]) {
    
    Array a;
    a.Append(70);
    a.Display();
    a.Insert(5, 5000);
    //a.Delete(5);
    a.ImprovedLinerSerach_SwapWithPrevious_Transposition(70);
    a.ImprovedLinerSerach_MoveToFirst(70);
    a.BinarySerach(100);
    a.BinarySerach_Recursive(0, a.Length(), 5000);
    a.ReversingAnArray();
    a.ReverseAnArray_BySwapingElement();
    
    cout<<"Linked List START ::"<<endl;
    
    int data[]={1,2,3,4,5};
    int len = sizeof(data)/sizeof(data[0]);
    LinkedList list(data,len);
    list.Display();
    //list.Display_Recursive(list.GetHead());
    
    list.Insert(100, 2);
    list.TotalNoNodeInList();
    list.SumOfAllNode();
    list.MaxNode();
    list.Search(100);
    list.Search(1000);
    list.Search_Improved(100);
    
    cout<<"Linked List END::"<<endl;
    
    // insert code here...
    std::cout << "Hello, World!\n";
    return 0;
    
}
