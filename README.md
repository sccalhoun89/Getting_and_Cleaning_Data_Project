#Getting_and_Cleaning_Data_Project

##Merge the training and test sets to create one data set.

- Data merging of the training and test sets was used to create one data set.
- X_train and X_test are features data and bound into one data set.
- y_train and y_test are activity data and bound into one data set.
- Subject_train and subject_test are subject data and bound into one data set.
- Column names for Subject and Activity were added at this point and the three data sets were combined by column to form the one data set.

##Extract only the measurements on the mean and standard deviation for each measurement.

- grep() is used to create the index of columns having only Mean or Standard Deviation measurements.
- A new data set is created according to the indexed data.

##Use descriptive activity names to name the activities in the data set.

- Activity labels are derived from the activity_labels.txt file and assigned to the appropriate row in the data set.

##Appropriately label the data set with descriptive variable names.

Labels are assigned to the appropriate column based on the following:

- t -> Time
- Acc -> Accelerometer
- Gyro -> Gyroscope
- Mag -> Magnitude
- f and freq -> Frequency
- mean -> Mean
- std -> STD (Abbreviation for Standard Deviation)
- angle -> Angle
- gravity -> Gravity

##Result

- An independent tidy data set with the average of each variable for each activity and each subject.
- Created adn output in the form of a .txt file, "Dataset_Tidy"
