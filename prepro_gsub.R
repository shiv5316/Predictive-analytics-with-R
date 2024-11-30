a=read.csv(file.choose(),header=TRUE)
str(a)
#google_tweets<-twListToDF(a)
View(google_tweets)
google_text<-a$text
#convert all text to lowercase
google_text<-tolower(google_text)
google_text[1:5]
#Replace blank space("rt")
google_text<-gsub("rt", "",google_text)
#Replace @username
google_text<-gsub("@\\w+","",google_text)
#Remove punctuation
google_text<-gsub("[[:punct:]]","",google_text)
#Remove links
google_text<-gsub("http\\w+","",google_text)
#Remove text
google_text<-gsub("[ |\t]{2,}","",google_text)
#Remove blank spaces at the beginning
google_text<-gsub("^ ","",google_text)
#Remove blank spaces at the end
google_text<-gsub(" $","",google_text)
google_text

google_text<-gsub("😂😂😂","",google_text)
