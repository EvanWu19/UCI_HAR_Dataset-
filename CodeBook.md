---
title: "CodeBook_GettingAndCleanData_Project"
author: "EvanWu"
date: "2015年7月25日"
output: html_document
---
# Code Book
## Project Description
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 
* 1) a tidy data set as described below, 
* 2) a link to a Github repository with your script for performing the analysis,
* 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
* 4) You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.   

## Variables
### activity and subject
These two variables are the first two column of the tidy datafile.
* Activity means what kind of activities the subject is doing when collecting datas
* Subject is the Number that represent the different person doing the test

### Other measured variables(features)

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation

make totally of 66 features showing in the tidy_datfile.

## The meaning of Data in each features
* In the raw data we have multiple observations of the same subject and the same activity.
* In the tidy datafile we calculate the average value of each features we choosed for each subject and each activity.

## Transform and Clean Raw Data
The detail steps are explained in Readme.md
* Creat a R script named run_analysis.R to
* 1.Merges the training and the test sets to create one data set.
* 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
* 3.Uses descriptive activity names to name the activities in the data set
* 4.Appropriately labels the data set with descriptive variable names. 
* 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
The final tidy datafile:"average_of_each_variable_by_sub_by_act.txt"



