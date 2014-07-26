#Code Book

This Code Book contains description of Data Dictionaties and cleaning data algorithm for two datasets:

- Means and Standard Derivations Data Set (contains the measurements on the mean and standard deviation for each measurement).
- Tidy Data Set (contains the average of each variable for each activity and each subject).

#### Notes:

- Data Sets based on [Human Activity Recognition Using Smartphones Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). Details description of initial dataset you can find [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
- Initial dataset contains features, which are normalized and bounded within [-1,1].

## Means and Standard Derivations Data Set Cleaning Alghorithm

This data set contains the measurements on the mean and standard deviation for each measurement.

1. Download initial dataset from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

1. Read activity labels list and feature labels list. Clean feature labels:
	- delete pairs of round brackets;
	- replase open round brackets to symbol "_";
	- delete close round brackets;
	- replace commas and dash to dots.

1. Read training dataset from files:
	- 'train/y_train.txt': Training activity labels.
	- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
	- 'train/X_train.txt': Training set of features, column names are taken from feature labels list.

1. Do the same with test dataset from files:
	- 'test/y_test.txt': Test activity labels.
	- 'test/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
	- 'test/X_test.txt': Test set.

1. Merge the training and the test sets to create one data set. Training rows are before test rows.

2. Replace column contains activity integer labels to activity string labels.

3. Select only columns of Activity Name, Subject ID and neans and standatd derivations for all neasurments (columns, which names contains substrings "mean", "std", "ID" and "name").

## Tidy Data Set Cleaning Alghorithm

Means and Standard Derivations Data Set use as a base dataset for this alghorithm.

For each pair "Activity - Subject" calculate means of features from Means and Standard Derivations Data Set. 

## Data Dictionary


**ActivityName** - Activity Name.

Valid values:

- 1 WALKING
- 2 WALKING_UPSTAIRS
- 3 WALKING_DOWNSTAIRS
- 4 SITTING
- 5 STANDING
- 6 LAYING

**Subject_ID** - identifies the subject who performed the activity.

Its range is from 1 to 30.

#### Note:

- For Means and Standard Derivations Data Set text features contains observations, for Tidy Data Set - average of observations for each pair "Activity - Subject".
- Jerk signals. In initial data set the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. 

**tBodyAcc.mean.X** - mean of body acceleration signal for axis X

**tBodyAcc.mean.Y** - mean of body acceleration signal for axis Y

**tBodyAcc.mean.Z** - mean of body acceleration signal for axis Z

**tBodyAcc.std.X** - standard derivation of body acceleration signal for axis X

**tBodyAcc.std.Y** - standard derivation of body acceleration signal for axis Y

**tBodyAcc.std.Z** - standard derivation of body acceleration signal for axis Z

**tGravityAcc.mean.X** - mean of gravity acceleration signal for axis X

**tGravityAcc.mean.Y** - mean of gravity acceleration signal for axis Y

**tGravityAcc.mean.Z** - mean of gravity acceleration signal for axis Z

**tGravityAcc.std.X** - standard derivation of gravity acceleration signal for axis X

**tGravityAcc.std.Y** - standard derivation of gravity acceleration signal for axis Y

**tGravityAcc.std.Z** - standard derivation of gravity acceleration signal for axis Z

**tBodyAccJerk.mean.X** - mean of body acceleration Jerk signal for axis X

**tBodyAccJerk.mean.Y** - mean of body acceleration Jerk signal for axis Y

**tBodyAccJerk.mean.Z** - mean of body acceleration Jerk signal for axis Z

**tBodyAccJerk.std.X** - standard derivation of body acceleration Jerk signal for axis X

**tBodyAccJerk.std.Y** - standard derivation of body acceleration Jerk signal for axis Y

**tBodyAccJerk.std.Z** - standard derivation of body acceleration Jerk signal for axis Z

**tBodyGyro.mean.X** - mean of body gyroscope signal for axis X

**tBodyGyro.mean.Y** - mean of body gyroscope signal for axis Y 

**tBodyGyro.mean.Z** - mean of body gyroscope signal for axis Z

**tBodyGyro.std.X** - standard derivation of body gyroscope signal for axis X

**tBodyGyro.std.Y** - standard derivation of body gyroscope signal for axis Y

**tBodyGyro.std.Z** - standard derivation of body gyroscope signal for axis Z

**tBodyGyroJerk.mean.X** - mean of body gyroscope Jerk signal for axis X

**tBodyGyroJerk.mean.Y** - mean of body gyroscope Jerk signal for axis Y

**tBodyGyroJerk.mean.Z** - mean of body gyroscope Jerk signal for axis Z

**tBodyGyroJerk.std.X** - standard derivation of body gyroscope Jerk signal for axis X

**tBodyGyroJerk.std.Y** - standard derivation of body gyroscope Jerk signal for axis Y

**tBodyGyroJerk.std.Z** - standard derivation of body gyroscope Jerk signal for axis Z

**tBodyAccMag.mean** - mean of magnitude of body acceleration signal

**tBodyAccMag.std** - standard derivation of magnitude of body acceleration signal

**tGravityAccMag.mean** - mean of magnitude of gravity acceleration signal 

**tGravityAccMag.std** - standard derivation of magnitude of gravity acceleration signal 

**tBodyAccJerkMag.mean** - mean of magnitude of body acceleration Jerk signal

**tBodyAccJerkMag.std** - standard derivation of magnitude of body acceleration Jerk signal

**tBodyGyroMag.mean** - mean of magnitude of body gyroscope signal

**tBodyGyroMag.std** - standard derivation of magnitude of body gyroscope signal

**tBodyGyroJerkMag.mean** - mean of magnitude of body gyroscope Jerk signal

**tBodyGyroJerkMag.std** - standard derivation of magnitude of body gyroscope Jerk signal

**fBodyAcc.mean.X** - mean of Fast Fourier Transform of body acceleration signal for axis X

**fBodyAcc.mean.Y** - mean of Fast Fourier Transform of body acceleration signal for axis Y

**fBodyAcc.mean.Z** - mean of Fast Fourier Transform of body acceleration signal for axis Z

**fBodyAcc.std.X** - standard derivation of Fast Fourier Transform of body acceleration signal for axis X

**fBodyAcc.std.Y** - standard derivation of Fast Fourier Transform of body acceleration signal for axis Y

**fBodyAcc.std.Z** - standard derivation of Fast Fourier Transform of body acceleration signal for axis Z

**fBodyAccJerk.mean.X** - mean of Fast Fourier Transform of body acceleration Jerk signal for axis X

**fBodyAccJerk.mean.Y** - mean of Fast Fourier Transform of body acceleration Jerk signal for axis Y

**fBodyAccJerk.mean.Z** - mean of Fast Fourier Transform of body acceleration Jerk signal for axis Z

**fBodyAccJerk.std.X** - standard derivation of Fast Fourier Transform of body acceleration Jerk signal for axis X

**fBodyAccJerk.std.Y** - standard derivation of Fast Fourier Transform of body acceleration Jerk signal for axis Y

**fBodyAccJerk.std.Z** - standard derivation of Fast Fourier Transform of body acceleration Jerk signal for axis Z

**fBodyGyro.mean.X**- mean of Fast Fourier Transform of body gyroscope signal for axis X

**fBodyGyro.mean.Y** - mean of Fast Fourier Transform of body gyroscope signal for axis Y

**fBodyGyro.mean.Z** - mean of  Fast Fourier Transform of body gyroscope signal for axis Z

**fBodyGyro.std.X** - standard derivation of Fast Fourier Transform of body gyroscope signal for axis X

**fBodyGyro.std.Y** - standard derivation of Fast Fourier Transform of body gyroscope signal for axis Y

**fBodyGyro.std.Z** - standard derivation of Fast Fourier Transform of body gyroscope signal for axis Z

**fBodyAccMag.mean** - mean of Fast Fourier Transform of magnitude of body acceleration signal

**fBodyAccMag.std** - standard derivation of Fast Fourier Transform of magnitude of body acceleration signal

**fBodyBodyAccJerkMag.mean**- mean of Fast Fourier Transform of magnitude of body Jerk acceleration signal 

**fBodyBodyAccJerkMag.std** - standard derivation of Fast Fourier Transform of magnitude of body acceleration Jerk signal

**fBodyBodyGyroMag.mean** - mean of Fast Fourier Transform of magnitude of body gyroscope signal

**fBodyBodyGyroMag.std** - standard derivation of Fast Fourier Transform of magnitude of body gyroscope signal

**fBodyBodyGyroJerkMag.mean** - mean of Fast Fourier Transform of magnitude of body gyroscope Jerk signal

**fBodyBodyGyroJerkMag.std**- standard derivation of Fast Fourier Transform of magnitude of body gyroscope Jerk signal
