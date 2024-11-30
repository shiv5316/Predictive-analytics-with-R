library(randomForest)
library(caTools)
#load the mtcars dataset
data("mtcars")
#preprocess the data
mtcars$High_mileage <- ifelse(mtcars$mpg > 20,"Yes","No")
mtcars$High_mileage <- as.factor(mtcars$High_mileage)
mtcars_data<-mtcars[,c("disp","hp","wt","qsec","High_mileage")]
#split the data
set.seed(123)
split <- sample.split(mtcars_data$High_mileage,SplitRatio = 0.7)
train_data <-subset(mtcars_data,split==TRUE)
test_data <-subset(mtcars_data,split==FALSE)
#train the random forest model
rf_model<-randomForest(High_mileage~disp+hp+wt+qsec,data=train_data,ntree=100)
print(rf_model)
#make prediction
prediction<-predict(rf_model,newdata=test_data)
#evaluate the model
cm<-table(Predicted=prediction,Actual=test_data$High_mileage)
print(cm)
accuracy<-sum(diag(cm))/sum(cm)
cat("Accuracy:"round(accuracy*100,2),"%\n")