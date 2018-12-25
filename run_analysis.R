
activity_labels<-read.table("activity_labels.txt")
features<-read.table("features.txt")
# /*features_info<-read.table("features_info.txt")*/
subject_train<-read.table("train/subject_train.txt")
subject_test<-read.table("test/subject_test.txt")
X_test<-read.table("test/X_test.txt")
y_test<-read.table("test/y_test.txt")
X_train<-read.table("train/X_train.txt")
y_train<-read.table("train/y_train.txt")
total_X<-rbind(X_train,X_test)
total_Y<-rbind(y_train,y_test)
required_measurements<-grep("mean()|std()", features[,2])
required_total_X<-total_X[,required_measurements]
#Uses descriptive activity names to name the activities in the data set
#Extracting activity names for all features
cleanfeaturenames<-sapply(features[,2],function(x){gsub("[()]", "",x )})
#Extracting required activity names for all features
required_clean_feature_measurements<-cleanfeaturenames[required_measurements]

#Appropriately labels the data set with descriptive variable names
names(required_total_X)<-required_clean_feature_measurements
#Combining total subjects of training and testing set
total_subjects<-rbind(subject_train, subject_test)
names(total_subjects)<-'subject'
names(total_Y)<-'activity'
total_X<-cbind(total_subjects, total_Y, total_X)

act_group <- factor(total_X$activity)
levels(act_group) <- activity_labels[,2]
total_X$activity <- act_group

if (!"reshape2" %in% installed.packages()) {
  install.packages("reshape2")
}
library("reshape2")

baseData <- melt(total_X,(id.vars=c("subject","activity")))

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
secondDataSet <- dcast(baseData, subject + activity ~ variable, mean)
names(secondDataSet)[-c(1:2)] <- paste("[mean of]" , names(secondDataSet)[-c(1:2)] )
#Writing the results to tidy_Data.txt file
write.table(secondDataSet, "tidy_data.txt", sep = ",")


