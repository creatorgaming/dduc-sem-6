dataset <- datasets::attenu

#attaching dataset
attach(dataset)

#view dataset
dataset

#plot initial graph for dataset
plot(attenu$accel,attenu$mag,xlab="Acceleration",ylab="Magnitude",main="Gradient Decent on Acceleration vs Magnitude on attenu dataset",col=3)

#linear regression for initial value od t0, t1
linear_reg <- lm(mag ~ accel, data = attenu)
linear_reg$coefficients
abline(linear_reg,col="red")

#variable declaration
n <- nrow(dataset)
t0 <- linear_reg$coefficients[2]
t1 <- linear_reg$coefficients[1]

#calcualting hypothisis
hypothisis <- function(t0, t1, x){
  return (t1*x + t0)
}

gradient_decent <- function(t0, t1, alpha, epsilon) {
  cost <- 0
  for (i in 1:n) {
    y <- dataset$accel[i]
    h <- hypothisis(t0,t1,dataset$mag[i])
     
  }
}