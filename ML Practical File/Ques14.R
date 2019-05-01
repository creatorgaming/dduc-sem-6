library(rpart)
library(caret)
data = read.csv(file = 'iris.csv',header = TRUE)

sample_size = floor(0.75 * nrow(data))
training = data[1:sample_size,]
test = data[-(1:sample_size),]

model = rpart(Species ~., data = training)
prediction = factor(predict(model,test))
View(confusionMatrix(prediction,test[,5])$table)