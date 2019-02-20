library(ISLR)
data("Carseats")
summary(Carseats)
train_data <- Carseats[c(1:300),]
test_data <- Carseats[c(301:400),]
model_carseats <- lm(Sales~Income,data=train_data)
myPrediction <- predict(model_carseats,test_data[,-11])
summary(model_carseats)
print(myPrediction)
plot(Sales~Income, data=Carseats, col=3)
abline(model_carseats,col=2)

Carseats[c(301:400),1]
resd <- Carseats[c(301:400),1] - myPrediction
R_Sqaure <- resd * resd
resd
R_Sqaure
