#독립 범주가 3개 이상, 연속인 경우의 판단
#소비자 일반 특성 - 성별, 학력 등
#소비자 구매 행동 - 인지브랜드, 1회구매비용, 연구매횟수 등
#소비자 만족 - 구매가격 만족, 구매문의 만족
#성과 - 전반만족도, 재구매의사

a <- read.csv('cosmetics.csv', header =T)
library(psych)
attach(a)
describeBy(satisf_al, group = decision) #각 3개의 집단의 사회, 심리, 외모적 동기에 따른 만족도
#의 평균이 3.2 3.3 3.6

#분산분석 analysis of variance
result <- aov(satisf_al ~ factor(decision)) #decision은 범주화가 안되어있다. 따라서, factor로 처리해야함

#위의 result의 핵심만 보고자한다. 위의 줄이, 집단에 따른 차이(집단간분산)
#평균 2.6이, 한 집단당 decision(구매동기)에 따라 나타나는 만족도 차이
#residual - 집단 내 분산, 한 표본당 나타나는 오차(각 사람당 외모 동기의 정도가 다르니, 이의 차)
#4.7의 f값은, 오차에 비해 차이가 얼마나 나는가?
summary(result)

#대립가설 - 적어도 두 집단 간의 차이가 있다는 의견
#분산분석 후, post hop test를 통해 어떤 집단이 더 크고 작냐를 2개씩 검정한다. 대표 투키검정
TukeyHSD(result)
#95%신뢰구간에서, 각 집단 간 평균차이, 상한&하한값, 
#3-2는, 3번쨰집단이 하한값도 상한값도 더 크므로, 1번째집단보다 값 크다.
#즉, 유의히게 차이가 난다. 외모와 사회적 기준으로 구매하는집단의 차이가 유의하게 남.

install.packages('agricolae')
library(agricolae)
scheffe.test(result, "factor(decision)", alpha = 0.05, console = T) #알파 유의수준
#알파벳으로 높은 집단이 통계적으로 종속변수가 큼. 세번째집단(외모적요인)이 a로 제일 큼
#사회적이 b로 차이가 있음
#심리적 요인은 중간이므로 ab

duncan.test(result, "factor(decision)", alpha = 0.05, console = T)

library(ggplot2)
ggplot(a, aes(x=as.factor(decision), y=satisf_al)) + geom_boxplot(fill ='slateblue', alpha = 0.2) + xlab('구매동기') + ylab('전반만족') #데이터, 축, 방식
ggplot(a, aes(x=satisf_al, group = decision, fill = decision)) + geom_density() + geom_density(adjust = 1.5)
