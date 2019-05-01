library(e1071)
library(class)

data(iris)
size=nrow(iris)*(0.75)
train=iris[1:size,]
test=iris[-(1:size),]

#HoldOut Method
mod=knn(train[,-5], test[,-5], train$Species, k=3, prob= TRUE)

count <- 0
for( i in 1:nrow(test)) {
  if(mod[i] == test[i,5])
    count= count + 1}
prob <- (count/nrow(test))* 100

print('Accuracy using holdout method in knn: ')
print(prob)
View(confusionMatrix(mod,test[,5])$table,'KNN Holdout')

#Sampling
t=sample(1:nrow(iris),size)
train=iris[t,]
test=iris[-(t),]

mod=knn(train[,-5], test[,-5], train$Species, k=3, prob= TRUE)
count <- 0
for( i in 1:nrow(test)) {
  if(mod[i] == test[i,5])
    count= count + 1} 
prob <- (count/nrow(test))* 100

print('Accuracy using random subsampling in knn : ')
print(prob)
View(confusionMatrix(mod,test[,5])$table,'KNN Sampling')


#K Fold method
controller= trainControl(method='cv',number=10)
print('Accuracy of K fold method using KNN')
p= train(Species~.,data= iris, trControl=controller,method='knn')
print(p$results)