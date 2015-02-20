### The Data Set

This course project uses the "Human Activity Recognition Using Smartphones Dataset" (version 1.0) by [Jorge et al.](https://sites.google.com/site/smartlabunige/). The description from the website:

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

For each record in the data set, triaxial acceleration and estimated body acceleration, as well as triaxial angular velocity are provided. Furthermore, the data set contains names of the different variables and activities, and identifiers for the 30 subjects.


### The Variables

All variables listed below are split up into their X, Y and Z axial signals, and only their mean values ("mean()") and standard deviations ("std()") were extracted from the original data set.  
The final, tidy data set contains mean values of these extracted values, one per subject and activity.

#### Time Domain Signals

|------------- | -------------|
| tBodyAcc-XYZ      | body acceleration |
| tGravityAcc-XYZ   | gravity acceleration |
| tBodyAccJerk-XYZ  | body acceleration Jerk signals |
| tBodyGyro-XYZ     | body angular velocity |
| tBodyGyroJerk-XYZ | body angular velocity Jerk signals |
| tBodyAccMag       | body acceleration magnitude |
| tGravityAccMag    | gravity acceleration magnitude |
| tBodyAccJerkMag   | body acceleration Jerk signal magnitude |
| tBodyGyroMag      | body angular velocity magnitude |
| tBodyGyroJerkMag  | body angular velocity Jerk signal magnitude |

#### Fast Fourier Transformed Signals

------------- | -------------
fBodyAcc-XYZ | body acceleration  
fBodyAccJerk-XYZ | body acceleration Jerk signals  
fBodyGyro-XYZ | body angular velocity  
fBodyAccMag | body acceleration magnitude  
fBodyAccJerkMag| body acceleration Jerk signal magnitude  
fBodyGyroMag | body angular velocity magnitude  
fBodyGyroJerkMag | body angular velocity Jerk signal magnitude  

#### Subjects and Activities
The subjects are numbered from 1 to 30.

Activities are:

* walking
* walking upstairs
* walking downstairs
* sitting
* standing
* laying