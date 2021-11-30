#세션 - 워킹디렉토리- 추즈...
a <- read.csv('cosmetics.csv', header = T)

#gender은 일반적으로 무조건 M, F로 매핑되어 있다(기본전역으로).
#따라서, 만일 파일 내의 gender을 사용하고자 할 경우, 반드시 attach를 시킨
#파일변수를 이용해서, a$gender와 같이 활용해야 한다.
#혹은, rm(gender)을 통해, 기본적으로 존재하는 걸 제거해야
#gender로 csv내의 gender칼럼의 활용이 가능하다.

#attach()로 활성화 시켜서 메모리에 데이터가 올라온 상태에서 '$'로 혹은 transform() 함수로 
#데이터 객체를 변경하였다면 detach() 로 활성화를 해제시켰다가 다시 attach()로 활성화시켜야함.


attach(a)
aggregate(count~a$gender, a, sd) #aggregate는 데이터의 특정컬럼을 기준으로 통계량을 구함
tapply(count, a$gender, sd) #각 gender들의 count의 평균, 즉 각 gender의 count를 합해 나눔
#sd - 표준편차

install.packages('Rcmdr')
library(Rcmdr)
library(psych)
describeBy(count, group = a$gender) #*(데이터프레임, 그룹핑 변수) : 집단별 기술통계량 구함
#group1은 남자집단, group2는 여자집단

leveneTest(count, factor(a$gender), center = mean) #종속변수, 범주형, 기준준은 평균값
#분산이 같은지에 대한 검정. T값이 0.0011이므로, 이분산.
t.test(count~a$gender, var.equal = F) #분산이 다른 게 판정났으니, var.equal=F
#t가 -4.21. 만일 두 집단 차이가 없다면, 0이었을 것.
#이러한 결과가 귀무가설에서 나올 확률은, 0.00003977. 

#성별에 따른 만족도차이
describeBy(satisf_al, group = a$gender)
leveneTest(satisf_al, factor(a$gender), center = mean) #평균 차이 없고, T갑이 0.34, 등분산
t.test(satisf_al~a$gender, var.equal=T) #따라서, 등분산T로 둠. 
#p-value가 0.6으로, 0.5보다 크기에, 남녀간 만족도 차이는 없다는 결과

library(ggplot2)

a$gender <- factor(a$gender, levels = c(1,2), labels = c('남', '여'))
ggplot(a, aes(x=as.factor(gender), y=count)) + geom_boxplot(fill = 'slateblue')+ xlab('gender')
ggplot(a, aes(x=as.factor(gender), y=satisf_al)) + geom_boxplot(fill = 'slateblue')+ xlab('gender')
#데이터, 축(x는 성별, y는 count) + 그래프의 형식은 boxflot

#분포도 형태
#축은 aes, 구매회수 x축, 성별 y축, 밀도형태로 표기기
ggplot(data=a, aes(x=count, group = a$gender)) + geom_density(adjust = 1.5)
#adjust = 조정값.	밀도곡선의 평활성 설정. 숫자가 작을수록 울퉁불퉁하게 요동침

