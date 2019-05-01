#data<-read.csv('forestfires.csv')
data(topo)
normalize <- function(a) {
  a=(a-min(a))/(max(a)-min(a))
}
data <- as.data.frame(lapply(topo,normalize))

m=0
c=0
L=0.05   #learning rate 

cat("M",1," : ",0)

cat("\tC",1," : ",0)



#We find TSS 
y_mean= mean(data$z)
tss=sum((data$z-y_mean)^2)
nrows=nrow(data)

for (j in 1:100) {
  predicted= c+m*data$z
  error= data$z - predicted 
  
  Dm=((-2*sum(error*data$x))/nrows) -((20*m)/nrows) #partial derivative with respect to M
  Dc= (-2)*sum(error)/nrows  #partial derivative with respect to C
  
  mse=sum(error^2)/nrows  #mean squared error
  rss=sum(error^2)
  
  r_square=1-(rss/tss)
  final_error=1-r_square
  m<-m-L*Dm
  c<-c-L*Dc
  cat("\trss:",j," : ",rss)
  cat("\tr^2:",j," : ",r_square)
  cat("\tError:",j," : ",final_error)
  cat("\nM",j+1," : ",m)
  cat("\tC",j+1," : ",c)
}