#classification  neural network
library(neuralnet)

data=read.csv("binary.csv")

normalize<-function(a){
  a=(a-min(a))/(max(a)-min(a))
}

ndata=as.data.frame(lapply(data,normalize))

#dataf=cbind(dataf,wine_data$Wine)
hist(ndata$gre)

set.seed(222)
ind<-sample(2,nrow(ndata),replace=TRUE,prob=c(0.7,0.3))
train<-ndata[ind==1,]
test<-ndata[ind==2,]

set.seed(333)
#hidden=5 shows number of hidden layer is 1 and nodes exlcusing bias node is 5, for more hidden layers u can write hidden=c(4,2)
#where the 4 and 2 or any number in the vector will be considered as the number of nodes in the hidden layer,
nn=neuralnet(`admit`~.,data=train,hidden=5,linear.output =FALSE)
plot(nn)
pred<-neuralnet::compute(nn,test[,-1])
pred$net.result
#-----------------
#here compute function predicts using the nueral network mode and the test data
output <- compute(n, testing[,-1])
p2 <- pred$net.result
pred2 <- ifelse(p2>0.5, 1, 0)

tab2 <- table(pred2, test$admit)




