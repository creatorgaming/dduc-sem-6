library(MASS)
data("Boston")
summary(Boston)
train_data <- Boston[c(1:337),]
test_data <- Boston[c(338:506),]
model_Boston <- lm(medv~lstat,data=train_data)
myPrediction <- predict(model,test_data[,-14])
summary(model_Boston)
print(myPrediction)
plot(medv~lstat, data=Boston, main = "Relation b/w lstat and Predictor", xlab = "Median Value", ylab = "lstat", col=3)
abline(model_Boston,col=2)