
#####################################
#### 2강. R 설치하기              ###
#####################################

dir.create("D:/R_Works")
setwd("D:/R_Works")
getwd()
1+2
a<-c(1, 2, 3, 4, 5, 6, 7)
print(a)

help.start()
help("mean")
help.search("mean")

install.packages("dplyr")
install.packages(c("dplyr", "Rcmdr"))
install.packages("Hmisc", dependencise=T)

update.packages()
update.packages(ask=F)

remove.packages("Hmisc")

library(dplyr)
library(Hmisc)
detach("package:Hmisc")


#####################################
###  3강. 데이터 관리(1)          ###
#####################################

a<-3
b<- 'A'
c<-c(1, 2, 3, 4, 5)
d<-c('A', 'B', 'C', 'D', 'E')

ls()
rm(a)
remove(b)
rm(list=ls())

a<-c(1, 2, 3, 4, 5)
b<-c('A', 'B', 'C', 'D', 'E')
c<-factor(c('남', '여', '남', '남'))
d<-c(T, F, T, T)
e<-c(3i)

is.numeric(a)
is.character(b)
is.factor(c)
is.logical(d)
is.complex(d)

a<-c(1, 5, 10)
b<-c('a', 'b', 'c')
c<-c('1', '2', '3')
d<-c(T, F, T)

height<-c(160, 140, 155)
name<-c("이하은", "박연경", "김유미")
names(height)<-name
height
height['이하은']

a<-c(1:10)
a
b<-seq(1, 7, by=2)
b
c<-seq(1, by=0.5, along=1:5)
c
d<-seq(1, 7, length=4)
d

e<-rep(c(1, 2, 3), 3)
e
f<-rep(1:4, 2)
f
g<-rep(c(4,2), length=3)
g
h<-rep(c(4,2), each=3)
h

g<-paste("no", 1:5) 
g

a<-c(1:3)
a<-c(a, 4, 5, 6)
a
b<-c(1, 3, 7, 9)
b<-append(b, 5, after=2)
b
c<-c(11:20)
d<-c[-1]
d
e<-c[-1:-3]
e
a<-c(1, 'A', 'B', 2)
mode(a)
a[1]+a[3] # Error in a[1] + a[3] : non-numeric argument to binary operator

a<-matrix(1:4, nrow=2)	
b<-matrix(1:9, nrow=3)	
c<-matrix(nrow=2, ncol=3) 	
c[1,1]<-1; c[2,1]<-2; c[1,2]<-3; c[2,2]<-4; c[1,5]<-3; c[2,3]<-6
d<-matrix(1:6, nrow=2, byrow=T)

e<-c(1:4,1,1,0,0,1,0,1,0)
f<-matrix(e,4,3)


g<-matrix(1:10, 2, 5)
colnames(g)<-c("col1", "col2" , "col3", "col4", "col5")
rownames(g)<-c("cow1", "row2")
g

x<-matrix(1:4, 2)
y<-matrix(5:8, 2)
x+y	
x-y
x*y
x%*%y
solve(x)
t(x)

a<-c(1:4,1,1,0,0,1,0,1,0)
b<-matrix(a,4,3)
c<-b[,2:3]
d<-b[3:4,]
e<-b[3:4, 2:3]
f<-b[2,]
g<-b[2,, drop=F]


#####################################
###  4강. 데이터 관리(2)          ###
#####################################

a<-array(1:24, c(3,3,2))
b<-array(1:6)
c<-array(1:6, c(2, 3))
d<-array(1:8, c(2, 2, 2))
e<-c(1:24)
dim(e)<-c(3,4,2)

f<-array(1:24, c(3,3,2))
dimnames(f)<-list(c("1", "2", "3"), c("A", "B", "C"), c("ARR1", "ARR2"))
dimnames(f)<-list(paste("ROW", c(1:3)),paste("COL",c(1:3)),paste("ARR",c(1:2)))

g<-array(1:24, c(3,4,2))
dimnames(g)<-list(c("1", "2", "3"), c("A", "B", "C", "D"), c("ARR1", "ARR2"))
length(g)
mode(g)
dim(g)
dimnames(g)

a<-list("top", c(2,4,6), c(T,F,T))
b<-list(name = c("Minsu", "Minchul"), cnt=2, age=c(2,6))
c<-list(c("Abe","Bob","Caro","Deb"),c("Weight","height"))
names(c)<-c("Rows","Columns")
names(b)
length(b)
b$name
b$cnt
b$age
c$Rows

