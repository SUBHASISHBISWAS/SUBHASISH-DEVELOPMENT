    //
    //  LinkedList.cpp
    //  DataStructure
    //
    //  Created by SUBHASISH BISWAS on 17/08/20.
    //  Copyright © 2020 SUBHASISH BISWAS. All rights reserved.
    //

#include "LinkedList.hpp"

using namespace::std;
    //using namespace::SB_LinkedList;


Node * LinkedList:: Search_Improved(int value){
    
    Node *p=firstNode;
    Node *trailingNode=NULL;
    while (p) {
            // If node found move node to the First Node
        if (p->data == value) {
            cout<<"Found Node::"<<p->data<<endl;
            trailingNode->next=p->next;
            p->next=firstNode;
            firstNode=p;
            Display();
            return p;
        }
            //trailingNode points to previous node of p
        trailingNode=p;
        p=p->next;
    }
    cout<<"Node Not Found"<<endl;
    return NULL;
}

Node * LinkedList:: Search(int value){
    
    Node *p=firstNode;
    while (p) {
        if (p->data == value) {
            cout<<"Found Node::"<<p->data<<endl;
            return p;
        }
        p=p->next;
    }
    cout<<"Node Not Found"<<endl;
    return NULL;
}

int LinkedList:: MaxNode(){
    
    Node *p=firstNode;
    int minValue=INT_MIN;
    while (p) {
        if (p->data>minValue) {
            minValue=p->data;
        }
        p=p->next;
    }
    cout<<"Max Node in List::"<<minValue<<endl;
    return minValue;
}


int LinkedList:: SumOfAllNode(){
    
    Node *p=firstNode;
    int sum=0;
    while (p) {
        sum+=p->data;
        p=p->next;
    }
    cout<<"Total Sum of all Nodes::"<<sum<<endl;
    return sum;
}

int LinkedList:: TotalNoNodeInList(){
    
    Node *p=firstNode;
    int count=0;
    while (p) {
        count++;
        p=p->next;
    }
    cout<<"Total No of Node in List::"<<count<<endl;
    return count;
}
void LinkedList::Insert(int data, int index){
    
    Node *p=firstNode;
    
    Node *t=new Node();
    t->data=data;
    t->next=NULL;
    
        // Insert  before irst Node
    if (index==0) {
        
        t->next=firstNode->next;
        firstNode=t;
    }
    else{
            // P is intilly Pointing to First node
            // if postion i 4 the move move 3 times
            // and if p is not null
        for (int i=0; i<index-1 && p; i++) {
            p=p->next;
        }
        if (p) {
            t->next=p->next;
            p->next=t;
        }
        
    }
    
    Display();
}
void LinkedList::Display_Recursive(Node * node){
    
    if (node) {
        cout<<node->data<<"|";
        Display_Recursive(node->next);
    }
    
}
void LinkedList::Display(){
    
    Node *p=firstNode;
    while (p) {
        cout<<p->data<<"|";
        p=p->next;
    }
    cout<<endl;
}

Node * LinkedList::GetHead()
{
    return firstNode;
}
void LinkedList::Intilize(Node * lastNode,int data[], int n){
    Node *t=NULL;
    for (int i=1; i<n; i++) {
        t=new Node();
        t->data=data[i];
        t->next=NULL;
        lastNode->next=t;
        lastNode=t;
    }
}


LinkedList::LinkedList(int data[], int n)
{
    firstNode=new Node();
    firstNode->data=data[0];
    firstNode->next=NULL;
    Node *lastNode=firstNode;
    Intilize(lastNode, data, n);
    
}

LinkedList::LinkedList()
{
    firstNode=new Node();
}



