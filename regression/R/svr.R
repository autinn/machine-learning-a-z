# SVR

#regression template

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Splitting the dataset into the Training set and Test set

# Feature Scaling
#training_set = scale(training_set)
# test_set = scale(test_set)

#fitting the SVR Model 
regressor = svm(formula = Salary ~ ., 
                data = dataset,
                type = 'eps-regression')

#predicting a new result from regression model
y_pred = predict(regressor, data.frame(Level=6.5)) 

#visualise the SVR model (for high resolution and smoother curve)
library(ggplot2)

x_grid = seq(min(dataset$Level),max(dataset$Level),0.1)
#visualise the polynomial result 
ggplot()+
  geom_point(aes(x=dataset$Level, y=dataset$Salary),
             color='red')+
  geom_line(aes(x=x_grid, y=predict(regressor, newdata=data.frame(Level=x_grid))),
            color='blue')+
  ggtitle("Truth or Bluff (SVR Regression)")+
  xlab("Level")+
  ylab('Salary')
