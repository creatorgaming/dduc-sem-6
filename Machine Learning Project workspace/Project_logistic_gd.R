library(caret)

data = read.table("datasets/ionosphere.data",sep = ",")
data = data[,c(25,35)]

new_output = rep(0,nrow(data))
new_output[data$V35=='g']=1

data = cbind(data,new_output)

training = data[1:floor(0.50*nrow(data)),]
test = data[-(1:floor(0.50*nrow(data))),]

sigmoid<- function(z)
{
  return (1/(1+exp(-z)))
}

cost <- function(theta0,theta1,X)
{
  g <- sigmoid(theta0 + X*theta1)
  J <- sum((-(training$new_output)*log(g)) - ((1-(training$new_output))*log(1-g))) 
  return(J)
}

#equation for caluculating the value C + Mx

M= 0
C= 0
costVal= cost(C,M,training[,-c(35,36)])

cat("M = ",M," C = ",C," Cost  = ",costVal,"\n")
L= 0.05


for(i in 1:100)
{
  output = C + M*training$V25
  Dm = sum((training$V25* (sigmoid(output) - training$new_output)))/nrow(data)
  Dc = sum((sigmoid(output) - training$new_output))/nrow(data)
  
  M = M - L*Dm
  C = C - L*Dc
  
  costVal= cost(C,M,training$V25)
  
  cat("M = ",M," C = ",C,"Cost = ",costVal,"\n")  
}

plot(training$new_output~training$V25,data = data)
output = C + M*test$V25
hypothesis= sigmoid(output)
hypothesis[hypothesis > 0.5] = 1
hypothesis[hypothesis < 0.5] = 0
plot(hypothesis~test$V25)

hypothesis
test$new_output
confusionMatrix(factor(hypothesis),factor(test$new_output))