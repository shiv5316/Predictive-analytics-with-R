# K-Means Clustering
# Importing the dataset
dataset1 = read.csv(file.choose())
dataset = dataset1[2:3]
# Using the elbow method to find the optimal number of clusters
set.seed(6)
wcss = vector() #within cluster the sum of square
for (i in 1:10) wcss[i] = sum(kmeans(dataset, i)$withinss)
plot(1:10,wcss,type = 'b',main = paste('The Elbow Method'),xlab = 'Number of clusters',ylab = 'WCSS')
# Fitting K-Means to the dataset
set.seed(29)
kmeans = kmeans(x = dataset, centers = 2)
y_kmeans = kmeans$cluster
cm <- table(dataset1$Exam.Type, y_kmeans)
cm
accuracy=sum(diag(cm)/sum(cm))
library(cluster)
clusplot(dataset,y_kmeans,lines = 0,shade = TRUE,color = TRUE,labels = 2,plotchar = FALSE,span = TRUE,main = paste('Clusters of customers'), xlab = 'Annual Income',ylab = 'Spending Score')
data=data.frame(dataset,y_kmeans)
View(data)
