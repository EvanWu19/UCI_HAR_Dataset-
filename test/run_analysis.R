rawtest<-cbind(
      read.table("./UCI HAR Dataset/test/subject_test.txt"),
      read.table("./UCI HAR Dataset/test/y_test.txt"),
      read.table("./UCI HAR Dataset/test/x_test.txt"))
rawtrain<-cbind(
      read.table("./UCI HAR Dataset/train/subject_train.txt"),
      read.table("./UCI HAR Dataset/train/y_train.txt"),
      read.table("./UCI HAR Dataset/train/x_train.txt"))
rawtotal<-rbind(rawtest,rawtrain)
features<-as.character(read.table("./UCI HAR Dataset/features.txt")[,2])
rawlabels<-c("subject","activity_labels")
rawlabels1<-append(rawlabels,features)
colnames(rawtotal)<-rawlabels1
head(rawtotal,3)