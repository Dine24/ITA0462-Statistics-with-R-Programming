data(iris)

dim(iris)  
str(iris)  
summary(iris)  
sapply(iris[, 1:4], sd)  

aggregate(. ~ Species, data = iris, FUN = function(x) c(mean = mean(x), sd = sd(x)))

quantile(iris$Sepal.Width, probs = seq(0, 1, by = 0.25))
quantile(iris$Sepal.Length, probs = seq(0, 1, by = 0.25))

iris1 <- iris
iris1$Sepal.Length.Cate <- cut(iris1$Sepal.Length, breaks = quantile(iris1$Sepal.Length, probs = seq(0, 1, by = 0.25)))

aggregate(. ~ Species + Sepal.Length.Cate, data = iris1, FUN = mean)

aggregate(. ~ Species + Sepal.Length.Cate, data = iris1, FUN = function(x) mean(x, na.rm = TRUE))

pivot_table <- aggregate(. ~ Species + Sepal.Length.Cate, data = iris1, FUN = function(x) mean(x, na.rm = TRUE))