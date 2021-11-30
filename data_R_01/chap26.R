#�籸�������� 1~5�� ������ ������ �Ѵ�.
a<-read.csv('cosmetics.csv', header= T)
attach(a)

library(car)
#���峷���ſ��� 3���� 0, ���̻��� 1�� ����ȭ
#recode - �׷캰�� ���� �ִ� �Ͱ�
a$repurchase_re <- recode(a$repurchase, "lo:3 = 0; 4:hi = 1; else = NA")

install.packages('ROCR')
install.packages('aod')

#glm: �Ϲ�ȭ ��������. ����ȸ�ͺм� �� �̷� �Ļ��� �͵� ���� ��Ű����
logit.model <- glm(a$repurchase_re ~ factor(propensity) + factor(decision) + satisf_al, family = binomial)
summary(logit.model)

#������ �������� ����, p���� 0�� �����. �����ϴٴ� ***�� ����. ������ ������ ��������, �籸��Ȯ�� ����
#decision�� ���, 2���� �ɸ��������ε�, 1���� ���������� 2���� 1���� ���� ~�ϴٴ� �� �ǹ��ϱ⿡
#���� p���� 1�� �����⿡, ũ�� �������� ����. 
#propensity�� ����, 2���� �������� ������ 3���� ����. ������ǰ�� ��ȣ�ϴ� ����� ���� ���� ��ȣ�ڰ� �籸������ ����

#����ȸ�Ϳ��� �״�� �м��� �����ϳ�, ������ƽ���� ȸ�Ͱ���� �״�� �ؼ� �Ұ�
#�»��(odds��)�� ��ȯ����. �� ������� �»�� �Ѵ�.
#���� e�� ���� �Ѵ�.

#confint = �ŷڱ���
exp(cbind(OR= coef(logit.model), confint(logit.model)))
#���ݸ��� 1�����Ҷ� �籸������ 8����
#������ ���� ������ǰ ��ȣ�ϴ»���� 3.3�� �籸������ ����

#������ 0.05���� �۴�. ���ż��� ����. decision�� 0.01�� �������� ����.
#������ ���������� �⿩�� Ȯ��
anova(logit.model, test='Chisq')

#������ ��
install.packages('pscl')
library(pscl)
pR2(logit.model)#������ ���� �α׵�. 0�� �������� ���� ������ �ǹ�

#�� a�� pre������ logit�𵨿� �ִ� ��� �� ����ġ�� �ִ´�
#�� �������, �� ������� ������ Ȯ����
a$pre <- logit.model$fitted.values

#������ƽ���� ������ �������������� ���� ����
#0.5�̻��� ��, �����ҰŶ� ����

#Ȯ�� 0.5 �������� ������ 0, �ƴϸ� 1�� �������� �Ѵ�.
#record�� �ڵ������� �Ѵ�
a$preGroup <- recode(a$pre, "lo:0.5 = 0, 0.5:hi = 1")
table(a$preGroup)

#repurchase_re�� preGroup�� ����, ������Ʋ���κ��� �ְ� �´ºκе� ����
model.fit1 <- predict(logit.model, type = 'response')#���Ӻ��� ����� ����
model.fit2 <- ifelse(model.fit1 > 0.5, 1, 0)
#��
model.fit3 <- data.frame(model.fit2) #model.fit2�� ���������·�

#������ ����
library(gmodels)
CrossTable(x=a$repurchase_re, y=model.fit3$model.fit2, chisq=T) #ī�������� ���� �ʿ�x
#����ġ�� ����ġ�� ����ǥ
#���� ���ѻ�� 97��, ���� 77��, �� ����Ȯ�� 0.794 Ʋ���� 0.206
#�����̶� ���� ������ �����ϰ� ����

library(ROCR)
pr <- prediction(model.fit1, repurchase_re)
prf <- performance(pr, measure= 'tpr', x.measure = 'fpr')
plot(prf) #�׸��׸���

#���� ����.
#��, �ش� ���� 
auc <- performance(pr, measure = 'auc')
acu <- auc@y.values[[1]]
auc