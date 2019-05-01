range = seq(-2*pi,2*pi,by = 0.005)

plot(range,sin(range),type = 'l',xlab = "X Values",ylab = "Sin Values")

plot(range,cos(range),type = 'h',xlab = "X Values",ylab = "Cos Values")

hist(sin(range))