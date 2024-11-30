library(arules)
data("Adult")
rules <- apriori(Adult,parameter=list(supp=0.5,conf=0.9,target="rules"))
summary(rules)
inspect(rules)#it gives the list of all significant association rules
