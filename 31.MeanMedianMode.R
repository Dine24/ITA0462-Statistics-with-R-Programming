
data_values <- c(90, 50, 70, 80, 70, 60, 20, 30, 80, 90, 20)


mean_value <- mean(data_values)
median_value <- median(data_values)


get_mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

mode_value <- get_mode(data_values)


print(paste("Mean:", mean_value))
print(paste("Median:", median_value))
print(paste("Mode:", mode_value))


sorted_values <- sort(unique(data_values), decreasing = TRUE)

second_highest <- sorted_values[2]
third_lowest <- sorted_values[3]


print(paste("2nd Highest:", second_highest))
print(paste("3rd Lowest:", third_lowest))