name<-c("KIM", "LEE", "HAN", "SHIN", "PARK")
gender<-as.factor(c("M", "F", "M", "M", "F"))
math<-c(100, 80, 75, 95, 65)
english<-c(80, 100, 60, 70, 80)
korean<-c(50, 70, 80, 100, 100)
attend<-c(T, F, T, T, F)
a<-data.frame(name, gender, math, english, korean, attend, stringsAsFactors=T)

name<-c("JANG", "JEONG")
gender<-as.factor(c("M", "F"))
math<-c(100, 80)
english<-c(80, 100)
korean<-c(50, 70)
attend<-c(T, F)
b<-data.frame(name, gender, math, english, korean, attend)
c<-rbind(a, b)

social<-c(100, 80, 50, 65, 70)
science<-c(80, 55, 75, 60, 100)
d<-cbind(a, social, science)

e<-transform(a, social=c(100, 80, 50, 65, 70), science=c(80, 55, 75, 60, 100))

name<-c("LEE", "KIM", "HAN", "SHIN", "PARK")
japanese<-c(100, 60, 70, 20, 50)
f<-data.frame(name, japanese)
g<-merge(a, f, key="name")

a$name
a[,1:2]
a[2:3,]
a[2:3, 1:2]
a[-1,]

a[a$math>=70,]
a[a$name=="KIM",]
a[a$english<90,]
a[a$math>=70&a$korean>=70,]
a[a$math<90|a$korean<90]

h<-subset(a, select=c(name, math, korean), subset=(math>=50 & korean>=70))

a<-a[,c(1, 2, 6, 5, 3, 4)]

i<-a[,c(1, 2, 6, 5, 3, 4)]
j<-a[order(math, -english, korean),]


#####################################
###   5강. 데이터파일 불러오기    ###
#####################################

a<-read.csv('ex_comma.csv', header=T, sep=',', encoding='latin1', na.strings="-")
b<-read.csv('ex_tab.csv', header=T, sep='\t', encoding='latin1')
c<-read.csv(file.choose(), header=T, sep=',', encoding='latin1')

install.packages("xlsx")
library(xlsx)
d<-read.xlsx('ex_xlsx.xlsx', sheetIndex=1, encoding='UTF-8')
e<-read.xlsx(file.choose(), sheetIndex=1, encoding='UTF-8')

write.table(a, 'save_sample.csv', row.names=FALSE, quote=FALSE, sep=',') 


#####################################
### 7강. 데이터탐색과 빈도분석    ###
#####################################

setwd("D:/R_Works")
a <- read.csv('cosmetics.csv', header = T, sep = ',')
a <- read.csv(file.choose(), header = T, sep = ',')
head(a)

table(a$gender)
attach(a)
table(gender)
install.packages("descr")
library(descr)
freq(a$gender)

install.packages("ggplot2")
library(ggplot2)
ggplot(a, aes(x=as.factor(gender) )) + geom_bar()
ggplot(a, aes(x=as.factor(gender) )) +geom_bar(color="blue", fill=rgb(0.1,0.4,0.5,0.7) )
ggplot(a, aes(x=as.factor(gender), fill=as.factor(gender) )) + geom_bar( ) + scale_fill_hue(c = 40)
ggplot(a, aes(x=as.factor(gender), fill=as.factor(gender) )) + geom_bar( ) + scale_fill_brewer(palette = "Set1")
ggplot(a, aes(x=as.factor(gender), fill=as.factor(gender) )) + geom_bar( ) + scale_fill_grey(start = 0.25, end = 0.75)
ggplot(a, aes(x=as.factor(gender), fill=as.factor(gender) )) +  geom_bar( ) + scale_fill_manual(values = c("red", "green", "blue") )

pietale<-table(a$gender)
pie(pietale)
pie(pietale, edges=10)
pie(pietale, radius=1)
pie(pietale, radius=0.2)
pie(pietale, clockwise = FALSE)
pie(pietale, clockwise = TRUE)
pie(pietale, density=10 , angle=c(20,90,30,10,0))
pie(pietale, border="grey")

freq(edu)
library(car)
a$eduM <- recode(edu, "lo:2=1; 3:4=2; 5:hi=3; else='NA'")
a$countM <- recode(count, "lo:2=1; 3:4=2; 5:hi=3; else='NA'")
a$mincomeM <- recode(mincome, "lo:2=1; 3:4=2; 5:hi=3; else='NA'")
freq(eduM)

