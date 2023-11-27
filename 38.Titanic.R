library(ggplot2)
library(dplyr)
library(tidyr)
data("Titanic")

titanic_data <- as.data.frame(Titanic) %>%
  gather(key = "Survived", value = "Count", -Class, -Sex) %>%
  mutate(Survived = factor(Survived, levels = c("No", "Yes")))

barplot_class_survived <- ggplot(titanic_data, aes(x = Class, y = Count, fill = Survived)) +
  geom_bar(stat = "identity", position = "stack") +
  labs(x = "Class", y = "Count", title = "Survival by Passenger Class") +
  scale_fill_manual(values = c("No" = "red", "Yes" = "green"))

barplot_class_gender_survived <- ggplot(titanic_data, aes(x = Class, y = Count, fill = Survived)) +
  geom_bar(stat = "identity", position = "stack") +
  facet_grid(. ~ Sex) +  # Fix: Use Sex instead of sex
  labs(x = "Class", y = "Count", title = "Survival by Passenger Class and Gender") +
  scale_fill_manual(values = c("No" = "red", "Yes" = "green"))

print(barplot_class_survived)
print(barplot_class_gender_survived)
