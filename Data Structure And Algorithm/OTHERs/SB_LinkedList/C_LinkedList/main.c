
#include <stdio.h>
#include <stdlib.h>

struct Node
{
    int data;
    struct Node * next;
} *first=NULL;

void Create(int A[], int n)
{
    struct Node * t,*last;
    first =(struct Node *)malloc(sizeof(struct Node));
    first->data=A[0];
    first->next=NULL;
    last=first;
    
    
    for (int i=1; i<n; i++)
    {
        t=(struct Node *)malloc(sizeof(struct Node));
        t->data=A[i];
        t->next=NULL;
        last->next=t;
        last=t;
        
    }
}

int count(struct Node *p)
{
    int l=0;
    while(p)
     {
         l++;
         p=p->next;
     }
     return l;
}



void Display(struct Node * first)
{
    struct Node *p =first;
    
    while (p!=NULL)
    {
        printf("%d ",p->data);
        p=p->next;
    }
}

void Insert(struct Node *p,int index,int x)
{
    struct Node *t;
    int i;
    if(index < 0 || index > count(p))
        return;
    t=(struct Node *)malloc(sizeof(struct Node));
    t->data=x;
    if(index == 0)
    {
        t->next=first;
        first=t;
    }
    else
    {
        for(i=0;i<index-1;i++)
        {
            p=p->next;
        }
        t->next=p->next;
        p->next=t;
    }
}

void InsertLast(struct Node *p,int x)
{
    struct Node *last;
    p=(struct Node *)malloc(sizeof(struct Node));
    p->data=x;
    p->next=NULL;
    
    if (first==NULL)
    {
        first=last=p;
    }
    else
    {
        last->next=p;
        last=p;
    }
    
}

void InsertLast_Radix(struct Node *p,int x)
{
    struct Node *last;
    if (p==NULL)
    {
        p=(struct Node *)malloc(sizeof(struct Node));
        p->data=x;
        p->next=NULL;
    }
   
    
    if (first==NULL)
    {
        first=last=p;
    }
    else
    {
        last->next=p;
        last=p;
    }
    
}

int Delete (struct Node* p, int index)
{
        struct Node *q=NULL;
        int x=-1,i;
        
        if(index < 0 || index > count(p))
           return -1;
        if(index==1)
        {
            q=first;
            x=first->data;
            first=first->next;
            free(q);
            return x;
        }
        else
        {
            for(i=0;i<index-1;i++)
            {
                q=p;
            }
            p=p->next;
            q->next=p->next;
            x=p->data;
            free(p);
            return x;
        }
}

int findMax(int A[],int n)
{
    int max= INT32_MIN;
    
    for (int i=0; i<n; i++)
    {
        if (A[i]>max)
        {
            max=A[i];
        }
    }
    return max;
}

void BinSort(int A[],int n)
{
    int max, i , j;
    
    max=findMax(A, n);
    
    printf("Max %d :",max);
    struct Node ** Bins;
    
    struct Node *t =(struct Node *)malloc(sizeof(struct Node));
    Bins= (struct Node **) malloc(sizeof(t) * max+1);
    
    for (i=0; i<max+1; i++)
    {
        Bins[i]=NULL;
    }
    
    for (int i=0; i<n; i++)
    {
        InsertLast_Radix(Bins[A[i]], A[i]);
    }
    
    for (int i=0; i<4; i++)
    {
         printf("Max %d :",Bins[i]->data);
    }
    
    Display(first);
}

int main(int argc, const char * argv[])
{
    
    int A[]={3,3,5,7,10,15};
    
    //Create(A, 5);
    
    //Insert(first,3, 20);
    
    //int x=Delete(first,2);
    
    BinSort(A, 6);
    
    //Display(first);
    
    //printf("\n Deleted Value : %d ",x);
    
    return 0;
}
