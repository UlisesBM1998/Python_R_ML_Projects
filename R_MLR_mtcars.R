#Getting the data
mtcars
dim(mtcars)

#Correlation
cor(mtcars[1:4])
corrgram(mtcars[1:4], order = T, lower.panel = panel.shade,
         upper.panel = panel.pie, text.panel = panel.txt, main = "Cars")

#Analyzing mpg vs cyl
plot(mtcars$mpg ~ mtcars$disp, ylab = "Expenditure", xlab ="Cylinders",
     main = "Cars")

#Creating the model
model = lm(mpg~disp, data = mtcars)
model

#Coefficient of determination
summary(model)$r.squared
summary(model)$adj.r.squared

#Visualization
plot(mpg ~ disp, data = mtcars, ylab = "Expenditure", xlab = "Cylinders",
     main = "Cars")
abline(model)

#Predictions
predict(model, data.frame(disp = 200))

#Making a model with multiples independent variables
model = lm(mpg~disp + hp + cyl, data = mtcars )
model

#Coefficient of determination
summary(model)$r.squared
summary(model)$adj.r.squared

#Predictions
predict(model, data.frame(disp = 200, hp = 100, cyl = 4))