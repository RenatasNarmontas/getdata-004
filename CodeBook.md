CODEBOOK
========
Code book describes the variables, the data, and any transformations or performed work to clean up the data


Tidy dataset
------------
Item | Description
-----|------------
SubjectID | The subject who performed the activity. There is 30 volunteers.
ActivityName | Performed activity. Possible values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING
value | Mean value
featureDomain | Time domain signals or frequency domain signals. Possible values: TIME or FREQUENCY
featureAcceleration | Acceleration signals. Possible values: BODY or GRAVITY
featureInstrument | Measuring instrument. Possible values: ACCELEROMETER or GYROSCOPE
featureJerk | Jerk signals: Possible values: JERK or NA
featureMagnitude | Magnitude. Possible values: MAGNITUDE or NA
featureVariable | Variable. Possible values: MEAN or STD
featureAxis | Axis. Possible values: X, Y, Z or NA

All possible combinations of signals are described below.

Data structure
--------------
```
> str(aggDS)
```
```
'data.frame':	11880 obs. of  10 variables:
 $ SubjectID          : int  1 2 3 4 5 6 7 8 9 10 ...
 $ ActivityName       : Factor w/ 6 levels "LAYING","SITTING",..: 1 1 1 1 1 1 1 1 1 1 ... 
 $ value              : num  0.222 0.281 0.276 0.264 0.278 ...
 $ featureDomain      : chr  "TIME" "TIME" "TIME" "TIME" ...
 $ featureAcceleration: chr  "BODY" "BODY" "BODY" "BODY" ...
 $ featureInstrument  : chr  "ACCELEROMETER" "ACCELEROMETER" "ACCELEROMETER" "ACCELEROMETER" ...
 $ featureJerk        : chr  NA NA NA NA ...
 $ featureMagnitude   : chr  NA NA NA NA ...
 $ featureVariable    : chr  "MEAN" "MEAN" "MEAN" "MEAN" ...
 $ featureAxis        : chr  NA NA NA NA ...
```


Data sample
------------
```
> aggDS[11848:11853, ]
```
```
11848        28 WALKING_DOWNSTAIRS -0.46472224     FREQUENCY                BODY         GYROSCOPE        JERK        MAGNITUDE             STD        <NA>
11849        29 WALKING_DOWNSTAIRS -0.62667598     FREQUENCY                BODY         GYROSCOPE        JERK        MAGNITUDE             STD        <NA>
11850        30 WALKING_DOWNSTAIRS -0.64550394     FREQUENCY                BODY         GYROSCOPE        JERK        MAGNITUDE             STD        <NA>
11851         1   WALKING_UPSTAIRS -0.69393052     FREQUENCY                BODY         GYROSCOPE        JERK        MAGNITUDE             STD        <NA>
11852         2   WALKING_UPSTAIRS -0.62182020     FREQUENCY                BODY         GYROSCOPE        JERK        MAGNITUDE             STD        <NA>
11853         3   WALKING_UPSTAIRS -0.74003344     FREQUENCY                BODY         GYROSCOPE        JERK        MAGNITUDE             STD        <NA>
```

