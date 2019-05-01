dataf<-read.csv("wine.csv")
attach(dataf)
normalize <- function(a) {
  a=(a-min(a))/(max(a)-min(a))
}
dat <- as.data.frame(lapply(dataf[,-1],normalize))
library(neuralnet)
train<-c(1:50,60:110,132:160)
test<-c(51:59,111:131,161:178)
nn<-neuralnet(`dataf$result`~.,data=dataf[train,],hidden=2,linear.output=FALSE)
pred<-neuralnet::compute(nn,dataf[-test,])