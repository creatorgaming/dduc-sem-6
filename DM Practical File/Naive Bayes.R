library(e1071)
library(caret)
data(iris)

size=nrow(iris)*(0.75)  #size of the traininging data is 75% 
training=iris[1:size,]
testing=iris[-(1:size),]   # 25% is the testinging data

#Holdout method

modelel=naiveBayes(Species~.,data=training)  # creates a naive bayes modele
pre=predict(modelel,testing[,-5]) # predict the value to the testing data  
count <- 0
for( i in 1:nrow(testing)) {
  if(pre[i] == testing[i,5])   
    count= count + 1}
prob <- (count/nrow(testing))* 100
print('Accuracy using holdout method in naive bayes : ')
print(prob)
View(confusionMatrix(pre,testing[,5])$table,'Naive Bayes Holdout')


#Sampling

t=sample(1:nrow(iris),size)
training=iris[t,]
testing=iris[-(t),]


model=naiveBayes(Species~.,data=training)

pre=predict(model,testing[,-5])
count <- 0
for( i in 1:nrow(testing)) {
  if(pre[i] == testing[i,5])
    count= count + 1} 
prob <- (count/nrow(testing))* 100

print('Accuracy using random subsampling in NB : ')
print(prob)

View(confusionMatrix(pre,testing[,5])$table,'Naive Bayes Sampling')


#K Fold method
controller= trainControl(method='cv',number=10)
p= train(Species~.,data= training, trControl=controller,method='nb')
pre=predict(p,testing[,-5])
print(p$result)
View(confusionMatrix(pre,testing[,5])$table,'Naive Bayes Kfold')

