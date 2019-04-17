adData<-read.csv('Advertising.csv')
y_actual=adData$sales
x_vector=adData$radio
n=length(x_vector)
y_predict=rep(0,200)
#first case m=0,c=0,  Learning rate L= 0.2
L=0.0002
difference_y=y_actual-y_predict
#print(difference_y)
mean(x_vector)
sum(difference_y)
error=c(0)
m=0
c=0
mv=c(0)
cv=c(0)
for(i in 1:50){
  difference_y=y_actual-y_predict
  difference_yx=difference_y*x_vector
  sum_d=sum(difference_y)
  sum_dx=sum(difference_yx)
  
  Dm=(-2/n)*sum_dx
  Dc=(-2/n)*sum_d
  m=m-(L*Dm)
  c=c-(L*Dc)
  mv=append(mv,m)
  cv=append(cv,c)
  y_predict=(m*x_vector)+c
  
  e=sum(difference_y**2)/n
  error=append(error,e)
}
df=data.frame(mv,cv,error)
names(df)<-c("slope","intercept","error")
print(df)