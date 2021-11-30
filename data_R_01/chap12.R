a <- read.csv('cosmetics.csv', header = T)
attach(a)
table(propensity, skin) #이 결과를, word에 대입
chisq.test(propensity, skin, correct = T) #교차분석의 카이제곱값.
#카이제곱 검정값: 기대되는 차이 없을때 결과와 실제관측값 차이를 더한 것
#(빼서 제곱해서 더함), p-value : 귀무가설 채택(0.05,95%) 내에 있는지, 혹은
#그 밖에있어서 대립가설을 써야 하는지. correct가 t든 f든 결과는 같음

#성별에 따른 인지하는 브랜드가 다른가를 조사
table(gender, aware)
chisq.test(gender, aware, correct = F)

install.packages('gmodels')
library(gmodels)

CrossTable(x=propensity, y=skin, chisq=T)
#1의 두번째줄 : 60명을 100%로 했을 때, 1번성향을 갖는 사람 중 1번타입 스킨은 0.367%
#첫번째 줄 : 세로 81 : 건성 중 1번 propensity은 0.274%
#전체 247은 세번째줄에 표시시
#맨 밑엔 카이제곱값 나옴. 

cross1 <- table(propensity, skin) 
barplot(as.matrix(cross1))
