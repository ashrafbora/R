rw<-read.csv("C:/Users/ashra/Desktop/SDBI Stuff/R/winequality-red.csv")
View(rw)
head(rw)
colSums(is.na(rw))
library(caret)
rw$quality<-as.factor(rw$quality)

set.seed(123)
library(caTools)
split<- sample.split(rw$quality,SplitRatio = 0.8)
train_set <- subset(rw,split== TRUE)
test_set <- subset(rw,split == FALSE)

library(e1071)
nb_model<-naiveBayes(quality~.,data = train_set)


predictions<-predict(nb_model,newdata = test_set)

confusionMatrix(test_set$quality,predictions)
