## 1. Merge the Training and Test Data Sets to create one data set

## Step1 : Download zip file from given link
if(!file.exists("./data")){dir.create("data")}
fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl1, destfile = "./data/accelerometer.zip")

## Step2 : Unzip contents
ZipContent <- unzip("./data/accelerometer.zip", exdir="./Assignment")

## Step3 : Load Train and Test data into R 
train_x <- read.table("./Assignment/UCI HAR Dataset/train/X_train.txt")
train_y <- read.table("./Assignment/UCI HAR Dataset/train/y_train.txt")
train_subject <- read.table("./Assignment/UCI HAR Dataset/train/subject_train.txt")
test_x <- read.table("./Assignment/UCI HAR Dataset/test/X_test.txt")
test_y <- read.table("./Assignment/UCI HAR Dataset/test/y_test.txt")
test_subject <- read.table("./Assignment/UCI HAR Dataset/test/subject_test.txt")

## Step 4 : Merge train data
train_data <- cbind(train_subject, train_y, train_x)

## Step 5 : Merge test data
test_data <- cbind(test_subject, test_y, test_x)

## Step 6 : Merge train and test data 
train_plus_test <- rbind(train_data, test_data)

## Step 7 : Extract only the measurements on the mean and standard deviation for each measurement.
## Step 7a : Load Features data into R and subset only column with Feature names
features <- read.table("./Assignment/UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
features_name <- features[,2]

## Step 7b : Extract index of rows with mean() or std ()
features_index_mean_stddev <- grep("mean\\(\\)|std\\(\\)", features_name)

## Step 7c : Create new dataframe with Subject, Activity , columns matching extracted Mean and Std Dev
data_mean_stddev <- train_plus_test[, c(1,2,features_index_mean_stddev + 2)]

## Give column names to the dataframe containing means and stddeviations
colnames(data_mean_stddev) <- c("subject", "activity", features_name[features_index_mean_stddev])

## Step 8 : Use descriptive activity names to name the activities in the data set
## Step 8a : Load the activity_labels data to R

activity_labels <- read.table("./Assignment/UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)
## Step 8b : Replace numeric identification values for activity with activity labels using Factor function

data_mean_stddev$activity <- factor(data_mean_stddev$activity, levels=activity_labels[,1], labels=activity_labels[,2])

## Step 9 : Appropriately labels the data set with descriptive variable names. 
## Use gsub to find pattern and replace t with time, f with frequency, remove all hyphens and brackets

names(data_mean_stddev) <- gsub("^t", "time", names(data_mean_stddev))
names(data_mean_stddev) <- gsub("^f", "frequency", names(data_mean_stddev))
names(data_mean_stddev) <- gsub("-mean", "Mean", names(data_mean_stddev))
names(data_mean_stddev) <- gsub("-std", "Std", names(data_mean_stddev))
names(data_mean_stddev) <- gsub("\\()-", "", names(data_mean_stddev))
names(data_mean_stddev) <- gsub("\\()", "", names(data_mean_stddev))

## Step 10: From the data set in step 9, create a second, independent tidy data set with the average of each variable for each activity and each subject.
## Use dplyr package to group by subject followed by activity
## Get the Mean of multiple columns using summarise_each function

library(dplyr)
tidydataset2 <- data_mean_stddev %>% 
     group_by(subject, activity) %>% 
         summarise_each(funs(mean))
write.table(tidydataset2, "tidydataset2.txt", row.names = FALSE)


                     


