#���� ���ְ� 3�� �̻�, ������ ����� �Ǵ�
#�Һ��� �Ϲ� Ư�� - ����, �з� ��
#�Һ��� ���� �ൿ - �����귣��, 1ȸ���ź��, ������Ƚ�� ��
#�Һ��� ���� - ���Ű��� ����, ���Ź��� ����
#���� - ���ݸ�����, �籸���ǻ�

a <- read.csv('cosmetics.csv', header =T)
library(psych)
attach(a)
describeBy(satisf_al, group = decision) #�� 3���� ������ ��ȸ, �ɸ�, �ܸ��� ���⿡ ���� ������
#�� ����� 3.2 3.3 3.6

#�л�м� analysis of variance
result <- aov(satisf_al ~ factor(decision)) #decision�� ����ȭ�� �ȵǾ��ִ�. ����, factor�� ó���ؾ���

#���� result�� �ٽɸ� �������Ѵ�. ���� ����, ���ܿ� ���� ����(���ܰ��л�)
#��� 2.6��, �� ���ܴ� decision(���ŵ���)�� ���� ��Ÿ���� ������ ����
#residual - ���� �� �л�, �� ǥ���� ��Ÿ���� ����(�� ����� �ܸ� ������ ������ �ٸ���, ���� ��)
#4.7�� f����, ������ ���� ���̰� �󸶳� ���°�?
summary(result)

#�븳���� - ��� �� ���� ���� ���̰� �ִٴ� �ǰ�
#�л�м� ��, post hop test�� ���� � ������ �� ũ�� �۳ĸ� 2���� �����Ѵ�. ��ǥ ��Ű����
TukeyHSD(result)
#95%�ŷڱ�������, �� ���� �� �������, ����&���Ѱ�, 
#3-2��, 3���������� ���Ѱ��� ���Ѱ��� �� ũ�Ƿ�, 1��°���ܺ��� �� ũ��.
#��, �������� ���̰� ����. �ܸ�� ��ȸ�� �������� �����ϴ������� ���̰� �����ϰ� ��.

install.packages('agricolae')
library(agricolae)
scheffe.test(result, "factor(decision)", alpha = 0.05, console = T) #���� ���Ǽ���
#���ĺ����� ���� ������ ��������� ���Ӻ����� ŭ. ����°����(�ܸ�������)�� a�� ���� ŭ
#��ȸ���� b�� ���̰� ����
#�ɸ��� ������ �߰��̹Ƿ� ab

duncan.test(result, "factor(decision)", alpha = 0.05, console = T)

library(ggplot2)
ggplot(a, aes(x=as.factor(decision), y=satisf_al)) + geom_boxplot(fill ='slateblue', alpha = 0.2) + xlab('���ŵ���') + ylab('���ݸ���') #������, ��, ���
ggplot(a, aes(x=satisf_al, group = decision, fill = decision)) + geom_density() + geom_density(adjust = 1.5)