All possible combinations of signals
------------------------------------
```
> unique(aggDS[,c("featureDomain", "featureAcceleration", "featureInstrument", "featureJerk", "featureMagnitude", "featureVariable", "featureAxis")])
```
featureDomain|featureAcceleration|featureInstrument|featureJerk|featureMagnitude|featureVariable|featureAxis
-------------|-------------------|-----------------|-----------|----------------|---------------|-----------
TIME|BODY|ACCELEROMETER|<NA>|<NA>|MEAN|X
TIME|BODY|ACCELEROMETER|<NA>|<NA>|MEAN|Y
TIME|BODY|ACCELEROMETER|<NA>|<NA>|MEAN|Z
TIME|BODY|ACCELEROMETER|<NA>|<NA>|STD|X
TIME|BODY|ACCELEROMETER|<NA>|<NA>|STD|Y
TIME|BODY|ACCELEROMETER|<NA>|<NA>|STD|Z
TIME|GRAVITY|ACCELEROMETER|<NA>|<NA>|MEAN|X
TIME|GRAVITY|ACCELEROMETER|<NA>|<NA>|MEAN|Y
TIME|GRAVITY|ACCELEROMETER|<NA>|<NA>|MEAN|Z
TIME|GRAVITY|ACCELEROMETER|<NA>|<NA>|STD|X
TIME|GRAVITY|ACCELEROMETER|<NA>|<NA>|STD|Y
TIME|GRAVITY|ACCELEROMETER|<NA>|<NA>|STD|Z
TIME|BODY|ACCELEROMETER|JERK|<NA>|MEAN|X
TIME|BODY|ACCELEROMETER|JERK|<NA>|MEAN|Y
TIME|BODY|ACCELEROMETER|JERK|<NA>|MEAN|Z
TIME|BODY|ACCELEROMETER|JERK|<NA>|STD|X
TIME|BODY|ACCELEROMETER|JERK|<NA>|STD|Y
TIME|BODY|ACCELEROMETER|JERK|<NA>|STD|Z
TIME|BODY|GYROSCOPE|<NA>|<NA>|MEAN|X
TIME|BODY|GYROSCOPE|<NA>|<NA>|MEAN|Y
TIME|BODY|GYROSCOPE|<NA>|<NA>|MEAN|Z
TIME|BODY|GYROSCOPE|<NA>|<NA>|STD|X
TIME|BODY|GYROSCOPE|<NA>|<NA>|STD|Y
TIME|BODY|GYROSCOPE|<NA>|<NA>|STD|Z
TIME|BODY|GYROSCOPE|JERK|<NA>|MEAN|X
TIME|BODY|GYROSCOPE|JERK|<NA>|MEAN|Y
TIME|BODY|GYROSCOPE|JERK|<NA>|MEAN|Z
TIME|BODY|GYROSCOPE|JERK|<NA>|STD|X
TIME|BODY|GYROSCOPE|JERK|<NA>|STD|Y
TIME|BODY|GYROSCOPE|JERK|<NA>|STD|Z
TIME|BODY|ACCELEROMETER|<NA>|MAGNITUDE|MEAN|<NA>
TIME|BODY|ACCELEROMETER|<NA>|MAGNITUDE|STD|<NA>
TIME|GRAVITY|ACCELEROMETER|<NA>|MAGNITUDE|MEAN|<NA>
TIME|GRAVITY|ACCELEROMETER|<NA>|MAGNITUDE|STD|<NA>
TIME|BODY|ACCELEROMETER|JERK|MAGNITUDE|MEAN|<NA>
TIME|BODY|ACCELEROMETER|JERK|MAGNITUDE|STD|<NA>
TIME|BODY|GYROSCOPE|<NA>|MAGNITUDE|MEAN|<NA>
TIME|BODY|GYROSCOPE|<NA>|MAGNITUDE|STD|<NA>
TIME|BODY|GYROSCOPE|JERK|MAGNITUDE|MEAN|<NA>
TIME|BODY|GYROSCOPE|JERK|MAGNITUDE|STD|<NA>
FREQUENCY|BODY|ACCELEROMETER|<NA>|<NA>|MEAN|X
FREQUENCY|BODY|ACCELEROMETER|<NA>|<NA>|MEAN|Y
FREQUENCY|BODY|ACCELEROMETER|<NA>|<NA>|MEAN|Z
FREQUENCY|BODY|ACCELEROMETER|<NA>|<NA>|STD|X
FREQUENCY|BODY|ACCELEROMETER|<NA>|<NA>|STD|Y
FREQUENCY|BODY|ACCELEROMETER|<NA>|<NA>|STD|Z
FREQUENCY|BODY|ACCELEROMETER|JERK|<NA>|MEAN|X
FREQUENCY|BODY|ACCELEROMETER|JERK|<NA>|MEAN|Y
FREQUENCY|BODY|ACCELEROMETER|JERK|<NA>|MEAN|Z
FREQUENCY|BODY|ACCELEROMETER|JERK|<NA>|STD|X
FREQUENCY|BODY|ACCELEROMETER|JERK|<NA>|STD|Y
FREQUENCY|BODY|ACCELEROMETER|JERK|<NA>|STD|Z
FREQUENCY|BODY|GYROSCOPE|<NA>|<NA>|MEAN|X
FREQUENCY|BODY|GYROSCOPE|<NA>|<NA>|MEAN|Y
FREQUENCY|BODY|GYROSCOPE|<NA>|<NA>|MEAN|Z
FREQUENCY|BODY|GYROSCOPE|<NA>|<NA>|STD|X
FREQUENCY|BODY|GYROSCOPE|<NA>|<NA>|STD|Y
FREQUENCY|BODY|GYROSCOPE|<NA>|<NA>|STD|Z
FREQUENCY|BODY|ACCELEROMETER|<NA>|MAGNITUDE|MEAN|<NA>
FREQUENCY|BODY|ACCELEROMETER|<NA>|MAGNITUDE|STD|<NA>
FREQUENCY|BODY|ACCELEROMETER|JERK|MAGNITUDE|MEAN|<NA>
FREQUENCY|BODY|ACCELEROMETER|JERK|MAGNITUDE|STD|<NA>
FREQUENCY|BODY|GYROSCOPE|<NA>|MAGNITUDE|MEAN|<NA>
FREQUENCY|BODY|GYROSCOPE|<NA>|MAGNITUDE|STD|<NA>
FREQUENCY|BODY|GYROSCOPE|JERK|MAGNITUDE|MEAN|<NA>
FREQUENCY|BODY|GYROSCOPE|JERK|MAGNITUDE|STD|<NA>

