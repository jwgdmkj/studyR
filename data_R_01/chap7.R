a <- read.csv('cosmetics.csv', header = T)
attach(a)
max(amount)
min(amount)
sum(amount)
mean(amount)
var(amount) #�л�
sd(amount) #ǥ������

#describe ���ɾ�� ��Ű�� psych
install.packages('psych')
library(psych)
describe(a) #��� ������ ���� mean, sd, ������, ��(��)�Ѱ� �� ��� �� �˷���

summary(amount) #amount�� ���ؼ��� ǥ��. qu: �����
aggregate(amount~gender, a, mean) #���ణ amount ��� ǥ��
tapply(amount, gender, mean) #���ܺ� ���

hist(amount) #��ǥ�� ����
boxplot(amount)

library(ggplot2)
qplot(amount, geom = 'histogram')
qplot(amount, geom = 'histogram', bins = 50) #bins = �ʺ�
qplot(amount, geom = 'histogram', bins = 50, main = 'Histogram for Amount', xlab =
        'Amount', ylab = 'won', fill=I('blue'))
#�̻�ġ: �ʹ� ��� �Ϳ� ���� ����
upQuan <- quantile(amount)[4] #�������� �������� [4]: ������ �ش��ϴ� ��
loQuan <- quantile(amount)[2] #�������� �������� [2]: ���� ���� ��������
IQR = upQuan - loQuan 
IQR #70000���� ���� ����°��� 
a$Dmount <- ifelse(amount > upQuan + IQR*1.5 | amount < loQuan - IQR*1.5,
                   NA, a$amount)
describe(a) #Dmount��, ������ �̻��� ��ġ�� �ش��ϴ� ���� ������ �� ����
qplot(a$Dmount, geom = 'histogram')

#100000�̻��ΰ� ������. ���ġ�� ���� ���������� ���ŵǴ� ���� �� �� �ִ�.
a$Dmount <- ifelse(a$Dmount > 100000, NA, a$Dmount)