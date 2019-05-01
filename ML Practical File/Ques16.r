library(neuralnet)

data(iris)
iris[,5] = as.integer(iris[,5])
#View(iris)
column = names(iris)
formula = paste("Species ~ ",paste(column[!column %in% 'Species'],collapse = '+'))
print(formula)

model = neuralnet(formula, data = iris,algorithm = 'backprop',learningrate = 0.01)
plot(model)

par(mfrow = c(2,2))
gwplot(model,selected.covariate = 'Sepal.Length')
gwplot(model,selected.covariate = 'Sepal.Width')
gwplot(model,selected.covariate = 'Petal.Length')
gwplot(model,selected.covariate = 'Petal.Width')