Required packages
-----------------
```
reshape2
```


Transformations
---------------

Data is transformed from untidy raw data to tidy aggregated data.
First read the raw data files. Then select only the measurements on the mean and standard deviation for each measurement. And finally create a second, independent tidy data set with the average of each variable for each activity and each subject.
Commands and output are presented below.
```
> source('run_analysis.R')
> aggDS <- doit()
```
```
Loading required package: reshape2
Reading features.txt
Reading activity_labels.txt
Reading X_test.txt
Reading subject_test.txt
Reading y_test.txt
Reading X_train.txt
Reading subject_train.txt
Reading y_train.txt
Melting data
Aggregating data
Writinig aggregated dataset to AggDS.txt
Done
```

Files
-----
Aggregated tidy dataset is written to the file AggDS.txt using command
```
write.table(aggDS, "AggDS.txt", quote=FALSE, sep=",", row.names=FALSE)
```
It's possible to read that file back with a command:
```
t <- read.table("aggDS.txt", sep=",", header=TRUE)
head(t)
  SubjectID ActivityName     value featureDomain featureAcceleration featureInstrument featureJerk featureMagnitude featureVariable featureAxis
1         1       LAYING 0.2215982          TIME                BODY     ACCELEROMETER        <NA>             <NA>            MEAN          <NA>
2         2       LAYING 0.2813734          TIME                BODY     ACCELEROMETER        <NA>             <NA>            MEAN          <NA>
3         3       LAYING 0.2755169          TIME                BODY     ACCELEROMETER        <NA>             <NA>            MEAN          <NA>
4         4       LAYING 0.2635592          TIME                BODY     ACCELEROMETER        <NA>             <NA>            MEAN          <NA>
5         5       LAYING 0.2783343          TIME                BODY     ACCELEROMETER        <NA>             <NA>            MEAN          <NA>
6         6       LAYING 0.2486565          TIME                BODY     ACCELEROMETER        <NA>             <NA>            MEAN          <NA>
```


