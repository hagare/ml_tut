# Example of regression model 

# linear regression is y = b_0 +b_1*x where b_0 is intercept and b_1 is the slope of the line
# least squares method is an error measure minimizes the residual: sum i=1 to n (y_i - (b_0+b_1*x_i))^2

# This example tries to generate a relationship between the height and weight of children

# Is there a correlation between the variables in question (ht and wt)?
# 1. Input data vectors

height <- c(69.1,56.4,65.3,62.8,63,57.3,59.8,62.5,62.5,59.0,51.3,64,56.4,66.5,72.2,65.0,67.0,57.6,66.6)

weight <- c(113,84,99,103,102,83,85,113,84,99,51,90,77,112,150,128,133,85,112)

# Visualize data
plot(height,weight)

# Determine correlation
cor(height,weight) # correlation between <-0.5 and >0.5 is moderate to strong
# Correlation does not imply causation

# 2. Fit the linear model
model <- lm(weight ~ height) # weight = slope* height +intercecpt

# 3. Explore results
#determine b0 (intercept) and b1 (slope) from model
model

# all attributes of the linear model
attributes(model)

# intercept
model$coefficients[1] # or model$coefficients[[1]]

# slope
model$coefficients[2] # or model$coefficients[[2]]

# residuals
residuals(model)

# visualize regression
plot(height,weight)
abline(model)

# Other regression models include logistic regression, 
# stepwise regression, mutlivariate adaptived regression splines (MARS),
# and other supervised regression learning algorithms

