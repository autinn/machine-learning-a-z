# Multiple Linear Regression

# Importing the dataset
dataset = read.csv('50_Startups.csv')

#Encoding Categorical Data
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1, 2, 3))

#Splitting Data
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split==TRUE)
test_set = subset(dataset, split==FALSE)

#Fitting Multiple Linear Regression to the Training Set
regressor = lm(formula = Profit ~ .,
               data = training_set)

#predicting the test set
y_pred = predict(regressor, newdata=test_set)

#Building the optimal model using Backward Elimination 
#replace the dot with all independent variables for easier removal 
#use the whole dataset to see which independent variables are statistiscally significant
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
               data = dataset)

regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend,
               data = dataset)
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
               data = dataset)
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend,
               data = dataset)
summary(regressor)







