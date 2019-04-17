#Boston data set --regression neural network
library(MASS)
library(neuralnet)

Data<-Boston
normalize<-function(a){
  a=(a-min(a))/(max(a)-min(a))
}

ndata=as.data.frame(lapply(Data,normalize))
#ndata=cbind(ndata,medv=Boston$medv)

#training and test data
set.seed(123)
ind<-sample(1:nrow(ndata),400)
train<-ndata[ind,]
test<-ndata[-ind,]

#neural network: 13:4:2:1
#hidden layer=2
nn=neuralnet(`medv`~.,data=train,hidden=c(4,2),linear.output =FALSE)
plot(nn)
pred<-compute(nn,test[,-14])


rnormalize<-function(a){
  a=a*(max(Data$medv)-min(Data$medv))+min(Data$medv)
}
#--- reverse the normalization of the results
prediction<-rnormalize(pred$net.result)
actual<-rnormalize(test$medv)
#checking accuracy using mse 

MSE=sum((prediction-actual)^2)/nrow(test)
print(MSE)
#showing the actual data and predicted data side by side
cdata=cbind(actual,prediction=prediction)
colnames(cdata)<-c("actual","prediction")

print(cdata)




