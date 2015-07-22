## Step 1:Merges the training and the test sets to create one data set.
rawtest<-cbind(
      read.table("./UCI HAR Dataset/test/subject_test.txt"),
      read.table("./UCI HAR Dataset/test/y_test.txt"),
      read.table("./UCI HAR Dataset/test/x_test.txt"))
rawtrain<-cbind(
      read.table("./UCI HAR Dataset/train/subject_train.txt"),
      read.table("./UCI HAR Dataset/train/y_train.txt"),
      read.table("./UCI HAR Dataset/train/x_train.txt"))
rawtotal<-rbind(rawtest,rawtrain)
## Step 1 finish
## Step 4: Appropriately labels the data set with descriptive variable names
features<-as.character(read.table("./UCI HAR Dataset/features.txt")[,2])
rawlabels1<-c("subject","activity_labels")
rawlabels1<-append(rawlabels1,features)
colnames(rawtotal)<-rawlabels1 
## Step 4 finish
## Step 2: Extracts only the measurements on the mean and standard deviation 
## for each measurement
datastep2<-rawtotal[,c(1,
                       2,
                       grep("-mean()", colnames(rawtotal),fixed=T),
                       grep("-std()", colnames(rawtotal),fixed=T))]
## Step 2 finish
## Step 3: Uses descriptive activity names to name the activities in the data set
activity<-read.table("./UCI HAR Dataset/activity_labels.txt",
                     col.names = c("activity_labels","activity"))
datastep3<-merge.data.frame(activity,datastep2,all=T,sort=F)
datastep3$activity_labels<-NULL
## Step 3 finish
## Step 5: From the data set in step 4, 
## creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.
colname1<-colnames(datastep3)
tidydatastep5<-aggregate(datastep3[,3:ncol(datastep3)],
                         by=list(datastep3$activity,datastep3$subject),
                         FUN=mean)
colnames(tidydatastep5)<-colname1
write.table(tidydatastep5,
            file="./UCI HAR Dataset/average_of_each_variable_by_sub_by_act.txt",
            row.names = F)
## Step 5 finish
