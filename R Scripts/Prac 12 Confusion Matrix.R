Accuracy = (30+950)/(30+15+5+950)
Precision = 30/(30+15)
Recall = 30/(30+5)

Accuracy
Precision
Recall

install.packages(caret)
library(caret)

y_true<- factor(c(1,0,1,1,0,1,0,0,1,0)) #groud trusth lables 
y_pred<- factor(c(1,1,1,1,0,1,1,0,1,0)) # predicted lables

cm<-confusionMatrix(y_pred,y_true)
cm

conf_matrix_table <- cm$table
conf_matrix_table

accuracy <- cm$overall['Accuracy']
precision <- cm$byClass['Pos Pred Value'] #This is precision
recall <-cm$byClass['Sensitivity'] # This is recall

accuracy
precision
recall