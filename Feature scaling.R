#K-Nearest Neighbors(K-NN)
#import dataset
dataset=read.csv(file.choose())
View(dataset)
dataset=dataset[3:5]
#Encoding the target feature as factor
dataset$Purchased=factor(dataset$Purchased,levels = c(0,1))
#splitting the dataset into the training set and test set
#install.packages('caTools')
library(caTools)
set.seed(123)
split=sample.split(dataset$Purchased,SplitRatio = 0.75)
training_set=subset(dataset,split==TRUE)
test_set=subset(dataset,split==FALSE)


#Feature scaling
training_set[-3]=scale(training_set[-3])
test_set[-3]=scale(test_set[-3])
