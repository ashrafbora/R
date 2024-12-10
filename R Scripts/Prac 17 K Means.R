install.packages("cluster")
head(iris,5)
table(iris$Species)
colSums(is.na(iris))
summary(iris)
str(iris)
iris_1<-iris[ ,-5]
summary(iris_1)
set.seed(123)
kmeans_re <- kmeans(iris_1,centers = 3 , nstart = 20)
kmeans_re

kmeans_re$size
kmeans_re$cluster
kmeans_re$centers

cm_1<- confusionMatrix((as.factor(kmeans_re$cluster)),as.factor(iris$Species),postive = "TRUE")
cm<-table(iris$Species,kmeans_re$cluster)
cm
a<- sum(diag(cm))/sum(cm)
a
str(kmeans_re)
kmeans_re$cluster<- as.factor(kmeans_re$cluster)
