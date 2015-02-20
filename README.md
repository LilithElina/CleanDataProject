### Introduction

This repository contains the course project required by the [Getting and Cleaning Data](https://www.coursera.org/course/getdata) course on coursera. The data used represent data collected from the accelerometers from the Samsung Galaxy S smartphone obtained from [this site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones ).  
The data and variables are described in the CodeBook.


### The Code
The script `run_analysis.R` will be able to run if the Samsung data folder is, unzipped, in the working directory.  
It will read in the test and training set data, including information on the test subjects, their activities, and the variable/feature definitions. The test and training set data is then combined to one `data.frame` containing all available data.

To reduce the data load, means and standard deviations of the different measurements are extracted. This is done by analysing the list of features and extracting the indices of all features containing either the term "mean()" or the term "std()". These indices are then used to filter the columns of the `data.frame` containing all data.

For readablilty, the numbers that represent different activities of the test subjects are replaced by the names of the activities.

Finally, a second data set is created that contains only average values for each subject at each activity.  
To obtain these values, the `data.frame` is split by subjects and activities, before the `mean()` function is applied to each column for each data subset. This leads to a transposition of the data, which is reverted with the `t()` (transpose) function. The row names, which now contain the subject ID and the activity, are split in two, to re-create the original "subject" and "activity" columns, before the data set is written to a .txt file.