#ifndef __ARRAY_H__
#define __ARRAY_H__
#include <iostream>
#include <cstdlib>
using namespace std;
/*
GrowableArray:
사용에 따라 배열의인덱스 자동으로 조절
range밖의 인덱스 사용해 저장하고자 할때, 현 사이즈의 2배로 증가시킴
추가된 공간은 0으로 초기화

array를 상속해 필요한 부분만 코딩, 나머진 array의 멤버변수,함수 그대로이용

growablearray는 임의의 자료형 저장이 가능.
이를 위해, 저장되는 데이터변수를 임의의 자료형으로 선언
array클래스를 먼저 템플릿을 사용해 확장하라
*/

//override:두 클래스가 완전히 같을때만 쓸것
//virtual: 같은 함수 다른 클래스에서 포인터달라도 찐인스턴스 찾아냄
//main함수엔 앞의 두 입력예를 포함, 두 가지 수행결과가 함께 나오도록
//어레이, 그로우어레이 클래스는 각각 별도의 헤더파일에

template<class T>
class Array
{ 
 protected:
	T *data;
	int len;
 public:
	Array() {}; //no matching f for call to Array<double/int>::Array() 
	Array(int size);
	~Array();

 	int length() const;
	virtual T & operator[](int i);
	virtual T  operator[](int i) const;

 	void print();
};

template<class T>
Array<T>::Array (int size)
{
 if(size<=0) { cout<<"잘못된 사이즈입니다"; exit(-1); }
 else
 {
  data= new T[size]; //뉴할당으로 배열선언
  len=size;
 }
}

template<class T>
Array<T>::~Array()
{
 delete[] data;
}

template<class T>
int Array<T>::length() const
{
 return len;
}

template<class T>
T& Array<T>::operator[](int i)
{
 static T tmp;

 if(i<0 || i>len-1)
 {
  cout<<"범위에러\n"<<endl;
  return tmp;
 }
 else
 {
 return data[i];
 }
}

template<class T>
T Array<T> :: operator[] (int i)const
{
 if(i<0 || i>len-1)
 {
  cout<<"범위에러\n"<<endl;
  return 0;
 }
 else
 {
  return data[i];
 }
}

template <class T>
void Array<T>:: print()
{
 int i;
 cout<<"[";
 for(int i=1; i<=len; i++)
 {
  cout<<data[i]<<' ';
 }
 cout<<data[len-1]<<"]"<<endl;
}
#endif
