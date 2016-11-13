# Getting-and-Cleaning-Data-Course-Project
The repository Getting and Cleaning Data Course Project is part of the Data Science Specialization. It contains :

1. R script : run_analysis.R 
2. Code Book : describes the variables and the data that has been tidied. 

Data set : Human Activity Recognition Using Smartphone

Raw Data Source : 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Raw Data represents data collected from the accelerometers from the Samsung Galaxy S II smartphone. 

Number of Volunteers : 30  
Age bracket : 19 - 48 years
Activities performed : 
Walking, Walking upstairs, Walking Downstairs, Sitting, Standing, Laying

Dataset randomly partitioned into two sets :

1. Training data  : 70% of Volunteers
2. Test data 	  : 30% of Volunteers

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The R script, run_analysis.R does the following :

1. Download the dataset (Zip file) and Unzip contents if they don't already exist in the working directory.

2. Load both the Training and Test datasets into R.

3. Merge the Training and Test datasets.

4. Load the activity_labels and feature info into R

5. Extract only the measurements on the mean and standard deviation for each measurement. 

6. Converts activity and subject columns into factors

7. Renames labels with descriptive variable names

8. Creates a tidy dataset consisting of the average value of each variable for each subject and activity pair.

9. Second tidy dataset shown in the file tidydataset2.txt
