library(e1071)
library(caret)
data <- read.csv(file.choose())
data$diagnosis_result <- as.factor(data$diagnosis_result)
# Split the dataset into training and testing sets (70:30)
set.seed(123)
trainIndex <- createDataPartition(data$diagnosis_result, p = 0.7, list = FALSE, times = 1)
trainData <- data[trainIndex,]
testData <- data[-trainIndex,]
testData$diagnosis_result <- as.factor(testData$diagnosis_result)


# Train the Naive Bayes model
model <- naiveBayes(diagnosis_result ~ ., data= trainData)

# Make predictions on the test set
predictions <- predict(model, testData)

# Evaluate the model
confusionMatrix(predictions, testData$diagnosis_result)




#loading packages
library(e1071)
library(caTools)
library(caret)

data <- read.csv(file.choose())
data_norm=function(x){((x- min(x))/(max(x)-min(x)))}
data_n<-as.data.frame(lapply(data[2:8],data_norm))
data_u=data.frame(data_n,diagnosis_result=data$diagnosis_result)

#Splitting data into train and test data
split=sample.split(data_u$diagnosis_result,SplitRatio=0.7)
train_cl=subset(data_u$diagnosis_result,split==TRUE)
test_cl=subset(data_u$diagnosis_result,split==FALSE)

classifier_cl<-naiveBayes(diagnosis_result ~ .,data=train_cl)
classifier_cl

#predicting on test data
y_pred<-predict(classifier_cl,newdata=test_cl)

#confusion matrix
cm<-table(y_pred,test_cl)
cm
sum1=sum(cm[1],cm[3])
accuracy=sum1/sum(cm)
print(accuracy)