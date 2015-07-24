##This script sould be saved in the unzipped /UCI HAR Dataset directory
##and this directory should be the work dir
##this script does not handle download of data files.

##You mind find more information on the process and on used date
##by reading the README.md and codebook.md associated files

## 1 - Merging the training and the test sets to create one data set.
#####################################################################

#loading the training data
train.data <- read.table("./train/X_train.txt")

#adding a column on the left with activity identifiers
activity.labels <- read.table("./train/y_train.txt")
train.data <- cbind(activity.labels,train.data)

#adding a column on the left with subject identifiers
subject.id <- read.table("./train/subject_train.txt")
train.data <- cbind(subject.id,train.data)

#renaming subject id and activity column
colnames(train.data)[1]<- "subject.id"
colnames(train.data)[2]<- "activity.id"

#loading the test data
test.data <- read.table("./test/X_test.txt")

#adding a column on the left with activity identifiers
activity.labels <- read.table("./test/y_test.txt")
test.data <- cbind(activity.labels,test.data)

#adding a column on the left with subject identifiers
subject.id <- read.table("./test/subject_test.txt")
test.data <- cbind(subject.id,test.data)

#renaming subject id and activity column
colnames(test.data)[1]<- "subject.id"
colnames(test.data)[2]<- "activity.id"

#We will not merge our 2 data frames since they do not overlap
#we will concatenate them.
merged.data <- rbind(train.data,test.data)


## 2 - Extract only the measurements on the mean and standard deviation for each measurement. 
##############################################################################################

#reading the list of all features
all.features <- read.table("features.txt")

#extracting only mean and std features from the list of features but excluding all the meanFreq
mean.std.features <- all.features[grep("mean\\(\\)|std\\(\\)",all.features$V2),]

#subsetting our merged data frame to only contain mean and std features while
#keeping our first 2 colums, subject and activity
mean.std.merged.data <- merged.data[,c(1,2,mean.std.features$V1+2)]


# 3 - Use descriptive activity names to name the activities in the data set
############################################################################

#reading activity labels
activity.list <- read.table("activity_labels.txt")

#replacing acitivity IDs by their corresponding labels in the merged data frame
mean.std.merged.data$activity.id <- activity.list[mean.std.merged.data$activity.id,2]

# 4 - Appropriately label the data set with descriptive variable names
#######################################################################
 
#converting features from factors to characters
mean.std.features[,2] <- as.character(mean.std.features[,2])

#cleaning the features names by replacing and deleting some charaters
descriptive.variable.names <- gsub("^t", "time", mean.std.features$V2)
descriptive.variable.names <- gsub("^f", "frequency", descriptive.variable.names)
descriptive.variable.names <- gsub("Acc", "Accelerometer", descriptive.variable.names)
descriptive.variable.names <- gsub("Gyro", "Gyroscope", descriptive.variable.names)
descriptive.variable.names <- gsub("Mag", "Magnitude", descriptive.variable.names)
descriptive.variable.names <- gsub("BodyBody", "Body", descriptive.variable.names)
descriptive.variable.names <- gsub("[()]", "", descriptive.variable.names)

#adding the name of our first 2 columns
final.descriptive.variable.names <- c("subject.id", "activity", descriptive.variable.names)

#replacing the column names in our tidy merged dataser
colnames(mean.std.merged.data) <- final.descriptive.variable.names


# 5 - From the data set in step 4, creates a second, independent tidy data set
#     with the average of each variable for each activity and each subject.
##############################################################################
tidy.data.mean <- aggregate(. ~ subject.id + activity , data = mean.std.merged.data, mean)
tidy.data.mean <- tidy.data.mean[order(tidy.data.mean$subject.id,tidy.data.mean$activity),]



# 6 - export dataset to a text file
#######################################################################
write.table(format(tidy.data.mean, scientific=T), "supertidydata.txt", row.names=F, col.names=T, quote=F)



