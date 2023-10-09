#Getting the data
install.packages("corrgram")
library(corrgram)
cars
dim(cars)

#Correlation insights
install.packages("corrgram")
library(corrgram)
cor(cars)
corrgram(cars, order = T, lower.panel = panel.shade, upper.panel = panel.pie,
         text.panel = panel.txt, main = "Cars")

#Creating the lm model
model = lm(speed~dist, data = cars)
model

#Visualization the relationship between variables
plot(speed~dist, data = cars, ylab = "Speed", xlab = "Distance",
     main = "Cars")
abline(model)

#We can make forecasting using the coefficients
model$coefficients
model$coefficients[1] + model$coefficients[2] * 22

#Same process but using predict
predictValue = predict(model,data.frame(dist = 22))
predictValue

#Extra function to support the analysis
summary(model)
model$coefficients
model$residuals
hist(model$residuals)
model$fittted.values
plot(model$fitted.values, cars$dist)