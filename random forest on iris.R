library(randomForest)
data("iris")
str(data)
indexes=sample(150,110)
indexes
iris_train=iris[indexes,]
iris_train
iris_test=iris[-indexes,]
iris_test
rf_model <- randomForest(Species~.,data=iris_train,ntree=100)
#print model summary
print(rf_model)
#make predictions on the test set
prediction <- predict(rf_model,iris_test)
#evaluate the model
output<- table(prediction,iris_test$Species)
print(output)
#display model accuracy
accuracy <- sum(diag(output))/sum(output)
cat("Accuracy of the random forest model:",accuracy)


cm=table(iris_test[, 5],prediction)
cm
1-sum(diag(cm))/sum(cm)
tab1=cm
error=1-(sum(diag(tab1))/sum(tab1))
accuracy=sum(diag(tab1))/sum(tab1)
accuracy
precision=tab1[1]/(tab1[1]+tab1[2])
recall=tab1[1]/(tab1[1]+tab1[3])
f1=(2*precision*recall)/(precision+recall)
f1
