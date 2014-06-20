doit <- function() {
  ## Required library
  require(reshape2)
    
## 1. Merges the training and the test sets to create one data set.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 

  ## Read common data from root directory
  # read column names from features.txt
  message("Reading features.txt")
  colNames <- read.csv("UCI HAR Dataset\\features.txt", sep="", header=FALSE)
#  # replace illegal symbols to underscores
#  colNames$V2 <- gsub("[[:punct:]]", "_", colNames$V2)

  # read activity file and set column names
  message("Reading activity_labels.txt")
  activityNames <- read.csv("UCI HAR Dataset\\activity_labels.txt", sep="", header=FALSE)
  colnames(activityNames) <- c("ActivityID", "ActivityName")
  
  ## Data manipulation with test folder
  # read X_test.txt file and assign as column names
  message("Reading X_test.txt")
  X_test <- read.csv("UCI HAR Dataset\\test\\X_test.txt", sep="", header=FALSE)
  colnames(X_test) <- colNames$V2

  # read subject file and set column name
  message("Reading subject_test.txt")
  testSubject <- read.csv("UCI HAR Dataset\\test\\subject_test.txt", sep="", header=FALSE)
  colnames(testSubject) <- c("SubjectID")
  
  # read y_test.txt file
  message("Reading y_test.txt")
  y_test <- read.csv("UCI HAR Dataset\\test\\y_test.txt", sep="", header=FALSE)
  colnames(y_test) <- c('ActivityID')
  
  # merge X_test and y_test (adding additional column)
  testDS <- cbind(y_test, X_test)
  
  # add SubjectID column to the data set
  testDS <- cbind(testSubject, testDS)

  # subsetting required columns (SubjectID, ActivityID, mean() and std())
  testDS <- testDS[, grep("SubjectID|ActivityID|mean\\(\\)|std\\(\\)",names(testDS))]

  # add ActivityName to testDS
  testDS <- merge(testDS, activityNames, by=c("ActivityID"), all.x=TRUE)

  ## Remove temp data to free memory
  rm(X_test)
  rm(y_test)
  rm(testSubject)
  
  ## Data manipulation with train folder
  # read X_train.txt file and assign as column names
  message("Reading X_train.txt")
  X_train <- read.csv("UCI HAR Dataset\\train\\X_train.txt", sep="", header=FALSE)
  colnames(X_train) <- colNames$V2
  
  # read subject file and set column name
  message("Reading subject_train.txt")
  trainSubject <- read.csv("UCI HAR Dataset\\train\\subject_train.txt", sep="", header=FALSE)
  colnames(trainSubject) <- c("SubjectID")
  
  # read y_train.txt file
  message("Reading y_train.txt")
  y_train <- read.csv("UCI HAR Dataset\\train\\y_train.txt", sep="", header=FALSE)
  colnames(y_train) <- c('ActivityID')
  
  # merge X_train and y_train (adding additional column)
  trainDS <- cbind(y_train, X_train)
  
  # add SubjectID column to the data set
  trainDS <- cbind(trainSubject, trainDS)
  
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  # subsetting required columns (SubjectID, ActivityID, mean() and std())
  trainDS <- trainDS[, grep("SubjectID|ActivityID|mean\\(\\)|std\\(\\)",names(trainDS))]

  # add ActivityName to trainDS
  trainDS <- merge(trainDS, activityNames, by=c("ActivityID"), all.x=TRUE)

  ## Remove temp data to free memory
  rm(X_train)
  rm(y_train)
  rm(trainSubject)
  rm(activityNames)
  
  ## Combine into one big data set
  finalDS <- rbind(testDS, trainDS)
  
  ## Remove testDS and trainDS
  rm(testDS)
  rm(trainDS)

  ## Melting data
  message("Melting data")
  meltDS <- melt(finalDS, variable.name="ColName", id=c("SubjectID","ActivityID","ActivityName"))

## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  message("Aggregating data")
  aggDS <- aggregate(data = meltDS, value ~ SubjectID + ActivityName + ColName, FUN=mean)
 
  # Remove meltDS
  rm(meltDS)

  ## Adding columns for tidy dataset
  # featureDomain contains "TIME" or "FREQUENCY"
  aggDS[substr(aggDS$ColName,1,1) == "t", "featureDomain"] <- "TIME"
  aggDS[substr(aggDS$ColName,1,1) == "f", "featureDomain"] <- "FREQUENCY"
  # featureAcceleration contains "BODY" or "GRAVITY"
  aggDS[grep("Body", aggDS$ColName), "featureAcceleration"] <- "BODY"
  aggDS[grep("Gravity", aggDS$ColName), "featureAcceleration"] <- "GRAVITY"
  # featureInstrument contains "ACCELEROMETER" or "GYROSCOPE"
  aggDS[grep("Acc", aggDS$ColName), "featureInstrument"] <- "ACCELEROMETER"
  aggDS[grep("Gyro", aggDS$ColName), "featureInstrument"] <- "GYROSCOPE"
  # featureJerk contains "JERK" or NA (Not applicable)
  aggDS[grep("Jerk", aggDS$ColName), "featureJerk"] <- "JERK"
  # featureMagnitude contains "MAGNITUDE" or NA (Not applicable)
  aggDS[grep("Mag", aggDS$ColName), "featureMagnitude"] <- "MAGNITUDE"
  # featureVariable contains "MEAN" or "STD"
  aggDS[grep("mean", aggDS$ColName), "featureVariable"] <- "MEAN"
  aggDS[grep("std", aggDS$ColName), "featureVariable"] <- "STD"
  # featureAxis contains "X", "Y" or "Z"
  aggDS[grep("-X", aggDS$ColName), "featureAxis"] <- "X"
  aggDS[grep("-Y", aggDS$ColName), "featureAxis"] <- "Y"
  aggDS[grep("-Z", aggDS$ColName), "featureAxis"] <- "Z"

  # No need for ActivityID column. Removing it.
  aggDS <- aggDS[,-c(3)]

  ## Writing AggDS to the output file
  message("Writinig aggregated dataset to AggDS.txt")
  write.table(aggDS, "AggDS.txt", quote=FALSE, sep=",", row.names=FALSE)

  # Done. Return aggDS
  message("Done")
  aggDS
}
