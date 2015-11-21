# getdata-034-proj

The purpose of this project is to take a messy input of Samsung Wearable data and process it into a data set that follows "tidy data" standards.

run_analysis.R is the script that does all of the work. The pre-requisite for this script to work is to unzip the source data into your working directory. Data can be found at this address: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip or by cloning this github repository. Further information about this source data can be found within the readme provided or the following website: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The overall components the script implements are the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Reading the Data ##
`read.table` function calls are used to load the various text files included in the data set that will be combined. The data comes in two forms: referential and transactional. 

Reference data is given for understanding the column names of the test and training data in features.txt and translation from integers to text for activities performed. Properly applying this reference data to the transactional data is key in having the correct data.

Transactional Data is split between test and training data which needs to be combined. Within these categories are `x_test.txt`, `y_test.txt`, and `subject_test.txt` (with test replaced with train for training data). More granular lower level data for the `x_train.txt` and `x_test.txt` data sets can be found within the Inertial Signals subfolder. This data was not used in this script's processing but is available for further investigation if so desired.

## Combining the Data into one data set and applying reference data ##

After loading the data into R transactional data was merged with Activity reference data and combined into a data frame for each category. Each of these data frames are combined with an rbind due to each referring to separate subjects but the same types of observations for those subjects. Lastly column names are applied across the data frame from the provided features reference data replacing V1,V2,V3... with more descriptive variables.

## Rename Columns to be more descriptive and easier to read ##

Using gsub and sub we are able to apply some simple substitutions to enhance readability while maintaining consistency compared to renaming columns 1 at a time.

## Create Tidy Data Set ##

Lastly the data is transformed into a tidy format that provides the average of each variable for each unique Subject and Activity combination. This is performed through the use of the dplyr and reshape2 packages. First using `melt()` from reshape2 to melt our data into a tidy form where each variable is in its own row. After melting the data is grouped by Subject, Activity, and variable with `group_by()` from dplyr and then summarized by those groups with `summarize_each()` applying the `mean()` function to the data. The data is sorted through `arrange()` and then written to a text file for sharing.
