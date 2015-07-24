#Getting and Cleaning Data - Course Project

##About this file

This file describes how the run_analysis.R script works, the data we are working on and results produced.

##Original Data

The data used, available at [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) represents data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the [site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) where the data was obtained.

Once downloaded and unzipped, you will obtain the following files :

*'README.txt'
*'features_info.txt': Shows information about the variables used on the feature vector.
*'features.txt': List of all features.
*'activity_labels.txt': Links the class labels with their activity name.
*'train/X_train.txt': Training set.
*'train/y_train.txt': Training labels.
*'test/X_test.txt': Test set.
*'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 
*'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

Files in the train/Inertial Signals/ and test/Inertial Signals/ are not used in this exercise.

##About the run_analysis.R script

This script processes part of the original data and generates a supertidy.txt file containing a new independent tidy data set with the average of each variable for each activity and each subject. The script follows the following 6 steps :

### Step 1: Merge the training and the test sets to create one data set.
In the original data set, data is spread into 2 different groups, training and test, themselves split into multiple files. We first merge the measurements contained in the X_train.txt file with the corresponding activity codes and corresponding subject identifiers for the training set. We reproduce this by merging the test data and finally concatenate both data frames to obtain all the measurements for all subjects and all activities.

### Step 2: Extracting only the measurements on the mean and standard deviation for each measurement.
The original data contains measurements for 561 features. We start by reading the entire list of features but only select the names containing the mean or std keywords. We also reject all the meanFreq type features since they are not measurements on the mean of each measurement but "Weighted average of the frequency components to obtain a mean frequency" according the original data manual.

Once we obtain a clean list of features, we subset our merged dataset according to this list and only keep the wanted features + the subject identifiers and the activity labels.

### Step 3: Use descriptive activity names to name the activities in the data set
This step aims to replace in the data set the activity identifiers by their explicit names. 

### Step 4: Appropriately label the data set with descriptive variable names
Before this step, in our data set, our features are labelled V1, V2 ... We simply reuse our features list from step 2, replace t by time, f by frequency, Acc by accelerometer, Gyro by Gyroscope, Mag by Magnitude, BodyBody by body and remove () to obtain descriptive variable names. We finally replace the original variable names by this clean list.

### Step 5: From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
We calculate the mean of each variable for each activity and each subject and finally reorder the data set by subject IDs and activity.

### Step 6: Generating a text file containing the final tidy data set from step 5
The generated file is supertidy.txt and will be saved in the /UCI HAR Dataset folder.


##About tidy Data

I believe our final data set is tidy and wide since we have one observation by row for one subject and one activity and each variable is a colomn. According to [Hadley Wickham's paper on tidy data](http://www.jstatsoft.org/v59/i10/paper), a data set where "each variable is a column, each observation is a row, and each type of observational unit is a table" can be called tidy.

##Usage

The run_analysis.R script does not handle downloading of the original data. You should do that manually, extract the zip and will obtain a /UCI HAR Dataset folder containing all data. run_analysis.R should be dropped in this /UCI HAR Dataset folder and it should be set as your work directory. You can then run the script with the following command :
...
source("run_analysis.R")
...

You will obtain a supertidy.txt file containing the final tidy data set in the /UCI HAR Dataset folder.

##Codebook

The associated codebook.md file lists all the variables and their definition.

##License of the original dataset:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.