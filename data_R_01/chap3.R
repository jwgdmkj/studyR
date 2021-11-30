a<-3
b<-'A'
c<-c(1,2,3,4,5)
d<-c('a','b','c','d','e')

ls() //할당된 것들 리스트출력 함수. 위에 a b c d 할당했으므로 
remove(d) //d로 할당된 것 삭제

rm(list=ls()) //리스트 ls()를 전부 삭제

a<-c(1,2,3,4,5)
b<-c('A','B','C','D','E')
c<-factor(c('남','여','남','남'))
d<-c(T,F,T,T)
e<-c(3i)

aa<-as.character(a) //데이터타입 변경.

is.numeric(b)
is.character(b)
bb<-as.numeric(b)

is.logical(c)
is.factor(c)
is.complex(e)

//scan : 자료 집적 입력 scan('data'), scan()
//c: 자료 조합해 벡터 생성
//rep: 자료 반복해 벡터생성 rep(c(1,2)3) rep(NA,5)
//seq : 수치적 수열 seq(-pi, pi, 5)

a <- c(1,5,10)
b<- c('a','b','c')
c<- c('1','2','3')
d<-c(T,F,T)

height<-c(160,140,155)

name<-c("김","박","최")
names(height) <- name
height["박"] //김 박 최 각각 160,140,155 출력

a<-c(1:10)
b<-seq(1,7, by=2) //1 3 5 7로 2씩 증가
c<-seq(1, by=0.5, along=1:5) 1, 1.5, 2, 2.5, 3으로 0.5씩 총 5개
d<-seq(1, 7, length = 4) //1 3 5 7

//반복
e<-rep(c(1,2),3) //1 2 1 2 1 2
f<-rep(1:4, 2) // 1 2 3 4 1 2 3 4
g<-rep(c(4,2), length = 3) //4 2 4로, 길이 3까지 반복
h<-rep(c(4,2), each = 3) //4 4 4 2 2 2

g<-paste("go", 1:5) // go 1 go 2 go 3 go 4 go 5
a<-c(1:3) 
a<-c(a,4,5,6) //붙이기
b<-c(1,3,7,9)
b<-append(b,5, after=2) #b의 2번째요소 뒤에 5 대입입

a
b
c<-c(11:20)
d<-c[-1] #첫번째 요소 제거
e<-c[-2:-4] #2번째부터 4번째요소까지 제거

a<-c(1,2,'A','a') #1, 2가 문자로 됨

a<-matrix(1:4, nrow=2) #row가 2개로 되며 1 2 3 4 행렬대입
b<-matrix(1:9, nrow=3)
c<-matrix(nrow=2, ncol=3) #이건 c는 널. 미리 칸을 만들어두기
d<-matrix(1:6, nrow=2, byrow=T) #byrow 통해, 행먼저 채워두기로 함
d

e<-c(1:4, 1,1,0,0,1,0,1,0)
f<-matrix(e, 4,3) #f는 e를 4*3 행렬로 바꿈꿈
f<-matrix(f, 4, 3, byrow=T) #1 2 3 4 1 1 0 0 1로 

g<-matrix(1:10, 2, 5)
rownames(g) <- c("철수", "영희")
g
colnames(g)<- c("국어", "영어", "과학", "도덕", "체육")

x <- matrix(1:4, 2)
y <- matrix(5:8, 2)
x
y

x+y
x-y
x*y
x%*%y #일반 행렬연산
solve(x) #역행렬 구하기

x
t(x) #transition

a<-c(1:4, 1, 1, 0, 0, 1, 0, 1, 0)
b<-matrix(a, 4, 3)
b
c<-b[,2:3] #2에서 3까지의 칼럼을 뽑아내라. 앞의 행은 엇으니, 모두가져옴
c
d<-b[2:3,]
d
e<-b[2,]
e
