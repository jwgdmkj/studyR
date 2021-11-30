a<-read.csv('cosmetics.csv')
attach(a)

plot(satisf_i, satisf_al)

#선형회귀용용
install.packages('pequod')
library(pequod)

#종속~독립변수
model1<-lm(satisf_al~satisf_i, data = a)
summary(model1) #34%데이터가적합이다. 회귀계수율 0.3416, p값은 거의 0으로, 둘은 서로 상관있다

#satisf_i가 1 증가할때, 종속변수는 약 0.5 증가한다.
#표준오차: 차이/오차. 0.53은, 모집단 추정 중 나타내는 0.04정도로 달라질수있다

library(ggplot2)
ggplot(a, aes(x=satisf_i, y=satisf_al)) + geom_smooth(method = lm) + geom_point()

#X값이 달라지냐에따라 Y값분포가 같냐, 다르냐?
#귀무가설은, 기각된 상태.
ncvTest(model1)
library(lmtest)
dwtest(model1) #DW=2, 종속변수의 순서적관계가 없다는 뜻
#배열간 종속변수간 상관관계 있다는 귀무가설 채택시키는 P값 0.55

#그래프를 한번에 2개씩 보여주는 
par(mfrow=c(1,2))
plot(model1)
#왼쪽은 예측치와 오차 간 어떻게 흩어져있는가 표시. 
#현재, 0을 중심으로 잘 분포됨.
#예측치와 실제치의 차이가 절대값 2보다 큰것은, 해당되는 번호가 적힌 상태
#오른쪽 qq노멀은, 정규성에 대해 표시

#스케일 로케이션은, 실제치와 예측치(루트씌운상태) 보여줌

outlierTest(model1) #상당히 값 벗어난 것들 보여줌
#실제치와 예측치간 차이가 표준화 시, 2배이상 벗어난 것들 보여줌줌

influenceIndexPlot(model1)

a$pre<-model1$fitted.values #모든 예측값이 저장된 것을, pre에 저장
a$pre #만족도 i가 만족도 al에 미치는 영향. i가 2일 때, al은 본래 식에 의하면
#2.7로 추측됨. 3일 땐, 3.2로 예측됨

a$res<-model1$residuals #그 오차 표시
hist(a$res)

model2 <- lm(satisf_al~satisf_i + satisf_b, data=a)
summary(model2)

install.packages('lm.beta')
library(lm.beta)
model3<-lm.beta(model2)
summary(model3) #estimate 옆에 standardized(표준화된 결과) 등장
#회귀계수를 1과 0 사이로 표준화시켜, 수치가 다를 수 있는 estimate를 비교가능능