detach(a)
attach(a)


#########################################
### 8강. 데이터탐색과 기술통계분석    ###
#########################################

attach(a)

max(amount)
min(amount)
sum(amount)
mean(amount)
var(amount)
sd(amount)

install.packages("psych")
library(psych)
describe(a)

summary(amount)

tst<-aggregate(amount ~ gender, a, mean)
tst<-tapply(amount, gender, mean)
tst

boxplot(amount)
hist(amount)

qplot(amount, geom="histogram")
qplot(amount, geom="histogram", bins=50)
qplot(amount, geom="histogram", bandwidth=50)
qplot(amount, geom="histogram", main = "Histogram for Amount", xlab = "Amount",  fill=I("blue"))


upQuan <- quantile(amount)[4]
loQuan <- quantile(amount)[2]
IQR = upQuan - loQuan

#upOutlier <- amount[which(amount > upQuan + IQR * 1.5)]
#loOutlier <- amount[which(amount < loQuan - IQR * 1.5)]

a$amount <- ifelse(amount > upQuan + IQR * 1.5 | amount < loQuan - IQR * 1.5, NA, a$amount)
a <- na.omit(a)
detach(a)
attach(a)
write.table(a, 'cosmetics_modified.csv', row.names=FALSE, quote=FALSE, sep=',') 
boxplot(amount)
hist(amount)

install.packages("moments")
library(moments)
skewness(amount)
kurtosis(amount)


#########################################
### 12강. 교차분석의 실습과 시각화    ###
#########################################

attach(a)
table(propensity, skin)
chisq.test(propensity, skin, correct = F)
table(gender, aware)
chisq.test(gender, aware, correct = F)

install.packages("gmodels")
library(gmodels)
CrossTable(x=propensity, y=skin, chisq = T)

cross1<-table(gender, aware)
barplot(as.matrix(cross1))

cross2<-table(aware, gender)
barplot(as.matrix(cross2))


###################################################
### 14강. 독립표본 t-test분석의 실습과 시각화   ###
###################################################

library(psych)
describeBy(count,group=gender)
leveneTest(count, factor(gender), center=mean)
t.test(count ~ gender, var.equal = F)

describeBy(satisf_b,group=gender)
leveneTest(satisf_b, factor(gender), center = mean)
t.test(satisf_b ~ gender, var.equal = T)

library(ggplot2)

ggplot(a, aes(x=as.factor(gender), y=count)) + 
  geom_boxplot(fill="slateblue", alpha=0.2) + 
  xlab("cyl")

ggplot(a, aes(x=as.factor(gender), y=satisf_b)) + 
  geom_boxplot(fill="slateblue", alpha=0.2) + 
  xlab("cyl")

library(ggplot2)

ggplot(data=a,aes(x=count, group=gender)) + 
  geom_density(adjust=1.5)

ggplot(data=a,aes(x=count, group=gender, color=gender)) + 
  geom_density(adjust=1.5)

ggplot(data=a,aes(x=count, group=gender, fill=gender)) + 
  geom_density(adjust=1.5)

ggplot(data=a,aes(x=satisf_b, group=gender)) + 
  geom_density(adjust=1.5)

ggplot(data=a,aes(x=satisf_b, group=gender, color=gender)) + 
  geom_density(adjust=1.5)

ggplot(data=a,aes(x=satisf_b, group=gender, fill=gender)) + 
  geom_density(adjust=1.5)


###################################################
### 16강. 대응표본 t-test분석의 실습과 시각화   ###
###################################################

describe(satisf_b)
describe(satisf_i)
t.test(satisf_b, satisf_i ,paired=TRUE)

library(ggplot2)

ggplot(data=a,aes(x=satisf_b, fill='red')) + 
  geom_density(adjust=1.5)

ggplot(data=a,aes(x=satisf_i, fill='blue')) + 
  geom_density(adjust=1.5 , alpha=0.2)


########################################
### 18강. 분산분석의 실습과 시각화   ###
########################################

attach(a)

library(psych)
describeBy(satisf_al, group=decision)
ano <- aov(satisf_al ~ factor(decision))
summary(ano)

TukeyHSD(ano)

install.packages("agricolae")
library(agricolae)

scheffe.test(ano, "factor(decision)", alpha=0.05, console=T)
duncan.test(ano, "factor(decision)", alpha=0.05, console=T)
LSD.test(ano, "factor(decision)", alpha=0.05, console=T)

