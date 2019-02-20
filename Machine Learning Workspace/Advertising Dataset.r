advert <- read.csv("datasets/Advertising.csv")
fix(advert)

advert_train <- advert[c(1:150),]
advert_test <- advert[c(151:200),]

advert_model_radio <- lm(advert$sales~advert$radio, dataset=advert_train)
advert_model_newspaper <- lm(advert$sales~advert$newspaper, dataset=advert_train)
advert_model_TV <- lm(advert$sales~advert$TV, dataset=advert_train)
advert_model_combo <- lm(advert$sales~advert$TV+advert$radio+advert$newspaper, dataset=advert_train)
advert_model_intr <- lm(advert$sales~advert$TV+advert$radio+advert$newspaper+(advert$TV*advert$radio), dataset=advert_train)

advert_model_radio
advert_model_newspaper
advert_model_TV
advert_model_combo
advert_model_intr

advert_prediction_radio <- predict(advert_model_radio, advert_test[,-5])
print(advert_prediction_radio)

par(mfrow = c(1,5))
plot(advert$sales, advert$radio, col = 2)
abline(advert_model_radio, col = 1)

plot(advert$sales, advert$newspaper, col = 3)
abline(advert_model_newspaper, col = 2)

plot(advert$sales, advert$TV, col = 4)
abline(advert_model_TV, col = 3)

plot(advert$sales, advert$TV+advert$radio+advert$newspaper, col = 5)
abline(advert_model_combo, col = 4)

plot(advert$sales, advert$TV+advert$radio+advert$newspaper+(advert$TV*advert$radio), col = 6)
abline(advert_model_intr, col = 5)

advert_residual_radio <- advert[c(151:200),5] - advert_prediction_radio
advert_residual_radio