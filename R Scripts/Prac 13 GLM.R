rw<- read.csv("C:/Users/ashra/Desktop/SDBI Stuff/R/winequality-red.csv")
View(rw)

str(rw)
summary(rw)
table(rw$quality)
colSums(is.na(rw))

cor(rw)

glm1=glm(rw$quality~rw$alcohol)
print(glm1)
summary(glm1)


glm2=glm(rw$quality~rw$alcohol+rw$sulphates,family = gaussian)
print(glm2)
summary(glm2)

rw$poor <- rw$quality <=4
rw$okay <- rw$quality == 5 | rw$quality == 6
rw$good <- rw$quality >=7
tail(rw)
summary(rw)

library(class)
library(caret)
set.seed(123)
class_knn10 = knn(train=rw[,1:11],test = rw[,1:11], cl=rw$good,k=10)
class_knn20 = knn(train=rw[,1:11],test = rw[,1:11], cl=rw$good,k=20)

plot(class_knn10)

conf_matrix_knn10 <- table(rw$good,class_knn10)
print(conf_matrix_knn10)
accuracy_knn10 <- sum(diag(conf_matrix_knn10))/sum(conf_matrix_knn10)
paste("The accuracy is",accuracy_knn10)

conf_matrix_knn20 <- table(rw$good,class_knn20)

print(conf_matrix_knn20)
accuracy_knn20 <- sum(diag(conf_matrix_knn20))/sum(conf_matrix_knn20)
paste("The accuracy is",accuracy_knn20)


dpd<- read.csv("C:/Users/ashra/Desktop/SDBI Stuff/R/diabetes_prediction_dataset.csv")

View(dpd)
str(dpd)
summary(dpd)

colSums(is.na(dpd))

dpd$gender<- as.factor(dpd$gender)
dpd$smoking_history<- as.factor(dpd$smoking_history)
str(dpd)

x <- dpd[,c("age","hypertension","heart_disease","bmi","HbA1c_level","blood_glucose_level")]
y <- dpd$diabetes

set.seed(123)
train_index <- createDataPartition(y,p=0.8,list=FALSE)
train_x <- x[train_index,]
train_y <- y[train_index]

test_x <- x[-train_index,]
test_y <- y[-train_index]

k<-3
knn_model <- knn(train=train_x,test = test_x,cl=train_y,k=k)
print(knn_model)

table(Predicted = knn_model, Actual = test_y)
print(table)

conf_matrix_dpd <- confusionMatrix(knn_model,as.factor((test_y)))
print(conf_matrix_dpd)

accuracy<- conf_matrix_dpd$overall['Accuracy']
precision1 <- conf_matrix_dpd$byClass['Pos Pred Value']
recall1 <- conf_matrix_dpd$byClass['Sensitivity']

cat(accuracy)
cat(precision1)
cat(recall1)
