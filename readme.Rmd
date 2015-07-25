---
title: "Readme"
author: "EvanWu"
date: "2015年7月25日"
output: html_document
---
# Creating of run_analysis.R
 You can embed an R code chunk like this:

```{r}
summary(cars)
```
## Step 1:Merges the training and the test sets to create one data set.
```{r}
cbind("subject_data","feature_data","activity_data")
```
First to seperately merge the data of test and train
```{r}
rbind("test_data","train_dat")
```
Now the whole data is merged to one data set.
## Step 2:Appropriately labels the data set with descriptive variable names
For the features lable is a long list, i extract the lable from raw data to create a character vector.
```{R}
["features_label",2]
```
concatenate the above vector with "activity_label","subject"
```{R}
rawlabels1<-c("subject","activity_labels")
rawlabels1<-append(rawlabels1,features)
```
and assign this character vector as the column names of data set.
```{R}
colnames(rawtotal)<-rawlabels1 
```
## Step 3:Extracts only the measurements on the mean and standard deviation 
## for each measurement
I choose to use
```{R}
grep()
```
to do exact match search for "mean()" and "std()" in column names.
grep() will return a numeric vector
I simplly merge the two numeric vector and add 1, 2 to creat a new numeric vector to help me subset the column of the rawdata set
```{R}
datastep2<-rawtotal[,c(1,
                       2,
                       grep("-mean()", colnames(rawtotal),fixed=T),
                       grep("-std()", colnames(rawtotal),fixed=T))]
```
## Step 4:Uses descriptive activity names to name the activities in the data set
create a new data set with "activity_label" and "activity"
```{R}
activity<-read.table("./UCI HAR Dataset/activity_labels.txt",
                     col.names = c("activity_labels","activity"))
```
merge above data set with the data set I created in step 3 by"activity_labels"
then drop the "activity_labels" column
```{R}
datastep3<-merge.data.frame(activity,datastep2,all=T,sort=F)
datastep3$activity_labels<-NULL
```
## Step 5:From the data set in step 4, creates a second, independent tidy data set 
##        with the average of each variable for each activity and each subject.
I choose to use aggregate function to do the mean
```{R}
tidydatastep5<-aggregate(datastep3[,3:ncol(datastep3)],
                         by=list(datastep3$activity,datastep3$subject),
                         FUN=mean)
```
And my tidy data set is finished. Following the instruction to output it into a text file.
```{R}
write.table(tidydatastep5,
            file="./UCI HAR Dataset/average_of_each_variable_by_sub_by_act.txt",
            row.names = F)
```



