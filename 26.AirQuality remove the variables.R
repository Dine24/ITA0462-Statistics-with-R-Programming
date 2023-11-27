data("airquality")
is_data_frame<-is.data.frame(airquality)
print(paste("Is airquality a data frame?",is_data_frame))
ordered_airquality<-airquality[order(airquality$Temp,airquality$Month),]
airquality_subset<-ordered_airquality[,!(names(ordered_airquality)%in%c("Solar.R","Wind"))]
print(airquality_subset)