data=read.csv(file.choose(),stringsAsFactors = TRUE)
str(data)
summary(data$fractal_dimension)
hist(data$fractal_dimension)
table(data$fractal_dimension)
a=cor(data[c("smoothness","compactness","symmetry","fractal_dimension")])
library(corrplot)
corrplot(a,method="circle")
x=data$symmetry
y=data$fractal_dimension
b=lm(y~x)
print(b)
data=data.frame(x=0.250)
c=predict(b,data)
c


pairs(data[c("smoothness","compactness","symmetry","fractal_dimension")])
library(psych)
pairs.panels(data[c("smoothness","compactness","symmetry","fractal_dimension")])








str(data)
View(data)
#checking for null values
sum(is.na(data))
data1=data[c(-1,-2,-11)]
a=cor(data1)
str(data1)
library(corrplot)

corrplot(a,method = "number")
pairs(data1)
pairs.panels(data1)

reg=lm(formula=area~radius,data=data1)
pred=predict(reg,data1)
pred
summary(reg)

# multiple linear regression
reg2=lm(formula=area~perimeter+texture+compactness+smoothness+radius,data=data1)
summary(reg2)






