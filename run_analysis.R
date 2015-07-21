rawtest<-cbind(
      read.table("./UCI HAR Dataset/test/subject_test.txt"),
      read.table("./UCI HAR Dataset/test/y_test.txt"),
      read.table("./UCI HAR Dataset/test/x_test.txt"))
rawtrain<-cbind(
      read.table("./UCI HAR Dataset/train/subject_train.txt"),
      read.table("./UCI HAR Dataset/train/y_train.txt"),
      read.table("./UCI HAR Dataset/train/x_train.txt"))
rawtotal<-rbind(rawtest,rawtrain)
## finish Merges the training and the test sets to create one data set.
features<-as.character(read.table("./UCI HAR Dataset/features.txt")[,2])
rawlabels<-c("subject_","activity_labels")
rawlabels1<-append(rawlabels,features)
colnames(rawtotal)<-rawlabels1
datastep2<-rawtotal[,c(1,
                       2,
                       grep("-mean()", colnames(rawtotal),fixed=T),
                       grep("-std()", colnames(rawtotal),fixed=T))]
## 
