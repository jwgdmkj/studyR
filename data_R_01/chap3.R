a<-3
b<-'A'
c<-c(1,2,3,4,5)
d<-c('a','b','c','d','e')

ls() //�Ҵ�� �͵� ����Ʈ��� �Լ�. ���� a b c d �Ҵ������Ƿ� 
remove(d) //d�� �Ҵ�� �� ����

rm(list=ls()) //����Ʈ ls()�� ���� ����

a<-c(1,2,3,4,5)
b<-c('A','B','C','D','E')
c<-factor(c('��','��','��','��'))
d<-c(T,F,T,T)
e<-c(3i)

aa<-as.character(a) //������Ÿ�� ����.

is.numeric(b)
is.character(b)
bb<-as.numeric(b)

is.logical(c)
is.factor(c)
is.complex(e)

//scan : �ڷ� ���� �Է� scan('data'), scan()
//c: �ڷ� ������ ���� ����
//rep: �ڷ� �ݺ��� ���ͻ��� rep(c(1,2)3) rep(NA,5)
//seq : ��ġ�� ���� seq(-pi, pi, 5)

a <- c(1,5,10)
b<- c('a','b','c')
c<- c('1','2','3')
d<-c(T,F,T)

height<-c(160,140,155)

name<-c("��","��","��")
names(height) <- name
height["��"] //�� �� �� ���� 160,140,155 ���

a<-c(1:10)
b<-seq(1,7, by=2) //1 3 5 7�� 2�� ����
c<-seq(1, by=0.5, along=1:5) 1, 1.5, 2, 2.5, 3���� 0.5�� �� 5��
d<-seq(1, 7, length = 4) //1 3 5 7

//�ݺ�
e<-rep(c(1,2),3) //1 2 1 2 1 2
f<-rep(1:4, 2) // 1 2 3 4 1 2 3 4
g<-rep(c(4,2), length = 3) //4 2 4��, ���� 3���� �ݺ�
h<-rep(c(4,2), each = 3) //4 4 4 2 2 2

g<-paste("go", 1:5) // go 1 go 2 go 3 go 4 go 5
a<-c(1:3) 
a<-c(a,4,5,6) //���̱�
b<-c(1,3,7,9)
b<-append(b,5, after=2) #b�� 2��°��� �ڿ� 5 ������

a
b
c<-c(11:20)
d<-c[-1] #ù��° ��� ����
e<-c[-2:-4] #2��°���� 4��°��ұ��� ����

a<-c(1,2,'A','a') #1, 2�� ���ڷ� ��

a<-matrix(1:4, nrow=2) #row�� 2���� �Ǹ� 1 2 3 4 ��Ĵ���
b<-matrix(1:9, nrow=3)
c<-matrix(nrow=2, ncol=3) #�̰� c�� ��. �̸� ĭ�� �����α�
d<-matrix(1:6, nrow=2, byrow=T) #byrow ����, ����� ä���α�� ��
d

e<-c(1:4, 1,1,0,0,1,0,1,0)
f<-matrix(e, 4,3) #f�� e�� 4*3 ��ķ� �ٲ޲�
f<-matrix(f, 4, 3, byrow=T) #1 2 3 4 1 1 0 0 1�� 

g<-matrix(1:10, 2, 5)
rownames(g) <- c("ö��", "����")
g
colnames(g)<- c("����", "����", "����", "����", "ü��")

x <- matrix(1:4, 2)
y <- matrix(5:8, 2)
x
y

x+y
x-y
x*y
x%*%y #�Ϲ� ��Ŀ���
solve(x) #����� ���ϱ�

x
t(x) #transition

a<-c(1:4, 1, 1, 0, 0, 1, 0, 1, 0)
b<-matrix(a, 4, 3)
b
c<-b[,2:3] #2���� 3������ Į���� �̾Ƴ���. ���� ���� ������, ��ΰ�����
c
d<-b[2:3,]
d
e<-b[2,]
e