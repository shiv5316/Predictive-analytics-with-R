library(clusterR)
library(cluster)
#removing initial label of species from original dataset
iris_1 <- iris[, -5]

#fitting K-means clustering model to training dataset
set.seed(240)
kmeans.re <- kmeans(iris_1,centers = 3,nstart = 20)

#nstart means initial random number of centroids
#centers menas no of clusters
kmeans.re
kmeans.re$cluster
#confusion matrix
cm <- table(iris$Species,kmeans.re$cluster)
plot(iris_1[,c("Sepal.Length","Sepal.Width")],col=kmeans.re$cluster,main="K-means with 3 clusters")

#plotting cluster centers
kmeans.re$centers
kmeans.re$centers[,c("Sepal.Length","Sepal.Width")]

#cex is font size,pch is symbol
points(kmeans.re$centers[, c("Sepal.Length","Sepal.Width")],col = 1:3,pch=8,cex=3)

#visualizing clusters
y_kmeans <- kmeans.re$cluster
clusplot(iris_1[,c("Sepal.Length","Sepal.Width")],y_kmeans,lines=0,shade=TRUE,color = TRUE,labels = 2,plotchar = FALSE,span = TRUE,main = paste("cluster iris"),xlab = 'Sepal.Length',ylab = 'Sepal.Width')

