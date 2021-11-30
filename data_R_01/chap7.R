a <- read.csv('cosmetics.csv', header = T)
attach(a)
max(amount)
min(amount)
sum(amount)
mean(amount)
var(amount) #분산
sd(amount) #표준편차

#describe 명령어용 패키지 psych
install.packages('psych')
library(psych)
describe(a) #모든 변수에 대해 mean, sd, 중위수, 상(하)한값 뺀 평균 등 알려줌

summary(amount) #amount에 대해서만 표시. qu: 사분위
aggregate(amount~gender, a, mean) #남녀간 amount 평균 표시
tapply(amount, gender, mean) #집단별 통계

hist(amount) #도표로 보기
boxplot(amount)

library(ggplot2)
qplot(amount, geom = 'histogram')
qplot(amount, geom = 'histogram', bins = 50) #bins = 너비
qplot(amount, geom = 'histogram', bins = 50, main = 'Histogram for Amount', xlab =
        'Amount', ylab = 'won', fill=I('blue'))
#이상치: 너무 벗어난 것에 대해 제거
upQuan <- quantile(amount)[4] #상위값에 분위수의 [4]: 상위에 해당하는 값
loQuan <- quantile(amount)[2] #하위값에 분위수의 [2]: 하위 기준 중위수값
IQR = upQuan - loQuan 
IQR #70000원의 기준 벗어나는것을 
a$Dmount <- ifelse(amount > upQuan + IQR*1.5 | amount < loQuan - IQR*1.5,
                   NA, a$amount)
describe(a) #Dmount로, 새로이 이상한 수치에 해당하는 것을 제외한 것 생성
qplot(a$Dmount, geom = 'histogram')

#100000이상인것 빼보자. 평균치가 가장 많아지도록 갱신되는 것을 볼 수 있다.
a$Dmount <- ifelse(a$Dmount > 100000, NA, a$Dmount)
