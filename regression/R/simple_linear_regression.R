# Simple Linear Regression

# Importing the dataset
dataset = read.csv('Salary_Data.csv')

#Splitting Data 
library(caTools)

set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3) 
training_set = subset(dataset, split==TRUE)
test_set = subset(dataset, split==FALSE)

#Fitting Simple Linear Regression to the Training Set 
regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)

#Predicting test set results
y_pred = predict(regressor, newdata=test_set)

#Visualising Training set results
library(ggplot2)
ggplot()+
  geom_point(aes(x=training_set$YearsExperience, y=training_set$Salary),
             color = 'red') +
  geom_line(aes(x=training_set$YearsExperience, y=predict(regressor, newdata=training_set)),
            color = 'blue') +
  ggtitle('Salary vs Experience (Training Set)') +
  xlab('Year of Expereience') +
  ylab('Salary')

#Visualising Test set results 
ggplot()+
  geom_point(aes(x=test_set$YearsExperience, y=test_set$Salary),
             color = 'red') +
  geom_line(aes(x=training_set$YearsExperience, y=predict(regressor, newdata=training_set)),
            color = 'blue') +
  ggtitle('Salary vs Experience (Test Set)') +
  xlab('Year of Expereience') +
  ylab('Salary')







