dataset=read.csv(file.choose())
str(dataset)
dataset=dataset[3:5]
View(dataset)
dataset$Purchased=factor(dataset$Purchased,levels = c(0,1))
library(caTools)
set.seed(123)
split=sample.split(dataset$Purchased,SplitRatio = 0.75)
View(split)
training_set=subset(dataset,split==TRUE)
test_set=subset(dataset,split==FALSE)
#feature scaling
training_set[-3]=scale(training_set[-3])
View(training_set)
test_set[-3]=scale(test_set[-3])
View(test_set)
#scale is generic function whose default method centers and/or scales the column of numeric matrix
#fitting svm to the training set
library(e1071)
classifier=svm(formula= Purchased ~.,data=training_set,type='C-classification',kernel='linear')
#predicting the test set results
y_pred=predict(classifier,newdata=test_set[-3])
#making the confusion matrix
cm=table(test_set[, 3],y_pred)
cm

tab1=cm
error=1-(sum(diag(tab1))/sum(tab1))
accuracy=sum(diag(tab1))/sum(tab1)

precision=tab1[1]/(tab1[1]+tab1[2])
recall=tab1[1]/(tab1[1]+tab1[3])
f1=(2*precision*recall)/(precision+recall)
f1

#plotting the training data set results
set=training_set
x1=seq(min(set[, 1])-1,max(set[, 1])+1,by=0.01)
x2=seq(min(set[, 2])-1,max(set[, 2])+1,by=0.01)
x1
grid_set=expand.grid(x1,x2)
#expand.grid will create dataframe
grid_set
colnames(grid_set)=c('Age','EstimatedSalary')
y_grid=predict(classifier,newdata=grid_set)
plot(set[, -3],main='SVM (Training set)',xlab='Age',ylab='EstimatedSalary',xlim=range(x1),ylim=range(x2))
#xlim and ylim is the limit
contour(x1,x2,matrix(as.numeric(y_grid),length(x1),length(x2)),add = TRUE)
#contour is used to create a line which describe intersection of expected and predicted value
points(grid_set,pch='.',col=ifelse(y_grid==1,'coral1','aquamarine'))
#pch is for ploting characters such as dot,square,plus etc signs
points(set,pch=21,bg=ifelse(set[, 3]==1,'green4','red3'))
#bg is background



#plotting the test data set results
set=test_set
x1=seq(min(set[, 1])-1,max(set[, 1])+1,by=0.01)
x2=seq(min(set[, 2])-1,max(set[, 2])+1,by=0.01)
x1
grid_set=expand.grid(x1,x2)
#expand.grid will create dataframe
grid_set
colnames(grid_set)=c('Age','EstimatedSalary')
y_grid=predict(classifier,newdata=grid_set)
plot(set[, -3],main='SVM (Test set)',xlab='Age',ylab='EstimatedSalary',xlim=range(x1),ylim=range(x2))
#xlim and ylim is the limit
contour(x1,x2,matrix(as.numeric(y_grid),length(x1),length(x2)),add = TRUE)
#contour is used to create a line which describe intersection of expected and predicted value
points(grid_set,pch='.',col=ifelse(y_grid==1,'coral1','aquamarine'))
#pch is for ploting characters such as dot,square,plus etc signs
points(set,pch=21,bg=ifelse(set[, 3]==1,'green4','red3'))
