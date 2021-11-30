a<-read.csv('cosmetics.csv')
library(agricolae)

correlation(a, method= 'pearson') #서열적 자료는 spearmandlsk kendall
#다른 경우 상관관계는 pearson
#모든 변수에 대한 상관관계 등장
#p-value: 유의한 관계인지에 대한 확률

attach(a)
cor <- cbind(decision, satisf_b, satisf_i, satisf_al, repurchase)
#위에 대한 것들만 따로 바인드
correlation(cor, method = 'pearson')
#문의만족은 +이고, 0.58임. 구매문의만족도 높으면, 전반만족도 높다는 경향
#구매만족 낮으면, 전반만족도 낮음
#반대로, 가격만족도는 높든 낮든 전반만족도와 크게 상관업사(-0.03)
#재구매는, 구매문의만조과 전반만족에 큰 영향 받음

#가격에대한 만족과 재구매의향은 크게 영향이 없으므로, pvalue는 얘들끼리 높

#상관관계도표 그리기
pairs(cor)

#삼점도 그리기
library(ggplot2)
ggplot(as.data.frame(cor), aes(x=satisf_al, y=repurchase)) + geom_point()
ggplot(as.data.frame(cor), aes(x=satisf_al, y=repurchase)) + geom_point(color='red', fill='blue', alpha=0.5, size=6, stroke = 2)

ggplot(as.data.frame(cor), aes(x=satisf_al, y=repurchase, shape= factor(decision))) + geom_point(size = 6, alpha = 0.5)

#선형회귀
#선형구간 필요 없으면, led = F를 붙이면 됨됨
ggplot(as.data.frame(cor), aes(x=satisf_al, y=repurchase)) + geom_smooth(method = lm, color='red')
