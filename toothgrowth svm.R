data=ToothGrowth
str(data)
summary(data)
library(caTools)
set.seed(123)
split=sample.split(data$Species,SplitRatio = 0.75)
training_set=subset(data,split==TRUE)
test_set=subset(data,split==FALSE)