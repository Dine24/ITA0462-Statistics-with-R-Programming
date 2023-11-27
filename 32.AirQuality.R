
mean_temp <- sum(airquality$Temp) / length(airquality$Temp)
print(paste("Mean Temperature:", mean_temp))

first_five_rows <- head(airquality, 5)
print("First five rows:")
print(first_five_rows)

selected_columns <- airquality[, !(names(airquality) %in% c("Temp", "Wind"))]
print("Selected columns:")
print(selected_columns)

coldest_day <- airquality[which.min(airquality$Temp), ]
print("Coldest day:")
print(coldest_day)

wind_gt_17_count <- sum(airquality$Wind > 17)
print(paste("Number of days with wind speed > 17 mph:", wind_gt_17_count))
