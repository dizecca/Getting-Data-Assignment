# Readme

## Getting the data

Original data can be found at "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip".  Script is used to download the files and unzip.

## Reading and merging data
Test and training data are each read separately.  In each case, subject and activity files are combined. Variable names are assigned to the measurement information based on the "features.txt" file and then combined with the subject and activity information. 
Finally both sets (test and training) are combined in one data set.

## Extracting mean and standard deviation
Only the elements that contain a mean or standard deviation are extracted, using as a reference that the name should contain either "mean()" or "std()"
...  
selected <- alldata[grepl("Subject|Activity|mean[()]|std[()]", names(alldata))]
...

## Tidy data set with the average of each variable for each activity and each subject
Descriptive column names already in place: "Subject", "Activity", and descriptive variable names that identify the type of measurement, the type and direction of the movement and the type of statistic: "mean" or "std"  (See Codebook for more details)

Activity type codes replaced with descriptive text labels (transforming to factors and then assigning new values to the factors.)

Means per activity and subject calculated using ddply:
...
mean_info <- ddply(selected, .(Subject, Activity), colwise(mean))
...

The resulting data is saved to the file "Mean summary" using write.table.  To read the file use read.table:
...
table <- read.table("Mean summary", header = TRUE)
View(table)
...