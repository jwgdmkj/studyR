#재구매의향을 1~5로 구분해 보도록 한다.
a<-read.csv('cosmetics.csv', header= T)
attach(a)

library(car)
#가장낮은거에서 3까진 0, 그이상은 1로 범주화
#recode - 그룹별로 값을 주는 것것
a$repurchase_re <- recode(a$repurchase, "lo:3 = 0; 4:hi = 1; else = NA")

install.packages('ROCR')
install.packages('aod')

#glm: 일반화 선형모형. 선형회귀분석 및 이로 파생된 것들 포함 패키지지
logit.model <- glm(a$repurchase_re ~ factor(propensity) + factor(decision) + satisf_al, family = binomial)
summary(logit.model)

#전반적 만족도를 보면, p값이 0에 가까움. 유의하다는 ***를 보임. 전반적 만족도 높을수록, 재구매확률 높다
#decision의 경우, 2번은 심리적동기인데, 1번이 없는이유는 2번이 1번에 비해 ~하다는 걸 의미하기에
#거의 p값이 1에 가깝기에, 크게 유의하진 않음. 
#propensity를 보면, 2번은 유의하지 않으나 3번은 유의. 저가제품을 선호하는 사람에 비해 고가 선호자가 재구매의향 높다

#선형회귀에선 그대로 분석이 가능하나, 로지스틱에선 회귀계수를 그대로 해석 불가
#승산비(odds비)로 변환하자. 각 결과값에 승산비를 한다.
#각각 e의 승을 한다.

#confint = 신뢰구간
exp(cbind(OR= coef(logit.model), confint(logit.model)))
#전반만족 1증가할때 재구매의향 8증가
#저가에 비해 고가제품 선호하는사람은 3.3배 재구매의향 높다

#만족도 0.05보다 작다. 구매성향 역시. decision은 0.01로 생각보단 높다.
#전반적 독립변도의 기여도 확인
anova(logit.model, test='Chisq')

#설명도 봄
install.packages('pscl')
library(pscl)
pR2(logit.model)#모형에 대한 로그도. 0에 가까울수록 모델이 적합함 의미

#모델 a의 pre변수에 logit모델에 있는 결과 중 예측치를 넣는다
#그 결과값은, 각 사람들이 구매할 확률들
a$pre <- logit.model$fitted.values

#로지스틱에선 어떤사람이 구매할지안할지 여부 예측
#0.5이상일 때, 구매할거라 예측

#확률 0.5 기준으로 낮으면 0, 아니면 1로 나누고자 한다.
#record로 코딩변경을 한다
a$preGroup <- recode(a$pre, "lo:0.5 = 0, 0.5:hi = 1")
table(a$preGroup)

#repurchase_re와 preGroup을 통해, 예측이틀린부분이 있고 맞는부분도 있음
model.fit1 <- predict(logit.model, type = 'response')#종속변수 결과를 저장
model.fit2 <- ifelse(model.fit1 > 0.5, 1, 0)
#비교
model.fit3 <- data.frame(model.fit2) #model.fit2를 프레임형태로

#교차모델 생성
library(gmodels)
CrossTable(x=a$repurchase_re, y=model.fit3$model.fit2, chisq=T) #카이제곱은 딱히 필요x
#실제치와 예측치의 교차표
#실제 안한사람 97명, 실젠 77명, 즉 맞은확률 0.794 틀린건 0.206
#산사람이랑 살사람 예측도 동일하게 가능

library(ROCR)
pr <- prediction(model.fit1, repurchase_re)
prf <- performance(pr, measure= 'tpr', x.measure = 'fpr')
plot(prf) #그림그리기

#면적 구함.
#즉, 해당 구간 
auc <- performance(pr, measure = 'auc')
acu <- auc@y.values[[1]]
auc