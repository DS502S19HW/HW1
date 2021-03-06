# Author: Tianyu Li
# Created on Jan 28th 2019
# Edited on Jan 29th 2019
#
# R script for Homework 1 Question 5(Section 2.4, page 56, question 9)
# The Auto.csv file should be in working direction 
setwd('Z:/R_working_directory/DS502HW1');

# Read the file
auto = read.csv(file = 'Auto.csv', header = TRUE);

# Remove missing values
auto[auto == '?'] <- NA;
auto = na.omit(auto);
auto$horsepower = as.numeric(as.character(auto$horsepower));

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
pairs(auto[, 1:7]);
# We found that the displacement and weight look postively correlated to the horsepower.

#(f) Predictors that might be useful in predicting mpg
# From the figures of last question, we found that mpg is postively correlated to year and
# negatively correlated to displacement, horsepower and weight. 
boxplot(auto$mpg ~ auto$origin, names = c("America", "Europe", "Japan"), ylab = "mpg", 
        main = "Mpg over Origin");
# We also found that for the origin column, 1 should stands for America, 2 stands for Europe
# and 3 stands for Asia. In general, asian cars is highest on mpg while american cars is lowest.

