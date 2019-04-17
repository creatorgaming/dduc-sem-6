library(e1071)
?naiveBayes
data("iris")
df <- as.data.frame(iris)

train <- iris[c(1:40,51,90,101:140),]


test <- iris[c(41:50,91:100,141:150),]


model <- naiveBayes(Species ~.,data= train)

#print(model)

pred <- predict(model,test[,-5])
t <- table(pred)

count <- 0
for( i in 1:nrow(test)) {
  if(pred[i] == test[i,5])
    count= count + 1}

print(pred)
prob <- (count/30)* 100

print('Accuracy : ')
print(prob)