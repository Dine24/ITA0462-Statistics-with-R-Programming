data(airquality)
missing_percentage <- colMeans(is.na(airquality)) * 100
print("Missing Percentage:")
print(missing_percentage)

threshold <- 10  
for (col in colnames(airquality)) {
  if (missing_percentage[col] < threshold) {
    mean_value <- mean(airquality[[col]], na.rm = TRUE)
    airquality[[col]][is.na(airquality[[col]])] <- mean_value
  } else {
    airquality <- airquality[complete.cases(airquality), ]
  }
}
lm_model <- lm(Ozone ~ Solar.R, data = airquality)
summary(lm_model)

plot(airquality$Solar.R, airquality$Ozone, xlab = "Solar.R", ylab = "Ozone", main = "Scatter plot of Ozone vs Solar.R")
abline(lm_model, col = "red")