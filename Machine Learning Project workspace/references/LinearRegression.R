library(MASS)
data("Boston")
df <- as.data.frame(Boston)

train <- Boston[c(1:20,31:50,61:71),]

test <- Boston[c(21:30,51:60),]

model <- lm(medv~lstat+black,data=train)
pred <- predict(model,test[,-14])
print(summary(model))

print(pred)

plot(medv~(lstat+black), data=Boston, main="Relation between lstat and predictor", xlab="median value", ylab="lstat")
abline(model,col="blue")



