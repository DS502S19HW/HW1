# Author: Tianyu Li
# Created on Jan 28th 2019
# Edited on Jan 29th 2019
#
# R script for Homework 1 Question 4(Section 2.4, page 54-55, question 8)
# The college.csv file should be in working direction 
setwd('Z:/R_working_directory/DS502HW1');

# Read the file
auto = read.csv(file = 'Auto.csv', header = TRUE);

# Remove missing values
auto[auto == '?'] <- NA;
auto = na.omit(auto);
auto$horsepower = as.numeric(auto$horsepower);

#(a) The last 2 predictors are qualitative, the others are quantative.
#    The "origin" should stands for the continent so it is qualitative.

#(b) Range of each quantitative predictor
sapply(auto[, 1:7], range);

#(c) Mean and standard deviation of each quantitative predictor
sapply(auto[, 1:7], mean);
sapply(auto[, 1:7], sd);

#(d) Remove the 10th through 85th observations.
subAuto = auto[-(10:85),];
sapply(subAuto[, 1:7], range);
sapply(subAuto[, 1:7], mean);
sapply(subAuto[, 1:7], sd);

#(e) Create some plots
# TODO

#(f) Predictors that might be useful in predicting mpg
pairs(auto[, 1:7]);
boxplot(auto$mpg ~ auto$origin);
