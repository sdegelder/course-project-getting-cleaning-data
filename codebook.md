# Codebook : Getting and Cleaning Data - Course Project

## Variables list

- subject.id : identifier of the tested subject, between 1 and 30

- activity : type of activity done by the subject and generating data (6 possible values : WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

The 68 following variables are features read or calculated from the measuring device, a smartphone (Samsung Galaxy S II). They are explained by group bellow.

- timeBodyAccelerometer-mean-X

- timeBodyAccelerometer-mean-Y

- timeBodyAccelerometer-mean-Z

- timeBodyAccelerometer-std-X

- timeBodyAccelerometer-std-Y

- timeBodyAccelerometer-std-Z

- timeGravityAccelerometer-mean-X

- timeGravityAccelerometer-mean-Y

- timeGravityAccelerometer-mean-Z

- timeGravityAccelerometer-std-X

- timeGravityAccelerometer-std-Y

- timeGravityAccelerometer-std-Z

- timeBodyAccelerometerJerk-mean-X

- timeBodyAccelerometerJerk-mean-Y

- timeBodyAccelerometerJerk-mean-Z

- timeBodyAccelerometerJerk-std-X

- timeBodyAccelerometerJerk-std-Y

- timeBodyAccelerometerJerk-std-Z

- timeBodyGyroscope-mean-X

- timeBodyGyroscope-mean-Y

- timeBodyGyroscope-mean-Z

- timeBodyGyroscope-std-X

- timeBodyGyroscope-std-Y

- timeBodyGyroscope-std-Z

- timeBodyGyroscopeJerk-mean-X

- timeBodyGyroscopeJerk-mean-Y

- timeBodyGyroscopeJerk-mean-Z

- timeBodyGyroscopeJerk-std-X

- timeBodyGyroscopeJerk-std-Y

- timeBodyGyroscopeJerk-std-Z

- timeBodyAccelerometerMagnitude-mean

- timeBodyAccelerometerMagnitude-std

- timeGravityAccelerometerMagnitude-mean

- timeGravityAccelerometerMagnitude-std

- timeBodyAccelerometerJerkMagnitude-mean

- timeBodyAccelerometerJerkMagnitude-std

- timeBodyGyroscopeMagnitude-mean

- timeBodyGyroscopeMagnitude-std

- timeBodyGyroscopeJerkMagnitude-mean

- timeBodyGyroscopeJerkMagnitude-std

- frequencyBodyAccelerometer-mean-X

- frequencyBodyAccelerometer-mean-Y

- frequencyBodyAccelerometer-mean-Z

- frequencyBodyAccelerometer-std-X

- frequencyBodyAccelerometer-std-Y

- frequencyBodyAccelerometer-std-Z

- frequencyBodyAccelerometerJerk-mean-X

- frequencyBodyAccelerometerJerk-mean-Y

- frequencyBodyAccelerometerJerk-mean-Z

- frequencyBodyAccelerometerJerk-std-X

- frequencyBodyAccelerometerJerk-std-Y

- frequencyBodyAccelerometerJerk-std-Z

- frequencyBodyGyroscope-mean-X

- frequencyBodyGyroscope-mean-Y

- frequencyBodyGyroscope-mean-Z

- frequencyBodyGyroscope-std-X

- frequencyBodyGyroscope-std-Y

- frequencyBodyGyroscope-std-Z

- frequencyBodyAccelerometerMagnitude-mean

- frequencyBodyAccelerometerMagnitude-std

- frequencyBodyAccelerometerJerkMagnitude-mean

- frequencyBodyAccelerometerJerkMagnitude-std

- frequencyBodyGyroscopeMagnitude-mean

- frequencyBodyGyroscopeMagnitude-std

- frequencyBodyGyroscopeJerkMagnitude-mean

- frequencyBodyGyroscopeJerkMagnitude-std

##Features explanation

The features selected for this data set come from the accelerometer and gyroscope 3-axial raw signals timeAccelerometer-XYZ and timeGyroscope-XYZ. These time domain signals (prefix 'time' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (timeBodyAccelerometer-XYZ and timeGravityAccelerometer-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeBodyAccelerometerJerk-XYZ and timeBodyGyroscopeJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timeBodyAcccelerometerMagnitude, timeGravityAccelerometerMagnitude, timeBodyAccelerometerJerkMagnitude, timeBodyGyroscopeMagnitude, timeBodyGyroscopeJerkMagnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequencyBodyAccelerometer-XYZ, frequencyBodyAccelerometerJerk-XYZ, frequencyBodyGyroscope-XYZ, frequencyBodyAccelerometerJerkMag, frequencyBodyGyroscopeMagnitude, frequencyBodyGyroscopeJerkMagnitude. 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals are: 
- mean(): Mean value
- std(): Standard deviation


## Notes: 

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

##Transformations

Original features values are transformed during the execution of the run_analysis.R script : the result is the average of each feature for each activity and each subject.

For more information about this dataset contact: activityrecognition@smartlab.ws

## License:

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.