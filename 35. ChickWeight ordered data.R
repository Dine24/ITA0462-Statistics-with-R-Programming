library(dplyr)
library(reshape2)
data("ChickWeight")
ordered_data <- ChickWeight %>%
  arrange(Diet, weight) %>%
  group_by(Diet) %>%
  slice_tail(n = 6)
melted_data <- melt(ordered_data, id.vars = c("Chick", "Time", "Diet"), measure.vars = "weight")
cast_mean <- melted_data %>%
  group_by(Diet, variable) %>%
  summarise(mean_value = mean(value, na.rm = TRUE)) %>%
  dcast(Diet ~ variable, value.var = "mean_value")
cast_mode <- melted_data %>%
  group_by(Diet, variable) %>%
  summarise(mode_value = as.numeric(names(table(value))[table(value) == max(table(value))])) %>%
  dcast(Diet ~ variable, value.var = "mode_value")
print("Ordered Data:")
print(ordered_data)

print("Melted Data:")
print(melted_data)

print("Mean Weight by Diet:")
print(cast_mean)

print("Mode Weight by Diet:")
print(cast_mode)