library(plot3D)
attenu_data <- datasets::attenu
attach(attenu_data)
plot(x=attenu_data$accel,y=attenu_data$mag,xlab="Acce",ylab="mag",main="Accelaration vs Magnitude")
lin_mod <- lm(mag~accel,data = attenu_data)
abline(lin_mod,col='red')

predictMag <- function(accel,t1,t2){
  return (t1*accel + t2)
}

#variable declarations
t1_array <- c(0.01)
t2_array <- c(2.03)
cost_array <- c()

gradD <- function(t1,t2,alpha){
  sums = se(t1,t2)
  i <- 10
  while(i <-  i -1){
    t1 = t1 - alpha*(sums[1]/nrow(attenu_data))
    t2 = t2 - alpha*(sums[2]/nrow(attenu_data))
    
    t1_array <<- c(t1_array, t1)
    t2_array <<- c(t2_array, t2)
    
    sums = se(t1,t2)
    print(paste("sums[1]:",sums[1]))
    print(paste("sums[2]:",sums[2]))
    print(paste("t1:",t1))
    print(paste("t2:",t2))
  }
}

se <- function(t1,t2){
  attenuRow <- attenu_data[,c(2,5)]
  sum = 0
  sum2 = 0
  cost <- 0
  for(i in c(1:nrow(attenuRow))){
    y = attenuRow[i,1]
    yp = predictMag(attenuRow[i,2],t1,t2)
    sum = sum + (y-yp)
    sum2 = sum2 + (y-yp)*attenuRow[i,2]
    cost <- cost +  (y-yp)*(y-yp)
  }
  cost <- cost*(0.5/nrow(attenu_data))
  print(paste("Cost : ", cost))
  cost_array <<- c(cost_array,cost)
  return(c(sum,sum2))
}

gradD(0.01,2.03,0.000001)
t1_array
t2_array
cost_array
scatter3D(t1_array,t2_array,cost_array,xlab="T1",ylab="T2",zlab="Cost_array")