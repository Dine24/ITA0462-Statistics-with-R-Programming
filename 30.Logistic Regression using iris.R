library(caret)
data("iris")
set.seed(123)
train_index<-createDataPartition(iris$Species,p=0.8,list=FALSE)
train_data<-iris[train_index,]
test_data<-iris[-train_index,]
logit_model<-glm(Species~Petal.Width+Petal.Length,data = train_data,family = "binomial")
predicted_probalities<-predict(logit_model,newdata=test_data,type="response")
predicted_classes<-ifelse(predicted_probalities>0.5,"versicolor","setosa")
confusion<-table(predicted=predicted_classes,actual=test_data$Species)
print("Confusion Matrix")
print(confusion)