### Getting and Cleaning Data Course Project
# Course Project README

Solution consists of:

- Script file run_analisys.R
- [Code book](CodeBook.md) 
- This readme file
- Documentation for initial dataset: [Read me](README.txt) and [Features description](Features.txt)

##Script README
Script contains a set of functions, which solve different tasks for cleaning data from [Human Activity Recognition Using Smartphones Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

####download_dataset()
This function creates the folder for fataset (it is directory `data` in the work directory), download dataset archive (file `data.zip`) and extract it. It is a long process, so if folder created or archive downloaded and extracted, function may skip some steps. 

####read_handbook()
Function reads activity labels and feature labels and add it's to global environment in variables `activity_labels` and `feature_labels`. Clean feature labels:

- delete pairs of round brackets;
- replase open round brackets to symbol "_";
- delete close round brackets;
- replace commas and dash to dots.

####read_dataset()
Read train or test dataset. 

Parameters:

- **dir** (by default "train") - dataset type (train or test);
- **read_additional_data** (by default FALSE) - set to TRUE if you want to read additional data from folders "Inertial Signals". 

Train dataset extracted from files:

- 'train/y_train.txt': Training activity labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/X_train.txt': Training set of features, column names are taken from feature labels list. 

To test dataset file names are similar.

Function return a data frame. The first column is activity ID, the second column is subject ID, and then there are 561 features.
	
####get_merged_dataset()

Function for read data from train and test sets, put in one dataset, and remove activity IDs to activity names. This function takes a lot of time.

Parameters:

- **read_additional_data** (by default FALSE) - if TRUE, read all raw data, include Inertial Signals.
- **save_to_file** (by default FALSE) - save dataset to file.

####get_means_and_sd()

This fucntion extracts Means and Standard Derivations Data Set. It contains only the measurements on the mean and standard deviation for each measurement. 

Parameters:

- **full_data** (by default NULL) - you can pass to function full dataset, formed by function `get_merged_dataset()`, to save time if dataset already read. If parameter is empty, dataset wil be read by function `get_merged_dataset()`.

####get_tidy_dataset()

This fucntion creates a second, independent tidy data set with the average of each variable for each activity and each subject. You can use this function for redults of function `get_means_and_sd()` or of function `get_merged_dataset()`.

Parameters:

- **full_data** (by default NULL) - you can pass to function full dataset, or Means and Standard Derivations Data Set. If parameter is empty, dataset wil be read by function `get_means_and_sd()`.
- **save_to_file** (by default FALSE) - save created dataset to file `./data/tidy_dataset.txt`.

##Example

```
> source("run_analysis.R")
> tidy_data <- get_tidy_dataset(save_to_file = T)
Directory for data created.
Dataset arhive downloaded.
Dataset extracted.
Reading train dataset...
Reading test dataset...
Merging...
Done!
> dim(tidy_data)
[1] 180  68
```