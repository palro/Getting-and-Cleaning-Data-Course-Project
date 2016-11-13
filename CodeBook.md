## This is a markdown file
Overview of Dataset downloaded from source:

'features_info.txt': Shows information about the variables used on the feature vector.

'features.txt': List of all features.

'activity_labels.txt': Links the class labels with their activity name.

'train/X_train.txt': Training set.

'train/y_train.txt': Training labels.

'test/X_test.txt': Test set.

'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.


Features :
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.

prefix 't' denotes time
prefix 'f' denotes frequency domain signals
'-XYZ'     denotes 3-axial signals in the X, Y and Z directions

Variables of interest in raw data taken over to tidy data set :

mean() : Mean value
std()  : Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean


activity_labels:

1 WALKING

2 WALKING_UPSTAIRS

3 WALKING_DOWNSTAIRS

4 SITTING
5 STANDING

6 LAYING

tidydataset2.txt is created by renaming variables.

Variables renamed by 
  - removing '()' , '-' 
  - expanding 't' to time
  - expanding 'f' to frequency
  - renaming 'mean' as Mean
  - renaming 'std' as Std 
