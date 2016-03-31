#Retrieve files and unzip

    temp <- tempfile()
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", temp) 
    unzip(temp)
    unlink(temp)

#call packages
    library(plyr)
    library(tidyr)
    library(data.table)

#Read and merge data
    #Read list of features
    features <- read.table("c://UCI HAR Dataset/features.txt")
    #Read test information
        #Read test subject information
        test_subject <- read.table("c://UCI HAR Dataset/test/subject_test.txt")
        #Read activity information for test
        test_activity <- read.table("c://UCI HAR Dataset/test/y_test.txt")
        #merge subject and activity info and label columns for test 
        test_info <- cbind(test_subject, test_activity)
        colnames(test_info) <- c("Subject", "Activity")
        #read variables for test, labels based on features file and merge 
        test_var <- read.table("c://UCI HAR Dataset/test/X_test.txt")
        var_names <- features[,2]
        colnames(test_var) <- var_names
        test_info <- cbind(test_info, test_var)
       
    #Read training information
        #Read training subject information
        train_subject <- read.table("c://UCI HAR Dataset/train/subject_train.txt")
        #Read activity information for training
        train_activity <- read.table("c://UCI HAR Dataset/train/y_train.txt")
        #merge subject and activity info and label columns for training 
        train_info <- cbind(train_subject, train_activity)
        colnames(train_info) <- c("Subject", "Activity")
        #read variables for training, labels based on features file and merge 
        train_var <- read.table("c://UCI HAR Dataset/train/X_train.txt")
        var_names <- features[,2]
        colnames(train_var) <- var_names
        train_info <- cbind(train_info, train_var)
    
    #Merge training and test sets into one dataset
        alldata <- rbind(train_info, test_info)
    
#Extract only measurement on mean and standard deviation
    selected <- alldata[grepl("Subject|Activity|mean[()]|std[()]", names(alldata))]

#Use descriptive activity names to name activities    
    selected$Activity <- factor(selected$Activity)
    selected$Activity <- revalue(selected$Activity, 
                        c("1" = "Walking", "2"= "Walking_upstairs", "3" = "Walking_downstairs", 
                        "4" = "Sitting", "5" = "Standing", "6" = "Laying"))
#Create tidy data set with the average of each variable for each activity and each subject
    mean_info <- ddply(selected, .(Subject, Activity), colwise(mean))

#Output mean dataset to file    
    write.table(mean_info, "Mean summary")


        
