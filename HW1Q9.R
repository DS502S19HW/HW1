# Author: Tianyu Li
# Created on Jan 29th 2019
#
# R script for Homework 1 Question 9(Section 3.7, page 122, question 9)
# The Auto.csv file should be in working direction 
setwd('Z:/R_working_directory/DS502HW1');

# Read the file
auto = read.csv(file = 'Auto.csv', header = TRUE);

# Remove missing values
auto[auto == '?'] <- NA;
auto = na.omit(auto);
auto$horsepower = as.numeric(auto$horsepower);

#(a) Produce a scatterplot matrix
pairs(auto);

#(b) Compute the matrix of correlations
cor(auto[, 1:8]);

#(c) Perform a multiple linear regression with mpg
temp = lm(mpg ~ . - name, data = auto);
summary(temp);
# Comment: TODO

#(d) Produce diagnostic plots of the linear regression fit
par(mfrow=c(2,2));
plot(temp)
# Comment: TODO

#(e)