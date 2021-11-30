
a <- read.csv('cosmetics.csv', header=T)
head(a)
tail(a)

table(gender)
table(a$gender)
table(a$marriage)

attach(a) #모든 데이터셋은  a갖고 하겠다.
table(gender)
table(job)
detach(a)

a$gender <- factor(a$gender, levels = c(1,2), labels = c('male', 'female')) #gender을 범주화해 덮어씌우겠다
#1, 2가 gender을 가리키는 것이 된다. 1번은 남자, 2번은 여자가 됨

table(a$gender)

install.packages('descr')
library(descr)
freq(a$gender) #도표로 표시. export -save as image로 저장이 가능
     
install.packages('ggplot2')
library(ggplot2)
ggplot(a, aes(x=gender)) + geom_bar(color='blue', fill=rgb(0.1, 0.4, 0.5, 0.7))
#도표 이쁘게 하기. 칼라는 테두리색, 채우기색 rgba

#남녀색 다르게
ggplot(a, aes(x=gender), fill = gender) + geom_bar() + scale_fill_hue(c=10)
ggplot(a, aes(x=gender), fill = gender) + geom_bar() + scale_fill_brewer(palette = 'set1')

pie(table(a$gender))

freq(edu)

install.packages('car')
library(car)
a$eduM <- recode(a$edu, "lo:2=1; 3:4=2; 5:hi=3; else='NA'") #low부터 2까지는 1집단, 3부터 4까진 2집단, 5부터 끝까진 3집단...
freq(a$eduM)

a$eduM <- factor(a$eduM, levels=c(1,2,3), labels = c('중졸이하', '고졸이하', '대학이상'))
freq(a$eduM)