# ggplot 불러오기
library(ggplot2)

# 구매동기~ 전반만족간 box plot
ggplot(a, aes(x=as.factor(decision), y=satisf_al)) + 
  geom_boxplot(fill="slateblue", alpha=0.2) + 
  xlab("cyl")

# 구매동기~ 전반만족간 histogram plot
ggplot(data=a,aes(x=satisf_al, group=decision, fill=decision)) + 
  geom_density(adjust=1.5)


############################################
### 20강. 상관관계분석의 실습과 시각화   ###
############################################

library(agricolae)
correlation(a, method="pearson")

attach(a)

cor<-cbind(decision, satisf_b, satisf_i, satisf_al, repurchase)
correlation(cor, method="pearson")
correlation(cor, method="spearman")
correlation(cor, method="kendall")
pairs(cor)

library(ggplot2)
cor<-data.frame(cor)
ggplot(cor, aes(x=satisf_al, y=repurchase)) + geom_point()
ggplot(cor, aes(x=satisf_al, y=repurchase)) + geom_point(color="red", fill="blue", shape=21, alpha=0.5, size=6, stroke = 2)
ggplot(cor, aes(x=satisf_al, y=repurchase, color=decision, shape=factor(decision))) + geom_point(size=6, alpha=0.6)
ggplot(cor, aes(x=satisf_al, y=repurchase, color=satisf_al, size=satisf_al)) + geom_point(alpha=0.6)

ggplot(cor, aes(x=satisf_al, y=repurchase)) + geom_point(shape=1) +  geom_smooth(method=lm , color="red", se=FALSE)
ggplot(cor, aes(x=satisf_al, y=repurchase)) + geom_point(shape=1) +  geom_smooth(method=lm , color="red", se=TRUE)


############################################
### 22강. 선형회귀분석의 실습과 시각화   ###
############################################

install.packages("pequod")
library(pequod)

model1<-lm(repurchase ~ satisf_i, data=a, x=TRUE, y=TRUE)
anova(model1)
summary(model1)

install.packages("lm.beta")
library(lm.beta)

model2<-lm.beta(model1)
summary(model2)

ncvTest(model1)
library(lmtest)
dwtest(model1)

par(mfrow=c(1,2))
plot(model1)
avPlots(model1, id.n=2, id.cex=0.7)

outlierTest(model1)
influenceIndexPlot(model1, id.n=3)


############################################
### 24강. 더미회귀분석의 실습과 시각화   ###
############################################

library(pequod)
dum.model1<-lm(repurchase ~ satisf_b+satisf_i+factor(gender)+factor(decision), data=a, x=TRUE, y=TRUE)
anova(dum.model1)
summary(dum.model1)

library(lm.beta)
dum.model2<-lm.beta(dum.model1)
summary(dum.model2)


#################################################
### 26강. 로지스틱 회귀분석의 실습과 시각화   ###
#################################################

#repurchase(재구매의향)을 비구매(0), 구매(1)로 코딩변경

a<-read.csv('cosmetics.csv', header=T)
library(car)
a$repurchase_re <- recode(a$repurchase, "lo:3=0; 4:hi=1; else=NA")

attach(a)

install.packages("ROCR")
install.packages("aod")
library(aod)
library(Rcpp)

logit.model<-glm(repurchase_re~factor(propensity)+factor(decision)+satisf_al, family=binomial)

summary(logit.model)
exp(cbind(OR=coef(logit.model), confint(logit.model)))

anova(logit.model, test="Chisq")

install.packages("pscl")
library(pscl)
pR2(logit.model)

a$pre<-logit.model$fitted.values
a$preGroup<-recode(a$pre, "lo:0.5=0; 0.5:hi=1")

library(gmodels)
CrossTable(x=a$repurchase_re, y=a$preGroup, chisq = T)

model.fit1<-predict(logit.model, type='response')
model.fit2<-ifelse(model.fit1 > 0.5,1,0)
model.fit3<-data.frame(model.fit2)

library(gmodels)
CrossTable(x=a$repurchase_re, y=model.fit3$model.fit2, chisq = T)

library(ROCR)
pr <- prediction(model.fit1, repurchase_re)
prf <- performance(pr, measure = "tpr", x.measure = "fpr")
plot(prf)

auc <- performance(pr, measure = "auc") 
auc <- auc@y.values[[1]]
auc
