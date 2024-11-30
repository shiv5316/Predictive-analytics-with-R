#data collection
ca1=c(20,15,10,20,10)
ca2=c(25,10,20,15,15)
grades=c("A","B","B","C","B")
d1=data.frame("CA1"=ca1,"CA2"=ca2,"GRADES"=grades)
d1

#data preprossing
str(d1)
summary(d1)
View(d1)

#model training
library(caTools)
set.seed(123)
split=sample.split(d1, SplitRatio = 0.70)
training_set=subset(d1,split==TRUE)
testing_set=subset(d1,split==FALSE)

#input variable
train_set=training_set[,1:2]  #train for knn
test_set=testing_set[,1:2]    #test for knn

#output variable
train_name=training_set[,3]   #class for knn
test_name=testing_set[,3]     #accuracy for knn

#K-NN model
library(class)
y_pred=knn(train_set,test_set,train_name,k=3)
y_pred
cm=table(test_name,y_pred)
sum1=sum(cm[1],cm[4])
accuracy=sum1/sum(cm)
print(accuracy)
