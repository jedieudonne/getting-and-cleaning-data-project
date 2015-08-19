
## 1st part : getting data
url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
filename<-"dossier"
download.file(url, destfile = filename)
setwd("C:/Users/jerome/Documents/R")
data <- unzip(filename)
setwd("C:/Users/jerome/Documents/R/UCI HAR Dataset")

## 2nd part : subsetting "features"
feature_names <- read.table("features.txt")
features_ok <- grep("std|mean", feature_names$V2)

## 3rd part 1 : subsetting "train"
train_features <- read.table("train/X_train.txt")
desired_train_features <- train_features[,features_ok]

## 3rd part 2 : subsetting "test"
test_features <- read.table("test/X_test.txt")
desired_test_features <- test_features[,features_ok]

## 4th part : merging and naming
total_features <- rbind(desired_train_features, desired_test_features)
colnames(total_features) <- feature_names[features_ok, 2]

## 5th part : reading all about activities
test_activities <- read.table("test/y_test.txt")
train_activities <- read.table("train/y_train.txt")
activity_labels <- read.table("activity_labels.txt")

## 6th part : creating final.activity
final_activity<- rbind(train_activities, test_activities)
final_activity$activity <- factor(final_activity$V1, levels = activity_labels$V1, labels = activity_labels$V2)

## 7th part : reading all about subjects
test_subjects <- read.table("test/subject_test.txt")
train_subjects <- read.table("train/subject_train.txt")


## 8th part : creating final.subjects
final_subjects <- rbind(train_subjects, test_subjects)

## 9th part : grouping
subjects_and_activities <- cbind(final_subjects, final_activity$activity)
colnames(subjects_and_activities) <- c("subject_id", "activity")
activity_frame <- cbind(subjects_and_activities, total_features)
result_frame <- aggregate(activity_frame[,3:81], by = list(activity_frame$subject_id, activity_frame$activity), FUN = mean)
colnames(result_frame)[1] <- "subject_id"
colnames(result_frame)[2] <- "activity"

# 10th part : creating final file
write.table(result_frame, file="tidy_data_mean_measures.txt", row.names = FALSE)

# 11th part : cleaning 
rm(activity_frame)
rm(activity_labels)
rm(desired_test_features)
rm(feature_names)
rm(subjects_and_activities)
rm(test_activities)
rm(test_subjects)
rm(test_features)
rm(final_activity)
rm(total_features)
rm(final_subjects)
rm(train_activities)
rm(train_features)
rm(train_subjects)