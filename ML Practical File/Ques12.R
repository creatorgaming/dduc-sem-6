price <- c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131)
area <- c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48)

relation = lm(price~area)
print(summary(relation))

print(predict(relation,data.frame(area = c(10,64))))
plot(price~area)
abline(relation)
points(x=c(64,85),y=predict(relation,data.frame(area = c(64,85))),col=3)