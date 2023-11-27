library(dplyr)
library(stats)
data("ChickenWeight")
ChickWeight$Diet<-as.factor(ChickWeight$Diet)
multi_reg_model<-lm(weight~Time+Diet,data=ChickWeight)
new_data<-data.frame(Time=10,Diet=factor(1))
predicted_weight<-predict(multi_reg_model,newdata=new_data)
cat("Predicted weight:",predicted_weight,"\n")
actual_weight<-ChickWeight%>%
  filter(Time==10,Diet==1)%>%
  select(weight)%>%
  unlist()
prediction_error<-actual_weight-predicted_weight
cat("Prediction Error:",prediction_error,"\n")
summary(multi_reg_model)