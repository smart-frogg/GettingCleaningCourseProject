library(stringr)
library(plyr)
library(reshape2)

# function for dataset download and extract
download_dataset <- function()
{
  if(!file.exists("./data"))
  {
    print("Create directory for data...")
    dir.create("./data");
  }
  print("Directory for data created.")
  if(!file.exists("./data/data.zip"))
  {
    print("Download dataset archive...")
    file.url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip";
    download.file(file.url,"./data/data.zip");
  }
  print("Dataset arhive downloaded.")
  if(!file.exists("./data/UCI HAR Dataset"))
  {
    print("Extract dataset...")
    unzip("./data/data.zip",exdir = "./data" );
  }  
  print("Dataset extracted.")
}

# read activity labels and feature labels
read_handbook <- function()
{
  activity_labels <<- read.table(
    "./data/UCI HAR Dataset/activity_labels.txt", 
    colClasses = c("integer","character"), 
    col.names = c("ID","activity_name"))
  feature_labels <<- read.table(
    "./data/UCI HAR Dataset/features.txt", 
    colClasses = c("integer","character"), 
    col.names = c("ID","feature_name"))  
  names <- feature_labels$feature_name
  names <- str_replace_all(names, "\\(\\)", "")
  names <- str_replace_all(names, "\\(", "_")
  names <- str_replace_all(names, "\\)", "")
  names <- str_replace_all(names, "[,-]", ".")
  feature_labels$feature_name <<- names
}

# Read train or test dataset
read_dataset <- function(dir = "train", read_additional_data = FALSE)
{
  full_dir_name <- paste("./data/UCI HAR Dataset/",dir,"/",sep="")
  file_name = paste(full_dir_name,"subject_",dir,".txt",sep="")
  subjects <- read.table(
    file_name,
    colClasses = c("integer"), 
    col.names = c("Subject_ID"),
    row.names=NULL)
  
  file_name = paste(full_dir_name,"y_",dir,".txt",sep="")
  activities <- read.table(
    file_name,
    colClasses = c("integer"), 
    col.names = c("Activity_ID"),
    row.names=NULL)
  
  file_name = paste(full_dir_name,"X_",dir,".txt",sep="")
  data <- read.table(
    file_name,
    col.names = feature_labels$feature_name,
    check.names = FALSE,
    row.names=NULL)  
  
  data <- cbind (activities$Activity_ID, subjects$Subject_ID, data)
  data_names <- names(data);
  data_names[1] <- "Activity_ID";
  data_names[2] <- "Subject_ID";
  names(data) <- data_names
  
  if (read_additional_data)
  {
    files <- c("total_acc_x", "total_acc_y", "total_acc_z",
              "body_acc_x",  "body_acc_y",  "body_acc_z",
              "body_gyro_x", "body_gyro_y", "body_gyro_z")
    for (file in files)
    {
      file_name = paste(full_dir_name,"Inertial Signals/",file,"_",dir,".txt",sep="")
      data_adds <- read.table(
        file_name,
        col.names = sapply(1:128,function(elt) { paste(file,"_",elt,sep="") }),
        row.names=NULL)
      data <- cbind (data,data_adds)
    }
  }
    
  return (data)
}


# function for read data from train and test set and put in one dataset 
# and add activity names
get_merged_dataset <- function(read_additional_data = FALSE, save_to_file = FALSE)
{
  # If dataset is not in work directory,
  # we download and extract it.
  download_dataset()
  
  # read activity labels and feature labels
  read_handbook()
  
  # read and merge datasets
  print("Reading train dataset...")
  train_data <- read_dataset("train", read_additional_data)
  
  #return(train_data)
  print("Reading test dataset...")
  test_data <- read_dataset("test", read_additional_data)
  
  print("Merging...")
  full_data <- rbind(train_data,test_data)

  # create activity factor
  activityName <- factor(
    full_data$Activity_ID, 
    activity_labels$ID, 
    labels = activity_labels$activity_name)
  
  names <- names(full_data)
  names[1] <- "ActivityName"
  full_data$Activity_ID <- NULL
  full_data <- cbind(activityName,full_data)
  names(full_data) <- names
  if (save_to_file)
  {
    write.table(full_data, file = "./data/full_dataset.txt");
  }
  print("Done!")
  return (full_data)
}

# Extracts only the measurements on the mean and standard deviation for each measurement. 
get_means_and_sd <- function (full_data = NULL)
{
  if(is.null(full_data))
  {
    full_data <- get_merged_dataset();
  }
  column_names <- names(full_data);

  means_and_sd_data <- grep("(mean\\.)|(mean$)|(std)|(ID)|(Name)", column_names)
  return (full_data[,means_and_sd_data])
}

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
get_tidy_dataset <- function (full_data = NULL, save_to_file = FALSE)
{
  if(is.null(full_data))
  { 
    full_data <- get_means_and_sd();
  }
  vars_names <- intersect(names(full_data),feature_labels$feature_name)
  melt_data <- melt(
    full_data,
    ID = c("ActivityName","Subject_ID"),
    measure.vars = vars_names)
  tidy_data <-dcast(
    melt_data,
    ActivityName + Subject_ID ~ variable,
    mean
    )
  if (save_to_file)
  {
    write.table(tidy_data, file = "./data/tidy_dataset.txt");
  }
  return (tidy_data)
}