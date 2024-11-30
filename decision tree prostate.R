library(rpart)
library(rpart.plot)
library(caret)
data=read.csv(file.choose())
data$diagnosis_result <- as.factor(data$diagnosis_result)
testData$diagnosis_result <- as.factor(testData$diagnosis_result)

View(data)
set.seed(123)
trainIndex=createDataPartition(data$diagnosis_result, p = 0.7, list = FALSE)
trainData=data[trainIndex,]
testData=data[-trainIndex,]
#By rpart
decision_tree_model=rpart(diagnosis_result ~ .,data=trainData,method = "class")
rpart.plot(decision_tree_model)
data_predict=predict(decision_tree_model,testData,type="class")

#By ctree
#library(party)
#decision_tree_model=ctree(diagnosis_result ~ .,data=trainData)
#data_predict=predict(decision_tree_model,testData)

#By C5.0
#library(C50)
#decision_tree_model=C5.0(diagnosis_result ~ .,data=trainData,trails=12)
#data_predict=predict(decision_tree_model,testData)


confusionMatrix(data_predict,testData$diagnosis_result)
                