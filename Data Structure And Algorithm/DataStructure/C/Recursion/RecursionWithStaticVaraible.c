int fun(int n)
{
    static int x=0;
    if (n>0) {
        x++;
        return fun(n-1)+x;
    }
    return 0;
}
/*
int main(int argc, const char * argv[]) {
    
    int x=5;
    int r =fun(x);
    printf("%d ",r);
    return 0;
}
*/
