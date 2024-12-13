# Output and Interpretation
# The output of lm is an object of class "lm"
# This object contains several components, including:
# coefficients: A named vector of coefficients from the model.
# residuals: The residuals of the model, which are the differences
# between observed and fitted values.
# fitted.values: The predicted values based on the model.
# rank: The numeric rank of the fitted linear model.
# df.residual: The residual degrees of freedom.

#height predictor vector
x=c(5.1,5.5,5.8,6.1,6.4,6.7,6.4,6.1,5.10,5.7)
#weight response Vector
y=c(63,66,69,72,75,78,75,72,69,66)
#lm()
relation=lm(y~x)  # (~) means target/formula
summary(relation)
#fine the weight of a person with given height
a<-data.frame(x=6.3)
result<-predict(relation,a)
result
