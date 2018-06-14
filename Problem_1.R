## Homework 4, ## Problem 1

library(dplyr)

## Read the data

houseWork <-  read.csv('https://s3.eu-central-1.amazonaws.com/econometrics2018/data/houseWork.csv')

str(houseWork)

## a)

summary(houseWork$sex)

## b)

muF <- mean(houseWork$hours[houseWork$sex == 'f'])

muM <- mean(houseWork$hours[houseWork$sex == 'm'])

## c)

houseWork$female <- ifelse(houseWork$sex == 'f', 'TRUE', 'FALSE')

houseWork$male <- ifelse(houseWork$sex == 'm', 'TRUE', 'FALSE')

View(houseWork)

## d)

fit <- lm(hours ~ female, data = houseWork)

summary(fit)

## e)

## The incercept is positive. This shows that if women do not do any housework
## the amount of work that men will do will be equal to the average value of working
## hours by men per week. In addition to that, Beta1 is negative. Given that, we come
## to the conclusion that women work less on average than men and +1 woman would
## decrease the overall average working hours per week.

## f)

## We can rewrite the null hypothesis as: H0 beta1 >= 0.
## In this case, the alternative hypothesis would be: H1 beta1 < 0.
## This would mean that the null hypothesis says that women's
## working hours contribute to the average whole population working hours.
## However, if we take the results from the linear model under consideration,
## we reject the null hypotheses, which leads to our comment that women actually
## decrease the overall working hours.

## g)

populationMean <- mean(houseWork$hours)

testStatistic <- sqrt(11016) * (muF - populationMean) / 0.3186

pt(testStatistic, df = 11016)

## h)

## There is zero probability to make a mistake when rejecting the null hypothesis
## if it is true. Thus we can reject the null hypothesis.

## i)

## The test assumes that the population follows a t-distribution, however, our expectations are that the
## distribution is normal or normal exponential, because we are estimating time values.

## j)

fit1 <- lm(hours ~ female + male, data = houseWork)

summary(fit1)

## The model is:
## Y = beta0 + Beta1*X1 + Beta2*X2. But we assume that x2 exists, i.e. that it is TRUE (equals 1)
## then by default X2 is FALSE (it is zero) and we cannot state its influence on the average
## working hours.
