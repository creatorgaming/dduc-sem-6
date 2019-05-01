library(ISLR)
library(caret)
attach(Smarket)
print(Smarket)
train = subset.data.frame(Smarket,Year<2005)
test = subset.data.frame(Smarket,Year>=2005)
print(contrasts(Direction))
#The contrast specifies how  the levels of the factors 
#will be coded into a family of numeric dummy variables for fitting the model

Log_model = glm(Direction~ Lag1+Lag2+Lag3+Lag4+Lag5,data = train,family = binomial)

print(summary(Log_model))

pred = predict(Log_model,test,type="response")

guess = rep('Down',nrow(test))

guess[pred>0.5]= 'Up'

total_correct = sum(guess == test[,9])

accuracy = total_correct/nrow(test)*100

cat('Accuracy : ',accuracy)
guess =factor(guess,levels = c("Down","Up"))
View(confusionMatrix(guess,test[,9])$table,"Predictions")