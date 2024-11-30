#read dataset
wdbc=read.table(file.choose(),sep = ",",header = TRUE)
#explore dataset
View(wdbc)

#preprocessing
wdbc=wdbc[,-1] #dropping 1st column as its just unique id of a patient
#now we have the required data as the next column is about cancerous or non cancerous

#lapply used fir fulldataset
data_norm=function(x){((x- min(x))/(max(x)-min(x)))} #normalization where we use min and max fn
#frm-> (x-min)/(max-min)
wbcd_norm<-as.data.frame(lapply(wdbc[2:31],data_norm))
View(wbcd_norm)
summary(wbcd_norm[,1:4])
summary(wbcd_norm[])

#train and test dataset
wdbc_train=wbcd_norm[1:450,]
wdbc_test=wbcd_norm[451:569,]

#datamodel
library(class)
wdbc_pred=knn(wdbc_train,wdbc_test,wdbc[1:450,1],k=21)

#performance measure
cm=table(wdbc_pred,wdbc[451:569,1])
a=sum(cm[1],cm[4])
accuracy=(a/sum(cm))
print(accuracy)
