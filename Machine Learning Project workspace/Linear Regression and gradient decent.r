# Attribute Information:

# 1. vendor name: 30 
# (adviser, amdahl,apollo, basf, bti, burroughs, c.r.d, cambex, cdc, dec, 
# dg, formation, four-phase, gould, honeywell, hp, ibm, ipl, magnuson, 
# microdata, nas, ncr, nixdorf, perkin-elmer, prime, siemens, sperry, 
# sratus, wang) 
# 2. Model Name: many unique symbols 
# 3. MYCT: machine cycle time in nanoseconds (integer) 
# 4. MMIN: minimum main memory in kilobytes (integer) 
# 5. MMAX: maximum main memory in kilobytes (integer) 
# 6. CACH: cache memory in kilobytes (integer) 
# 7. CHMIN: minimum channels in units (integer) 
# 8. CHMAX: maximum channels in units (integer) 
# 9. PRP: published relative performance (integer) 
# 10. ERP: estimated relative performance from the original article (integer)


dataset <- read.csv('datasets/machine.data')
dataset

y_actual=dataset$X199
x_vector=dataset$X256.1

n=length(x_vector)
y_predict=rep(0,200)

#first case m=0,c=0,  Learning rate L= 0.00002
L=0.00002

difference_y=y_actual-y_predict

#print(difference_y)

y_mean=mean(y_actual)
tss=sum((y_actual-y_mean)^2)

#sum(difference_y)

m=0
c=0
mv=c(0)
cv=c(0)
error=c(0)
r_square=c(0)

for(i in 1:1000){
  
  difference_y=y_actual-y_predict
  difference_yx=difference_y*x_vector
  
  sum_d=sum(difference_y)
  sum_dx=sum(difference_yx)
  
  Dm=(-1/n)*sum_dx
  Dc=(-1/n)*sum_d
  
  m=m-(L*Dm)
  c=c-(L*Dc)
  
  mv=append(mv,m)
  cv=append(cv,c)
  
  y_predict=(m*x_vector)+c
  
  e=sum(difference_y**2)/n
  error=append(error,e)
  
  r_square=append(r_square,1-(e/tss))
}
df=data.frame(mv,cv,error,r_square)
names(df)<-c("slope","intercept","error","r-square")
print(df)
plot(x=dataset$X256.1,y=dataset$X199,xlab='CACH',ylab='ERP')
abline(a=m*x_vector,b=c)