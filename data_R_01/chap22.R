a<-read.csv('cosmetics.csv')
attach(a)

plot(satisf_i, satisf_al)

#����ȸ�Ϳ��
install.packages('pequod')
library(pequod)

#����~��������
model1<-lm(satisf_al~satisf_i, data = a)
summary(model1) #34%�����Ͱ������̴�. ȸ�Ͱ���� 0.3416, p���� ���� 0����, ���� ���� ����ִ�

#satisf_i�� 1 �����Ҷ�, ���Ӻ����� �� 0.5 �����Ѵ�.
#ǥ�ؿ���: ����/����. 0.53��, ������ ���� �� ��Ÿ���� 0.04������ �޶������ִ�

library(ggplot2)
ggplot(a, aes(x=satisf_i, y=satisf_al)) + geom_smooth(method = lm) + geom_point()

#X���� �޶����Ŀ����� Y�������� ����, �ٸ���?
#�͹�������, �Ⱒ�� ����.
ncvTest(model1)
library(lmtest)
dwtest(model1) #DW=2, ���Ӻ����� ���������谡 ���ٴ� ��
#�迭�� ���Ӻ����� ������� �ִٴ� �͹����� ä�ý�Ű�� P�� 0.55

#�׷����� �ѹ��� 2���� �����ִ� 
par(mfrow=c(1,2))
plot(model1)
#������ ����ġ�� ���� �� ��� ������ִ°� ǥ��. 
#����, 0�� �߽����� �� ������.
#����ġ�� ����ġ�� ���̰� ���밪 2���� ū����, �ش�Ǵ� ��ȣ�� ���� ����
#������ qq�����, ���Լ��� ���� ǥ��

#������ �����̼���, ����ġ�� ����ġ(��Ʈ�������) ������

outlierTest(model1) #����� �� ��� �͵� ������
#����ġ�� ����ġ�� ���̰� ǥ��ȭ ��, 2���̻� ��� �͵� ��������

influenceIndexPlot(model1)

a$pre<-model1$fitted.values #��� �������� ����� ����, pre�� ����
a$pre #������ i�� ������ al�� ��ġ�� ����. i�� 2�� ��, al�� ���� �Ŀ� ���ϸ�
#2.7�� ������. 3�� ��, 3.2�� ������

a$res<-model1$residuals #�� ���� ǥ��
hist(a$res)

model2 <- lm(satisf_al~satisf_i + satisf_b, data=a)
summary(model2)

install.packages('lm.beta')
library(lm.beta)
model3<-lm.beta(model2)
summary(model3) #estimate ���� standardized(ǥ��ȭ�� ���) ����
#ȸ�Ͱ���� 1�� 0 ���̷� ǥ��ȭ����, ��ġ�� �ٸ� �� �ִ� estimate�� �񱳰��ɴ�
