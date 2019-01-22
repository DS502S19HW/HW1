# Author: Tianyu Li
# Created on Jan 21st 2019
#
# R script for Homework 1 Question 4(Section 2.4, page 54-55, question 8)
# The college.csv file should be in working direction
# setwd('Z:/R_working_directory');

#(a) Read the file
college = read.csv(file = 'College.csv', header = TRUE);

#(b) Give row names
rownames(college) = college[,1];
fix(college);

college = college[,-1];
fix(college);

#(c) i.Summary function
summary(college);

#(c) ii.Pairs function
pairs(college[,1:10]);

#(c) iii.Plot function
boxplot(college$Outstate ~ college$Private, names = c("Public", "Private"), 
ylab = "Out-of-state tuition")
