library(ISLR)
data("Cars93")
summary(Cars93)
train_data <- Cars93[c(1:25),]
test_data <- Cars93[c(26:3+7),]
model_cars93 <- lm(Horsepower~Cylinders+Price+RPM,data=train_data)
myPrediction <- predict(model_cars93,test_data[,-13])
summary(model_cars93)
print(myPrediction)
plot(model_cars93, data=Cars93, col=3)
#abline(model_cars93,col=2)