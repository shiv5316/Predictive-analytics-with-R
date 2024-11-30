#1)
set.seed(123)
data=data.frame(Age=rnorm(5,50,8),weight=rnorm(5,80,10))
data=as.data.frame(scale(data))
View(data)

a=mean(data$Age)
b=sd(data$Age)
c=data$Age[1]-a
d=c/d
d=c/b
d



#2)
#manual method
#standardization method
set.seed(123)
data=data.frame(Age=rnorm(5,50,8),weight=rnorm(5,80,10))
data=as.data.frame(scale(data))
View(data)

#3)
#standardization
library(caret)
set.seed(123)
data <- data.frame(Age=rnorm(500,50,8),weight=rnorm(500,80,10))
data.pre <- preProcess(data,method=c("center","scale"))
data.pre
#normalization
data <- data.frame(Age=rnorm(500,50,8),weight=rnorm(500,80,10))
data.pre <- preProcess(data,method="range")
data <- predict(data.pre,data)
data
