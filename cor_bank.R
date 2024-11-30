#Correlation values ranges between - 1 to + 1.
#With +1 shows highest positive correlation,
#while -1 represents highest negative correlation.
#-1 indicates a perfectly negative linear correlation between two variables
#0 indicates no linear correlation between two variables
#1 indicates a perfectly positive linear correlation between two variables


bank=read.csv(file.choose(),header=TRUE,sep=",",stringsAsFactors = FALSE)
my_data=bank[,c(1,3,4,5,6,7,8)]
head(my_data)
cor_mat=cor(my_data)
print("Correlation Matrix:")
print(cor_mat)
library(corrplot)
corrplot(cor_mat,method="circle")
corrplot(cor_mat,method="number")
corrplot(cor_mat,method="pie")













