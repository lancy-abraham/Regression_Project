#################################
###  CASE STUDY ANALSYSIS
#################################
##### Importing data
data1=read.csv(###your code here)

  
### Install and activate package 'ggplot2' needed for histogram and box plot
install.packages("ggplot2")
library(ggplot2)


### Histogram of the response variable ###
qplot(###your code here)
 
   
### Boxplot of the response variable ###
ggplot(###your code here)
  
  
### Obtaining descriptive statistics ###
install.packages("pastecs") # Install package 'pastecs' needed for obtaining descriptive stats 
library(pastecs)
  
stat.desc(###your code here) # stat_desc(): function for displaying the descriptive statistics - mean, median, SD etc.


### Creating training and test set
set.seed(123)
indx=sample(1:nn,0.9*nn)
traindata=data_an[indx,]
testdata=data_an[-indx,]

  
### Fitting the main multiple linear regression (MLR) model with all relevant predictors ###
mod1=lm(###your code here)
summary(mod1)


### Cross validation of the model using out-of-sample data ###
pred_val=predict(###your code here) # The predicted values are assigned to the variable named 'pred_val'.
  
# cor() is a function that finds correlation between two variables, here between actual values in the testdata and pred_val which indicates values predicted by the model
cor(###your code here)
  
###calculate root mean squared error of the residuals (RMSE) ###
sqrt(###your code here)
  
###plot the QQ-plot, residual plot and standardized residual plot for our analysis.
plot(###your code here)
  
###perfrom shapiro test
shapiro.test(###your code here) 
  
  
###  Durbin-Watson test ###
install.packages("lmtest")
library(lmtest)
dwtest(###your code here)
  

### Multicollinearity check  
install.packages("car")
library(car)
vif(###your code here) 
    
  
### Variable selection
install.packages("MASS") # Installing and activating the package 'MASS'. 
library(MASS) # This package contains a function called stepAIC() which is used to perform stepwise regression for variable selection. 
step.model=stepAIC(###your code here) 
summary(step.model) # returns summary of the model analysis results.
  
### Fit the model with the selected variables and evaluate its performance

###your code here