# Polynomial Regression

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

#small dataset = do not split data
#multiple linear model = multiple layers / features 

#fitting linear model 
lin_reg = lm (Salary ~ Level, 
              data = dataset)


#fitting polynomial model
dataset$Level2 = dataset$Level^2
poly_reg = lm(Salary ~.,
              data = dataset)

dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4
poly_reg = lm(Salary ~.,
              data = dataset)

#visualise the linear regression model
library(ggplot2)

ggplot()+
  geom_point(aes(x=dataset$Level, y=dataset$Salary),
             color='red')+
  geom_line(aes(x=dataset$Level, y=predict(lin_reg, newdata=dataset)),
            color='blue')+
  ggtitle("Truth or Bluff (Linear Regression)")+
  xlab("Level")+
  ylab('Salary')

#visualise the polynomial result 
ggplot()+
  geom_point(aes(x=dataset$Level, y=dataset$Salary),
             color='red')+
  geom_line(aes(x=dataset$Level, y=predict(poly_reg, newdata=dataset)),
            color='blue')+
  ggtitle("Truth or Bluff (Polynomial Regression)")+
  xlab("Level")+
  ylab('Salary')

#predicting a new result from linear regression 
y_pred = predict(lin_reg, data.frame(Level=6.5))

#predicting a new result from polynomial regression 
y_pred = predict(poly_reg, data.frame(Level=6.5, 
                                      Level2=6.5^2,
                                      Level3=6.5^3,
                                      Level4=6.5^4))          













