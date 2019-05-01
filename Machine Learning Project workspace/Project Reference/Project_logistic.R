data = read.csv("Sakshi Project/fertility_Diagnosis.csv")
size=nrow(data)*(0.75)
t=sample(1:nrow(data),size)
train = data[t,]

test = data[-(t),]

print(contrasts(data$output))
#The contrast specifies how  the levels of the factors 
#will be coded into a family of numeric dummy variables for fitting the model

Log_model = glm(output~.,data = train,family = binomial)

print(summary(Log_model))

pred = predict(Log_model,test,type="response")

guess = rep('N',nrow(test))

guess[pred>0.5]= 'O'

total_correct = sum(guess == test[,10])

accuracy = total_correct/nrow(test)*100

cat('Accuracy : ',accuracy)

guess =factor(guess,levels = c("N","O"))
View(confusionMatrix(guess,test[,10])$table,"Predictions")