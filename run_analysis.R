#run_analysis.R 
#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names. 
#5. From the data set in step 4, creates a second, independent tidy data set with 
#   the average of each variable for each activity and each subject.

library(dplyr)

#First we need to get our data into R
features <- read.table("./UCI HAR Dataset/features.txt")
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")

#test data
tX <- read.table("./UCI HAR Dataset/test/X_test.txt",sep="")
tY <- read.table("./UCI HAR Dataset/test/y_test.txt",sep="")
tSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt",sep="")
tY <- merge(tY,activities)
testDf <- data.frame(Subject=tSubject,Activity=tY$V2,tX)

#train data
trX <- read.table("./UCI HAR Dataset/train/X_train.txt",sep="")
trY <- read.table("./UCI HAR Dataset/train/y_train.txt",sep="")
trSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt",sep="")
trY <- merge(trY,activities)
trainDf <- data.frame(Subject=trSubject,Activity=trY$V2,trX)

#Merge training and test sets
df <- rbind(testDf,trainDf)
colnames(df) <- c("Subject","Activity",as.character(features$V2))
