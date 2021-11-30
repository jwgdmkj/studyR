
a <- read.csv('cosmetics.csv', header=T)
head(a)
tail(a)

table(gender)
table(a$gender)
table(a$marriage)

attach(a) #��� �����ͼ���  a���� �ϰڴ�.
table(gender)
table(job)
detach(a)

a$gender <- factor(a$gender, levels = c(1,2), labels = c('male', 'female')) #gender�� ����ȭ�� �����ڴ�
#1, 2�� gender�� ����Ű�� ���� �ȴ�. 1���� ����, 2���� ���ڰ� ��

table(a$gender)

install.packages('descr')
library(descr)
freq(a$gender) #��ǥ�� ǥ��. export -save as image�� ������ ����
     
install.packages('ggplot2')
library(ggplot2)
ggplot(a, aes(x=gender)) + geom_bar(color='blue', fill=rgb(0.1, 0.4, 0.5, 0.7))
#��ǥ �̻ڰ� �ϱ�. Į��� �׵θ���, ä���� rgba

#����� �ٸ���
ggplot(a, aes(x=gender), fill = gender) + geom_bar() + scale_fill_hue(c=10)
ggplot(a, aes(x=gender), fill = gender) + geom_bar() + scale_fill_brewer(palette = 'set1')

pie(table(a$gender))

freq(edu)

install.packages('car')
library(car)
a$eduM <- recode(a$edu, "lo:2=1; 3:4=2; 5:hi=3; else='NA'") #low���� 2������ 1����, 3���� 4���� 2����, 5���� ������ 3����...
freq(a$eduM)

a$eduM <- factor(a$eduM, levels=c(1,2,3), labels = c('��������', '��������', '�����̻�'))
freq(a$eduM)