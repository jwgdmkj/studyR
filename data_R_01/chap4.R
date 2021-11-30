a<-array(1:24, c(3,3,2))
a

b<-c(1:6)

c<-array(1:6, c(2,3))
c

d<-array(1:8, c(2,2,2))
d

e<-c(1:24); dim(e) <- c(3,4,2)
e


f<-array(1:24, c(3,3,2))
f

dimnames(f) <-list(c("가","나","다"), c("A","B","C"), c("ARRAY1", "ARRAY2"))
f

dimnames(f)<-list(paste("row", c(1:3), paste("col"), c(1:3), paste("arr"), c(1:2)))
f

g<-array(1:24, c(3,4,2))
g
length(g)
mode(g)
dim(g)

a<-list('top', c(2,4,6), c(T,F,T))
a

b<-list(name=c('minsu','minchul'), cnt=2, age=c(2,6))
b

names(b)
length(b)
b$name

c<-list(c("Abe", "Bob", "Caro", "Deb"), c("weight", "height"))
names(c) <- c("Rows", "Columns")
c

name <- c('KIM', 'LEE', 'CHOI', 'PARK', 'JEONG')
gender<-as.factor(c('M','F','M','F','M'))
math <- c(100, 80, 90, 70, 60)
korean <- c(10, 20, 25, 30, 40)
attend<-c(T,F,T,T,F)

a<-data.frame(name, gender, math, korean, attend)
a

name <- c('SIN', 'SO')
gender<-as.factor(c('M','F'))
math <- c(100, 80)
korean <- c(10, 20)
attend<-c(T,F)

b<-data.frame(name, gender, math, korean, attend)
b
c<-rbind(a,b)
c

social<-c(100, 40, 50, 60, 70)
science<-c(22, 33, 44, 55, 66)
d<- cbind(a, social, science)

e<-transform(a, social=c(2,3,4,5,6), science =c(6,7,8,9,10))
e

name <- c('KIM', 'LEE', 'CHOI', 'PARK', 'JEONG')
japanese<-c(20,21,22,2,3)
f<-data.frame(name, japanese)
f

g<-merge(a, f, key = 'name') #name 토대로 머지

a
a$korean
a[,1:2] #행은 선택하지 않고 전부 제시, 1~2의 칼럼 제시
a[2:3,]
a[-1] # 첫번째 열 뺴고 다나와
a[-1,] #첫번째 행 빼고 다나와

a[a$math >= 70, ] #행이 조건이 math가 70인 것 이상만
a[a$name == "KIM", ]
a[a$math >= 80 | a$korean >= 40,]

h<-subset(a, select=c(name, math, korean), subset = (math>=90 & korean>=20))
h

a<-a[,x(1,2,6,5,4,3)] #칼럼의 순서 변경하기
i<- a[order(math, attend, -korean),] #수학을 오름차순, korean을 내림차순으로
#이때 
