run_analysis<-function(){
  library(dplyr)
  # Read train Data
  x_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
  y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")
  subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
  
  # Read test Data
  x_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
  y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
  subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
  
  # Read activity labels
  activity<-read.table("./UCI HAR Dataset/activity_labels.txt")
  
  # Read feature names
  feature<-read.table("./UCI HAR Dataset/features.txt")
  
  # 1 combine training and test data
  x_total<-rbind(x_train,x_test)
  y_total<-rbind(y_train,y_test)
  subject<-rbind(subject_train,subject_test)
  
  # variable name for subject
  names(subject) <- "subject"
  
  # variable for activity
  names(y_total)<-c("activity")
  
  # 2. Extracts only the measurements on the mean and standard deviation for each measurement.
  mean_sd_subset<-grepl("mean|std",feature[,2])
  x_total<-x_total[,mean_sd_subset]
  
  # 3. Uses descriptive activity names to name the activities in the data set
  y_total<-lapply(y_total,function(i){activity[i,2]})
  y_total<-as.data.frame(y_total)
  
  # 4.Appropriately labels the data set with descriptive variable names.
  #cleanup feature names to be readable
  featuresubset <- feature[mean_sd_subset,]
  featuresubset[,2]<-gsub("(\\(\\)|\\))","",featuresubset[,2])
  featuresubset[,2]<-gsub("(-|,|\\()","_",featuresubset[,2])
  names(x_total)<-featuresubset[,2]
  
  # 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  finaldataset<-cbind(x_total,y_total,subject)
  avgdataset <- finaldataset %>% group_by(activity,subject) %>% summarize_each(funs(mean))
  
  # Creating a file with the final tidy data set
  write.table(avgdataset,file = "./tidydata.txt",row.names = FALSE,col.names = FALSE)
}