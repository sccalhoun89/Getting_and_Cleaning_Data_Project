library(dplyr)
library(data.table)

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "Dataset.zip")
unzip("Dataset.zip")
setwd("UCI HAR Dataset")

rm("fileUrl")

# Merge the training and test sets to create one data set.

features <- read.table("features.txt", header = FALSE)

X_test <- read.table("test/X_test.txt", header = FALSE)
y_test <- read.table("test/y_test.txt", header = FALSE)
subject_test <- read.table("test/subject_test.txt", header = FALSE)

X_train <- read.table("train/X_train.txt", header = FALSE)
y_train <- read.table("train/y_train.txt", header = FALSE)
subject_train <- read.table("train/subject_train.txt", header = FALSE)

subject_data <- rbind(subject_train, subject_test)
activity_data <- rbind(y_train, y_test)
features_data <- rbind(X_train, X_test)

colnames(subject_data) <- "Subject"
colnames(activity_data) <- "Activity"
colnames(features_data) <- t(features[2])

data <- cbind(subject_data, activity_data, features_data)

rm("activity_data")
rm("features", "features_data")
rm("subject_data", "subject_test", "subject_train")
rm("X_test", "X_train", "y_test", "y_train")

#Extract only the measurements on the mean and standard deviation for each measurement.

data_mean_STD_index <- grep(".*mean.*|.*std.*", names(data), ignore.case = TRUE)
data_mean_STD <- c(1, 2, data_mean_STD_index)
extract_data <- data[, data_mean_STD]

rm("data")
rm("data_mean_STD", "data_mean_STD_index")

#Use descriptive activity names to name the activities in the data set.

activity_labels <- read.table("activity_labels.txt", header = FALSE)
extract_data$Activity <- as.character(extract_data$Activity)
for (i in 1:6){
    extract_data$Activity[extract_data$Activity == i] <- as.character(activity_labels[i,2])
}
extract_data$Activity <- as.factor(extract_data$Activity)

rm("i", "activity_labels")

#Appropriately label the data set with descriptive variable names.

names(extract_data) <- gsub("^t", "Time", names(extract_data))
names(extract_data) <- gsub("Acc", "Accelerometer", names(extract_data))
names(extract_data) <- gsub("Gyro", "Gyroscope", names(extract_data))
names(extract_data) <- gsub("Mag", "Magnitude", names(extract_data))
names(extract_data) <- gsub("^f", "Frequency", names(extract_data))
names(extract_data) <- gsub("-mean()", "Mean", names(extract_data), ignore.case = TRUE)
names(extract_data) <- gsub("-std()", "STD", names(extract_data), ignore.case = TRUE)
names(extract_data) <- gsub("-freq()", "Frequency", names(extract_data), ignore.case = TRUE)
names(extract_data) <- gsub("angle", "Angle", names(extract_data))
names(extract_data) <- gsub("gravity", "Gravity", names(extract_data))

#From the data set in the previous step, create a second, independent
#tidy data set with the average of each variable for each activity and each subject.

extract_data$Subject <- as.factor(extract_data$Subject)

extract_data <- data.table(extract_data)

data_final_tidy <- aggregate(.~Subject + Activity, extract_data, mean)
data_final_tidy <- arrange(data_final_tidy, Subject, Activity)
write.table(data_final_tidy, file = "Dataset_Tidy.txt", row.names = FALSE)

rm("data_final_tidy", "extract_data")
