
## 1st part : getting data
url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
filename<-"dossier"
download.file(url, destfile = filename)
setwd("C:/Users/jerome/Documents/R")
data <- unzip(filename)

## 2nd part : subsetting "features"
setwd("C:/Users/jerome/Documents/R/UCI HAR Dataset")
feature.names <- read.table("features.txt")
features.ok <- grep("std|mean", feature.names$V2)
print(features.ok)

## 3rd part 1 : subsetting "train"
train.features <- read.table("train/X_train.txt")
desired.train.features <- train.features[,features.ok]

## 3rd part 2 : subsetting "test"
test.features <- read.table("test/X_test.txt")
desired.test.features <- test.features[,features.ok]

## 4th part : merging and naming
total.features <- rbind(desired.train.features, desired.test.features)
colnames(total.features) <- feature.names[features.ok, 2]

## 5th part : reading all about activities                          
train.activities <- read.table("train/y_train.txt")
test.activities <- read.table("test/y_test.txt")
activity.labels <- read.table("activity_labels.txt")

## 6th part : creating final.activity
final.activity<- rbind(train.activities, test.activities)
final.activity$activity <- factor(final.activity$V1, levels = activity.labels$V1, labels = activity.labels$V2)

## 7th part : reading all about subjects
train.subjects <- read.table("train/subject_train.txt")
test.subjects <- read.table("test/subject_test.txt")

## 8th part : creating final.subjects
final.subjects <- rbind(train.subjects, test.subjects)

## 9th part : grouping
subjects.and.activities <- cbind(final.subjects, final.activity$activity)
colnames(subjects.and.activities) <- c("subject.id", "activity")
activity.frame <- cbind(subjects.and.activities, total.features)
result.frame <- aggregate(activity.frame[,3:81], by = list(activity.frame$subject.id, activity.frame$activity), FUN = mean)
colnames(result.frame)[1:2] <- c("subject.id", "activity")

# 10th part : creating final file
write.table(result.frame, file="tidy_data_mean_measures.txt", row.names = FALSE)

# 11th part : cleaning 
rm(activity.frame)
rm(activity.labels)
rm(desired.test.features)
rm(feature.names)
rm(result.frame)
rm(subjects.and.activities)
rm(test.activities)
rm(test.subjects)
rm(test.features)
rm(final.activity)
rm(total.features)
rm(final.subjects)
rm(train.activities)
rm(train.features)
rm(train.subjects)