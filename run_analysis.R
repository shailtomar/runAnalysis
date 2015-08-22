#####################################################################################################
### R ccript run_analysis.R that does the following:
###   1. Merges the training and the test sets to create one data set.
###   2. Extracts only the measurements on the mean and standard deviation for each measurement. 
###   3. Uses descriptive activity names to name the activities in the data set
###   4. Appropriately labels the data set with descriptive variable names. 
###   5. From the data set in step 4, creates a second, independent tidy data set with the 
###      average of each variable for each activity and each subject
#####################################################################################################

library(data.table)
library(dplyr)
library(knitr)

run_analysis.R <- function ()
{

  #############   1. Merges the training and the test sets to create one data set.
    # Read Test Data    
    subjectTestData <- read.table("data/UCI HAR Dataset/test/subject_test.txt", header = FALSE)
    activityTestData <- read.table("data/UCI HAR Dataset/test/y_test.txt", header = FALSE)
    featuresTestData <- read.table("data/UCI HAR Dataset/test/X_test.txt", header = FALSE)
    
    # Read Train Data
    subjectTrainData <- read.table("data/UCI HAR Dataset/train/subject_train.txt", header = FALSE)
    activityTrainData <- read.table("data/UCI HAR Dataset/train/y_train.txt", header = FALSE)
    featuresTrainData <- read.table("data/UCI HAR Dataset/train/X_train.txt", header = FALSE)
    
    
    # Combine by row Test and Train Datasets
    subjectData <- rbind(subjectTrainData, subjectTestData)
    activityData <- rbind(activityTrainData, activityTestData)
    featuresData <- rbind(featuresTrainData, featuresTestData)
    
    
    ## Read supporting metadata and set names for variables
    names(subjectData)<-c("subject")
    names(activityData)<- c("activity")
    dataFeaturesNames <- read.table("data/UCI HAR Dataset/features.txt",header=FALSE)
    names(featuresData)<- dataFeaturesNames$V2

    ## Merge datasets
    allData <- cbind(featuresData, activityData, subjectData)  
    
    
  ############# 2. Extracts only the measurements on the mean and standard deviation for each measurement
    
    #Get subset features-names for mean and std
    subdataFeaturesNames<-dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames$V2)]
    selectedNames<-c(as.character(subdataFeaturesNames), "subject", "activity" )
    
    allData<-subset(allData,select=selectedNames)
    
   
    
  ############# 3. Uses descriptive activity names to name the activities in the data set
    activityLabels <- read.table("data/UCI HAR Dataset/activity_labels.txt", header = FALSE)
    
    allData$activity <- as.character(allData$activity)
    for (i in 1:6){
        allData$activity[allData$activity == i] <- as.character(activityLabels[i,2])
    }
    
    allData$activity <- as.factor(allData$activity)  ## factor the activity variable
    
    
    
  ############# 4. Appropriately labels the data set with descriptive variable names. 
    names(allData)<-gsub("^t", "Time", names(allData))
    names(allData)<-gsub("^f", "Frequency", names(allData))
    names(allData)<-gsub("tBody", "TimeBody", names(allData))
    names(allData)<-gsub("Acc", "Accelerometer", names(allData))
    names(allData)<-gsub("Gyro", "Gyroscope", names(allData))
    names(allData)<-gsub("BodyBody", "Body", names(allData))
    names(allData)<-gsub("Mag", "Magnitude", names(allData))

    
  ############# 5. Create tidy data set with the average of each variable for each activity and each subject    
    allData$subject <- as.factor(allData$subject)
    allData <- data.table(allData)
    
    tidyData <- aggregate(. ~subject + activity, allData, mean)
    tidyData <- tidyData[order(tidyData$subject,tidyData$activity),]
    
    #str(tidyData)
    #desc(tidyData)
    write.table(tidyData, file = "./Tidy.txt", row.names = FALSE)

}
  