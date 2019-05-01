range = seq(-2*pi,2*pi,by = 0.0005)

par(mfrow=c(1,2))
plot(range,sin(range),type = 'l',xlab = "X Values",ylab = "Sin Values")
plot(range,cos(range),type = 'l',xlab = "X Values",ylab = "Cos Values")