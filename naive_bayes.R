#loading packages
library(e1071)
library(caTools)
library(caret)

#Splitting data into train and test data
split=sample.split(iris,SplitRatio=0.7)
train_cl=subset(iris,split==TRUE)
test_cl=subset(iris,split==FALSE)
#feature scaling
train_scale=scale(train_cl[,1:4])
test_scale=scale(test_cl[,1:4])
#Fitting naive bayes model to training dataset
set.seed(120)  #setting seed
classifier_cl<-naiveBayes(Species ~ .,data=train_cl)
classifier_cl

#predicting on test data
y_pred<-predict(classifier_cl,newdata=test_cl)

#confusion matrix
cm<-table(test_cl$Species,y_pred)
cm
sum1=sum(cm[1],cm[3])
accuracy=sum1/sum(cm)
print(accuracy)

#Model Evaluation
a=confusionMatrix(cm)
a
