data=read.csv(file.choose(),sep=',',header=TRUE)

data
data_norm=function(x){(x-min(x))/(max(x)-min(x))}
data_n <- as.data.frame(lapply(data[1:4],data_norm))
data_n$ship.mode=factor(data$Ship.Mode)
View(data_n)
library(caTools)
split=sample.split(data_n,SplitRatio = 0.70)
train_split=subset(data_n,split==TRUE)
test_split=subset(data_n,split==FALSE)
train_n=train_split[,1:4]
test_n=test_split[,1:4]
train_v=train_split[,5]
test_v=test_split[,5]


library(class)
y_pred=knn(train_n,test_n,train_v,k=3)
y_pred
cm=table(test_v,y_pred)
sum1=sum(cm[1],cm[4])
accuracy=sum1/sum(cm)
print(accuracy)
