library(ggplot2)
library(dplyr)
data("ChickWeight")
boxplot_plot <- ggplot(ChickWeight, aes(x = factor(Diet), y = weight)) +
  geom_boxplot() +
  labs(x = "Diet", y = "Weight", title = "Box Plot of Weight by Diet")
histogram_plot <- ChickWeight %>%
  filter(Diet == 1) %>%
  ggplot(aes(x = weight)) +
  geom_histogram(binwidth = 10, fill = "skyblue", color = "black") +
  labs(x = "Weight", y = "Frequency", title = "Histogram of Weight for Diet-1")
scatter_plot <- ggplot(ChickWeight, aes(x = Time, y = weight, color = factor(Diet))) +
  geom_point() +
  labs(x = "Time", y = "Weight", title = "Scatter Plot of Weight vs Time by Diet") +
  scale_color_discrete(name = "Diet")

# Display the plots
print(boxplot_plot)
print(histogram_plot)
print(scatter_plot)