library(e1071)
library(rpart)
library(rpart.plot)
library(caret)

data(iris)
size=nrow(iris)*(0.75)
train=iris[1:size,]
test=iris[-(1:size),]

#HoldOut Method
mod=rpart(Species~.,data= train)
rpart.plot(mod)
pre=predict(mod,test[,-5],type='class')
count <- 0
for( i in 1:nrow(test)) {
  if(pre[i] == test[i,5])
    count= count + 1}
prob <- (count/nrow(test))* 100

print('Accuracy using holdout method in Decision Tree: ')
print(prob)
View(confusionMatrix(pre,test[,5])$table,'Decision Tree Holdout')

#Sampling
t=sample(1:nrow(iris),size)
train=iris[t,]
test=iris[-(t),]

mod=rpart(Species~.,data=train)
rpart.plot(mod)
pre=predict(mod,test[,-5],type='class')
count <- 0
for( i in 1:nrow(test)) {
  if(pre[i] == test[i,5])
    count= count + 1} 
prob <- (count/nrow(test))* 100

print('Accuracy using random subsampling in Decision Tree : ')
print(prob)
View(confusionMatrix(pre,test[,5])$table,'Decision Tree Sampling')

#K fold Method
controller= trainControl(method='cv',number=10)
p= train(Species~.,data= iris, trControl=controller,method='rpart')
print(p$results)