#using only one variable as predictor
data = read.csv("fertility_Diagnosis.csv")

contrasts(data$output)


new_output = rep(0,nrow(data))
new_output[data$output=='O']=1

data = cbind(data,new_output)


sigmoid<- function(z)
{
  pre = 1/(1+exp(-z))
  return(pre)
}

cost <- function(theta,X)
{
  
  #m <- nrow(X)
  g <- sigmoid(X*theta)
  J <- sum((-(data$new_output)*log(g)) - ((1-(data$new_output))*log(1-g))) 
  
  return(J)
}

#equation for caluculating the value C + Mx
#using data$age as the predictor
M= 0
C= 0
cost_M= cost(M,data$age)
cost_C= cost(C,rep(1,nrow(data)))
cat("M = ",M," C = ",C," Cost C = ",cost_C,"Cost M = ",cost_M,"\n")
L= 0.05


for(i in 1:100)
{
  output = C + M*data$age
  Dm = sum((data$age* (sigmoid(output) - data$new_output)))/nrow(data)
  Dc = sum((sigmoid(output) - data$new_output))/nrow(data)
  
  M = M - L*Dm
  C = C - L*Dc
  
  cost_M= cost(M,data$age)
  cost_C= cost(C,rep(1,nrow(data)))
  
  cat("M = ",M," C = ",C," Cost C = ",cost_C,"Cost M = ",cost_M,"\n")  
}
