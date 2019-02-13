library(e1071)
ins_train <- iris[c(1:40, 51:90, 101:140),]
ins_test <- iris[c(41:50,91:100,141:150),c(1:3)]
model <- naiveBayes(ins_train[,-5],ins_train[,5])
my_prediction <- predict(model, ins_test)
model
table(my_prediction)
