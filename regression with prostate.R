prostate=read.csv(file.choose(),stringsAsFactors = TRUE)
summary(prostate$symmetry)
hist(prostate$symmetry)
table(prostate$fractal_dimension)
a=cor(prostate[c("")])
library(corrplot)
corrplot(a,method="circle")
x=insurance$age
y=insurance$charges
b=lm(y~x)
print(b)
data=data.frame(x=60)
c=predict(b,data)
c