# Author: Tianyu Li
# Created on Jan 29th 2019
#
# R script for Homework 1 Question 10(Section 3.7, page 122, question 9)
# The Auto.csv file should be in working direction 
setwd('Z:/R_working_directory/DS502HW1');

# Read the file
auto = read.csv(file = 'Auto.csv', header = TRUE);

# Remove missing values
auto[auto == '?'] <- NA;
auto = na.omit(auto);
auto$horsepower = as.numeric(as.character(auto$horsepower));

#(a) Produce a scatterplot matrix
pairs(auto);

#(b) Compute the matrix of correlations
cor(auto[, 1:8]);

#(c) Perform a multiple linear regression with mpg
temp = lm(mpg ~ . - name, data = auto);
summary(temp);
#i Yes, the adjusted R-squared value is 0.8185, which is high.
#ii From the summary table, we may conclude that 'displacement', 'weight',
#   'year', 'origin' have a statistically significant relationship to the response.
#iii It suggests that in average, 0.750773 mpg will increase as a year increase.
#    Which means the fuel efficiency is improving.


#(d) Produce diagnostic plots of the linear regression fit.
par(mfrow=c(2,2));
plot(temp);
# No unusually large outliers are observed. 
# The plot shows that the 14th data have a relatively high leverage.
temp2 = lm(mpg ~ . - name, data = auto[-(14),]);
summary(temp2);
# By removing the 14th data, the R-squared value increase for 0.0006

#(e) Fit linear regression models with interaction effects.
temp3 = lm(mpg ~ . - name + horsepower:weight + horsepower:displacement, data = auto);
summary(temp3);
# The interaction between displacement and horsepower appear to be statistically significant.


#(f) Try a few different transformations of the variables
cor(data.frame(auto$weight, log(auto$weight), sqrt(auto$weight), (auto$weight)^2), auto$mpg);
cor(data.frame(auto$horsepower, log(auto$horsepower), sqrt(auto$horsepower), (auto$horsepower)^2), auto$mpg);
cor(data.frame(auto$cylinders, log(auto$cylinders), sqrt(auto$cylinders), (auto$cylinders)^2), auto$mpg);
cor(data.frame(auto$displacement, log(auto$displacement), sqrt(auto$displacement), (auto$displacement)^2), auto$mpg);
cor(data.frame(auto$acceleration, log(auto$acceleration), sqrt(auto$acceleration), (auto$acceleration)^2), auto$mpg);
cor(data.frame(auto$origin, log(auto$origin), sqrt(auto$origin), (auto$origin)^2), auto$mpg);
cor(data.frame(auto$year, log(auto$year), sqrt(auto$year), (auto$year)^2), auto$mpg);
# Weight, horsepower, displacement, acceleration and origin fit the log transformation best,
# Cylinders fit the square root transformation best and year fit square transfromation best.
