#Getting and Cleaning Data Project Code Book

This script requires the dplyr and data.table R Packages.

This data was taken from the Human Activity Recognition Using Smartphones Dataset Version 1.0 (www.smartlab.ws)

##Files

The dataset includes the following files:

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

##Descriptions

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

##Notes: 

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.
- For more information about this dataset contact: activityrecognition@smartlab.ws

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

##License

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
