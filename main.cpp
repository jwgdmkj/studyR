#include <iostream>
#include "GrowableArray.h"
using namespace std;

int main(void)
{
 cout<<"GrowableArray<int> Test" <<endl;
 GrowableArray<int> g(10);
 int i;
 for(i=0;i<g.length();i++) g[i]= 2*i+3;
 cout<<"g(10)"; g.print();
 g[13]=13;
 cout<<"g(26)"; g.print();
 
 //출력예 g(10)[3 5 7 9.. 21]
 //g(26) [ 3 5 .. 21 0 0 ..13.. 0]

 //실수형
 cout<<"GrowableArray<double> Test"<<endl;
 GrowableArray<double> dg(10);
 for(i=0; i<dg.length(); i++) dg[i]=2*i+3.14;
 cout<<"dg(10)"; dg.print();
 dg[13]=13.31;
 cout<<"dg(26)"; dg.print();

 return 0;
}
 
