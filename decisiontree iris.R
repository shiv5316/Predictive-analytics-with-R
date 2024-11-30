data("iris")
str(iris)
indexes=sample(150,110)
iris_train=iris[indexes,]
iris_test=iris[-indexes,]
iris_train_label=iris[indexes,5]
iris_test_label=iris[-indexes,5]
target=Species ~ Sepal.Length+ Sepal.Width
library(party)
tree=ctree(target,data=iris)
plot(tree,main="Tree for iris")
cm=table(predict(tree),iris$Species)
cm
tab1=cm
error=1-(sum(diag(tab1))/sum(tab1))
accuracy=sum(diag(tab1))/sum(tab1)
accuracy
precision=tab1[1]/(tab1[1]+tab1[2])
recall=tab1[1]/(tab1[1]+tab1[3])
f1=(2*precision*recall)/(precision+recall)
f1
