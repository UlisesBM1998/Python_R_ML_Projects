#Getting the data
votes = read.csv("Eleicao.csv", sep = ";", header = T)
votes

#Visualization
plot(votes$DESPESAS, votes$SITUACAO)
summary(votes)

#Correlation
cor(votes$DESPESAS, votes$SITUACAO)

#Logistic Regression
model = glm(SITUACAO~DESPESAS, data = votes, family = "binomial")
summary(model)

#Analyzing the model´s data
plot(votes$DESPESAS, votes$SITUACAO, col = "red", pch = 20)
points(votes$DESPESAS, model$fitted.values, pch = 4)

#Testing the model with real data
forecasting = predict(model, newdata = votes, type = "response")
forecasting = forecasting>=0.5
forecasting

#Confusion matrix
conMatrix = table(forecasting, votes$SITUACAO)
rightRate = (conMatrix[1] + conMatrix[4]) / sum(conMatrix)
rightRate

#NEW VOTES
newVotes = read.csv("NovosCandidatos.csv", sep = ";", header = T)
newVotes

#Forecasting
newVotes$RESULT = predict(model, newdata = newVotes, type = "response")
newVotes$RESULT >=0.5
newVotes$RESULT