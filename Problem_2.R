## Homework 4, ## Problem 2

crime <- read.delim('https://s3.eu-central-1.amazonaws.com/econometrics2018/data/crime.csv', stringsAsFactors = FALSE)

str(crime)

library(dplyr)

library(ggplot2)

## a)

fit <- lm(C ~ HS, data = crime)

summary(fit)

## The estimates show that crime rates increase
## with an increase in high-school graduates percentage.

## b)

pairs(~ C + U + I + HS, data = crime)

## c)

fit1 <- lm(C ~ HS + U, data = crime)

summary(fit1)

## We can easily see that there s multicolinearity across feature variables
## and this changes the estimates. This means that one feature variable 
## can be explained by another feature variable. Thus, the estimates are not
## wrong, however, my not give valid estimates for the change in the explained variable.

## d)

## Given our data, this would be true, if reducing state spendings on education
## actually results in lower percentage of graduates. But we shall note that the
## multicolinearity may affect the estimated coefficient value. In addition to that,
## there are many other variables that influence the crime rate and are omitted in our data.

## e)

fit2 <- lm(C ~ HS + U + I, data = crime)

summary(fit2)
