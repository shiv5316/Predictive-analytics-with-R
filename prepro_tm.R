#read file
a=read.csv(file.choose(),header=TRUE)
str(a)

#build corpus:collection of doc
#each tweet will be consider as documents
library(tm)
corpus<-iconv(a$text)
corpus<-corpus(VectorSource(corpus))
inspect(corpus[1:2])
corpus

#Data cleaning
corpus<-tm_map(corpus,tolower)
inspect(corpus[1:5])
corpus<-tm_map(corpus,removePunctuation)#remove punctuation
inspect(corpus[1:5])
corpus<-tm_map(corpus,removeNumbers)
inspect(corpus[1:5])
corpus<-tm_map(corpus,removeWords,stopwords('english'))
inspect(cleanset[1:5])


removeURL<-function(x)gsub('http.*','',x)
cleanset<-tm_map(cleanset,content_transformer(removeURL))
inspect(cleanset[1:5])
cleanset<-tm_map(cleanset,removeWords,c('anyone','walker16'))
cleanset<-tm_map(cleanset,removeWords,gsub,pattern='stocks',replacement='stock')
cleanset<-tm_map(cleanset,stripWhitespace)
inspect(cleanset[1:5])


