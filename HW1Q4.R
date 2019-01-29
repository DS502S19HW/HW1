# Author: Tianyu Li
# Created on Jan 21st 2019
# Edited on Jan 28th 2019
#
# R script for Homework 1 Question 4(Section 2.4, page 54-55, question 8)
# The college.csv file should be in working direction 
setwd('Z:/R_working_directory/DS502HW1');

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
        ylab = "Out-of-state tuition");

#(c) iv.Factor function
Elite = rep("No", nrow(college));
Elite[college$Top10perc > 50] = "Yes";
Elite = as.factor(Elite);
college = data.frame(college, Elite);

summary(college$Elite);
boxplot(college$Outstate ~ college$Elite, names = c("Non-Elite", "Elite"),
        ylab = "Out-of-state tuition");

#(c) v.Hist function
par(mfrow=c(2,2));

hist(college$Apps, breaks = 40, xlim = range(0, 20000), main = "Applications",
     xlab = "Number of application recieved");
hist(college$Accept, breaks = 20, xlim = range(0, 20000), main = "Admissions",
     xlab = "Number of applicants accepted");
hist(100 * college$Accept / college$Apps, breaks = 20, xlim = range(0, 100),
     main = "Admission Rate", xlab = "Admission rate in %");
hist(100 * college$Enroll / college$Accept, breaks = 20, xlim = range(0, 100),
     main = "Enroll Rate", xlab = "Enroll rate in %");

#(c) vi. TODO

