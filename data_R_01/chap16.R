a<-read.csv('cosmetics.csv', header = T)
describe(a$satisf_b)
describe(a$satisf_i)

#가격만족, 문의만족을 pair로 대응표본 test
t.test(a$satisf_b, a$satisf_i, paired = T) 
#t값은 -7.15 차이가 크다. 유의확률은 0.0000..9519로, 0에 가까움.
#분포도 그릴 때, 가장 높은 쪽이 '차이가 없다'
#가격만족도 3, 문의만족도 3일 때, 귀무가설과 일치하기에, t=0
#이러한 결과가 나타날 확률이 제일 크기에, p=1
#근데, 정작 결과가 7.15(표준오차의 7.15배), 95에 해당하는 구간을 벗어남
#t가 2보다 크다면, p는 0.05보다 클 확률이 크다.
#t값이 클수록,귀무가설로 나타날 확률이 낮다. 귀무채택 x

describe(a$satisf_al)
describe(a$repurchase)
t.test(a$satisf_al, a$repurchase, paired=T)
#각 평균 3.46, 3.55이고, t는 -2.12. 귀무가설상이 맞을 확률 0.03이기에, 대립가설 채택하자.

#그래프로 표기기
ggplot(data= a, aes(x=satisf_al, fill = 'red')) + geom_density(adjust = 1.5)
