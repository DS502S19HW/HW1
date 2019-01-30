# Author: Tianyu Li
# Created on Jan 29th 2019
#
# R script for Homework 1 Question 9(Section 3.7, page 121-122, question 8)
# The Auto.csv file should be in working direction 
setwd('Z:/R_working_directory/DS502HW1');

# Read the file
auto = read.csv(file = 'Auto.csv', header = TRUE);

# Remove missing values
auto[auto == '?'] <- NA;
auto = na.omit(auto);
auto$horsepower = as.numeric(as.character(auto$horsepower));

#(a) Perform a simple linear regression
temp = lm(mpg ~ horsepower, data = auto);
summary(temp);
# i Yes
# ii The relationship is strong as the value of R^2 is 0.6059
# iii Negative, the coefficient is -0.157845.
# iv Predict mpg associated with a horsepower of 98
predict(temp, data.frame(horsepower = 98), interval = "confidence");
predict(temp, data.frame(horsepower = 98), interval = "prediction");

#(b) Plot the response and the predictor
par(mfrow=c(1,1));
plot(mpg ~ horsepower, data = auto);
abline(temp, col = 'red');

#(c) Produce diagnostic plots of the least squares regression fit
par(mfrow = c(2, 2))
plot(temp);
# Comment: The plots (the first and third one) show that the relationship is non-linear. 
