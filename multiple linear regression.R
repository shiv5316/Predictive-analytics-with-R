#multiple linear regression
#importing the dataset
dataset=read.csv(file.choose())
str(dataset)
View(dataset)
#checking for null values
sum(is.na(dataset))
#handling categorical data
dataset$State=factor(dataset$State,levels = c('New York','Florida','California'),labels = c(1,2,3))
View(dataset)
cor(dataset[c("R.D.Spend","Administration","Marketing.Spend")])
library(caTools)
#splitting the dataset
split=sample.split(dataset$Profit,SplitRatio = 0.8)
training_set=subset(dataset,split==TRUE)
testing_set=subset(dataset,split==FALSE)
#fitting multiple linear regression model
regressor=lm(formula = Profit~R.D.Spend+Administration+Marketing.Spend,data = training_set)
y_pred=predict(regressor,newdata=testing_set)
y_pred

a=cor(training_set[c("R.D.Spend","Administration","Marketing.Spend")])
library(psych)
pairs(training_set[c("R.D.Spend","Administration","Marketing.Spend")])
pairs.panels(training_set[c("R.D.Spend","Administration","Marketing.Spend")])
library(corrplot)
corrplot(a,method = "number")
corrplot(a,method = "circle")
corrplot(a,type = "upper")
summary(regressor)


a1=cor(testing_set[c("R.D.Spend","Administration","Marketing.Spend")])
library(psych)
pairs(testing_set[c("R.D.Spend","Administration","Marketing.Spend")])
pairs.panels(testing_set[c("R.D.Spend","Administration","Marketing.Spend")])
library(corrplot)
corrplot(a1,method = "number")
corrplot(a1,method = "circle")
corrplot(a1,type = "upper")

a2=cor(dataset[c("R.D.Spend","Administration","Marketing.Spend")])
library(psych)
pairs(dataset[c("R.D.Spend","Administration","Marketing.Spend")])
pairs.panels(dataset[c("R.D.Spend","Administration","Marketing.Spend")])
library(corrplot)
corrplot(a2,method = "number")
corrplot(a2,method = "circle")
corrplot(a2,type = "upper")
