#ifndef __GROWABLEARRAY_H__
#define __GROWABLEARRAY_H__
#include "Array.h"

using namespace std;

template <typename T>
class GrowableArray:public Array<T>
{
 public:  //클래스 안에는, 재정의할것만 넣어라
  //바꿔야할것; 사용에따라 인덱스 자동조절+임의의 자료형 저장가능 
	GrowableArray(int size);
        virtual T& operator[] (int i);
       // virtual T operator[] (int i) const override;        
};

template <typename T>
GrowableArray<T>::GrowableArray(int size)
{
 if(size<=0)
 {
 cout<<"범위 잘못됨\n";
 exit(-1);
 }
 else
 {
  this->data=new T[size];
  this->len=size;
 }
}


template<typename T>
T &GrowableArray<T>::operator[] (int i) 
{
 if(i>=0 && i>=this->len)
 {
  //범위현재사이즈의  2배화, 나머지는 0으로 
//ex)10개짜리에 55번째에 넣기 -> 10 20 40 80(멈춤)
  int new_size=this->len;
  while(new_size<=i) new_size *=2;
  
  T* new_arr= new T[new_size];
  for(int p=0; p<this->len; p++)
   new_arr[p]=this->data[p];
  for(int p=this->len; p<new_size; p++)
   new_arr[p]=0;

  //옮긴다음에 기존클랫흐의 정보 바꿔야됨
 //옮기기작업하고 딜리트삭제
  T* ptr=this->data;
  this->data=new_arr; 
  this->len=new_size;
  delete[] ptr;

  return this->data[i];
 }
 else
 {
  return this->data[i];
 }
}
#endif
