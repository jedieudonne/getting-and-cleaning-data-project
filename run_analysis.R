library(dplyr)
#setwd("./UCI HAR Dataset")
# step 1 : reads everything
activity_labels<-read.table("activity_labels.txt")
features_txt<-read.table("features.txt")
subject_test<-read.table("./test/subject_test.txt")
X_test<-read.table("./test/X_test.txt")
activity_test<-read.table("./test/y_test.txt")
subject_train<-read.table("./train/subject_train.txt")
X_train<-read.table("./train/X_train.txt")
activity_train<-read.table("./train/y_train.txt")


# step 2 : create a logical vector with features containing mean or std. 
# Creates a vector with all the features containing mean or std
featuresmean<-grepl("mean",features_txt[,2])
featuresstd<-grepl("std",features_txt[,2])
name_of_features_selected<-features_txt[featuresmean|featuresstd,]
features_selected_logical<-featuresmean|featuresstd

# step 3 : subset everything in accordance with features_selected_logical
X_test_selected<-X_test[,features_selected_logical]
X_train_selected<-X_train[,features_selected_logical]

# step 4 : concatenate X_test_selected and X_train_selected into features_total_selected and name the columns
features_total_selected<-rbind(X_test_selected,X_train_selected)
colnames(features_total_selected)<-features_txt[features_selected_logical,2]

# step 5 : creates columns for activity and subject_id.
activity<-rbind(activity_test,activity_train)
i=1
names=c()
while(i<=length(activity[,1])){
  names<-c(names,as.character(activity_labels$V2[activity[i,1]]))
  i=i+1
}
activity<-names
subject<-rbind(subject_test,subject_train)
activity_and_subject<-cbind(activity,subject)
colnames(activity_and_subject)<-c("activity","subject_id")

# step 6 : create the final frame and the txt file
final_frame<-cbind(activity_and_subject , features_total_selected)
result_frame <- aggregate(final_frame[,3:81], by = list(final_frame$subject_id, final_frame$activity), FUN = mean)
colnames(result_frame)[which(names(result_frame) == "Group.1")] <- "subject_id"
colnames(result_frame)[which(names(result_frame) == "Group.2")] <- "activity"
write.table(result_frame, file="tidy_data_mean_measures.txt", row.names = FALSE)

#step 7 : clean the variables
rm(activity_labels,features_txt,subject_test,X_test,activity_test,X_test_selected,X_train_selected,activity_and_subject,activity,subject_train,X_train,activity_train,subject,name_of_features_selected)


