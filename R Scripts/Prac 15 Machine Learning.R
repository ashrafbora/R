sma<-read.csv("C:/Users/ashra/Desktop/SDBI Stuff/R/Social_Network_Ads.csv")
library(class)
library(caret)
View(sma)
str(sma)
colSums(is.na(sma))
sma$Gender<- ifelse(sma$Gender=='Male',1,0)
str(sma)
sma$Gender<-as.factor(sma$Gender)
sma$Purchased<-as.factor(sma$Purchased)

str(sma)
cor(sma$EstimatedSalary,sma$Age)
mod1<-lm(sma$Age~sma$EstimatedSalary)
mod1
table(sma$Gender)

glm1<-glm(sma$Purchased~sma$Gender+sma$Age+sma$EstimatedSalary,family = binomial)
glm1
 
library(caTools)
split<- sample.split(sma$Purchased,SplitRatio = 0.8)
train_set <- subset(sma,split== TRUE)
test_set <- subset(sma,split == FALSE)

k=10
set.seed(123)
sma_knn = knn(train=train_set[,2:4],test = test_set[,2:4], cl=train_set$Purchased,k=k)
print(sma_knn)

conf_matrix_sma_knn <- table(test_set$Purchased,sma_knn)
print(conf_matrix_sma_knn)
accuracy_sma_knn <- sum(diag(conf_matrix_sma_knn))/sum(conf_matrix_sma_knn)
accuracy<- conf_matrix_sma_knn$overall
paste("The accuracy is",accuracy_sma_knn)
cat(accuracy1)
