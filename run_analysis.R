#run_analysis.R 
#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names. 
#5. From the data set in step 4, creates a second, independent tidy data set with 
#   the average of each variable for each activity and each subject.

library(dplyr)
library(reshape2)

#First we need to get our data into R
features <- read.table("./UCI HAR Dataset/features.txt")
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")

#test data
tX <- read.table("./UCI HAR Dataset/test/X_test.txt",sep="")
tY <- read.table("./UCI HAR Dataset/test/y_test.txt",sep="")
tSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt",sep="")
tY <- merge(tY,activities) #To better describe our activities with a string instead of integer
testDf <- data.frame(Subject=tSubject,Activity=tY$V2,tX)

#train data
trX <- read.table("./UCI HAR Dataset/train/X_train.txt",sep="")
trY <- read.table("./UCI HAR Dataset/train/y_train.txt",sep="")
trSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt",sep="")
trY <- merge(trY,activities) #To better describe our activities with a string instead of integer
trainDf <- data.frame(Subject=trSubject,Activity=trY$V2,trX)

#Merge training and test sets
df <- rbind(testDf,trainDf)
colnames(df) <- c("Subject","Activity",as.character(features$V2))

#Trim down to mean and std dev for each measurement along with Subject+Activity idenfitiers
dfTrim <- df[,c(1,2,grep("mean\\(\\)|std\\(\\)",colnames(df)))]

#Rename Columns to make a little more sense
colnames(dfTrim) <- lapply(colnames(dfTrim),FUN=function(trim){
        x <- gsub("-",".",trim,fixed=T)    
        x <- gsub("()","",x,fixed=T)
        x <- sub("BodyBody","Body",x) #typed twice in a few occasions
        x <- sub("tBody","Time.Body.",x)
        x <- sub("fBody","Frequency.Body.",x)
        x <- sub("tGravity","Time.Gravity.",x)
        x <- sub("fGravity","Frequency.Gravity.",x)
        x <- sub("Jerk",".Jerk",x)
        x <- sub("Mag",".Mag",x)
        return(x)
        }
    )

#Create a tidy data set with the average of each variable for each activity and each subject.
mdata <- melt(dfTrim,id=c("Subject","Activity")) #melt our data down to Subject+Activity level
by_subjAct <- mdata %>% group_by(Subject,Activity,variable) #group by our non-value variables
tidyDf <- by_subjAct %>% summarize_each(funs(mean),value) #summarize our data by mean value
write.table(tidyDf,file="tidy.txt") #writes our tidy data to a file for sharing