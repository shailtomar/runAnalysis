# Code Book for Course Project

# Overview

Source of the original data:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Full Description at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Process
Following process is performed by script run_analysis.R to clean up the data and create tidy data set:
1. Read Test data for subject, activity and features. <br>
2. Read Train data for subject, activity and features.
3. Combine the above data for train and test by rows
4. Read support data of features
5. Merge data for Test and Train for subject, activity, and features
6. Extract meand and standard deviation data from the merged data. This is a subset
7. Assign descriptive names by using/reading activity label file
8. Assign appropriate variables
9. Create variable factor
10. Aggregrate the data and assign it to tidy data
11. Write the tidy data to output file using write.table

# Properties of Tidy data
180 obs. of  68 variables. First column is Subject, Second is Acitivity and the Rest are meassurments.
 [1] "subject"                                       
 [2] "activity"                                      
 [3] "TimeBodyAccelerometer-mean()-X"                
 [4] "TimeBodyAccelerometer-mean()-Y"                
 [5] "TimeBodyAccelerometer-mean()-Z"                
 [6] "TimeBodyAccelerometer-std()-X"                 
 [7] "TimeBodyAccelerometer-std()-Y"                 
 [8] "TimeBodyAccelerometer-std()-Z"                 
 [9] "TimeGravityAccelerometer-mean()-X"             
[10] "TimeGravityAccelerometer-mean()-Y"             
[11] "TimeGravityAccelerometer-mean()-Z"             
[12] "TimeGravityAccelerometer-std()-X"              
[13] "TimeGravityAccelerometer-std()-Y"              
[14] "TimeGravityAccelerometer-std()-Z"              
[15] "TimeBodyAccelerometerJerk-mean()-X"            
[16] "TimeBodyAccelerometerJerk-mean()-Y"            
[17] "TimeBodyAccelerometerJerk-mean()-Z"            
[18] "TimeBodyAccelerometerJerk-std()-X"             
[19] "TimeBodyAccelerometerJerk-std()-Y"             
[20] "TimeBodyAccelerometerJerk-std()-Z"             
[21] "TimeBodyGyroscope-mean()-X"                    
[22] "TimeBodyGyroscope-mean()-Y"                    
[23] "TimeBodyGyroscope-mean()-Z"                    
[24] "TimeBodyGyroscope-std()-X"                     
[25] "TimeBodyGyroscope-std()-Y"                     
[26] "TimeBodyGyroscope-std()-Z"                     
[27] "TimeBodyGyroscopeJerk-mean()-X"                
[28] "TimeBodyGyroscopeJerk-mean()-Y"                
[29] "TimeBodyGyroscopeJerk-mean()-Z"                
[30] "TimeBodyGyroscopeJerk-std()-X"                 
[31] "TimeBodyGyroscopeJerk-std()-Y"                 
[32] "TimeBodyGyroscopeJerk-std()-Z"                 
[33] "TimeBodyAccelerometerMagnitude-mean()"         
[34] "TimeBodyAccelerometerMagnitude-std()"          
[35] "TimeGravityAccelerometerMagnitude-mean()"      
[36] "TimeGravityAccelerometerMagnitude-std()"       
[37] "TimeBodyAccelerometerJerkMagnitude-mean()"     
[38] "TimeBodyAccelerometerJerkMagnitude-std()"      
[39] "TimeBodyGyroscopeMagnitude-mean()"             
[40] "TimeBodyGyroscopeMagnitude-std()"              
[41] "TimeBodyGyroscopeJerkMagnitude-mean()"         
[42] "TimeBodyGyroscopeJerkMagnitude-std()"          
[43] "FrequencyBodyAccelerometer-mean()-X"           
[44] "FrequencyBodyAccelerometer-mean()-Y"           
[45] "FrequencyBodyAccelerometer-mean()-Z"           
[46] "FrequencyBodyAccelerometer-std()-X"            
[47] "FrequencyBodyAccelerometer-std()-Y"            
[48] "FrequencyBodyAccelerometer-std()-Z"            
[49] "FrequencyBodyAccelerometerJerk-mean()-X"       
[50] "FrequencyBodyAccelerometerJerk-mean()-Y"       
[51] "FrequencyBodyAccelerometerJerk-mean()-Z"       
[52] "FrequencyBodyAccelerometerJerk-std()-X"        
[53] "FrequencyBodyAccelerometerJerk-std()-Y"        
[54] "FrequencyBodyAccelerometerJerk-std()-Z"        
[55] "FrequencyBodyGyroscope-mean()-X"               
[56] "FrequencyBodyGyroscope-mean()-Y"               
[57] "FrequencyBodyGyroscope-mean()-Z"               
[58] "FrequencyBodyGyroscope-std()-X"                
[59] "FrequencyBodyGyroscope-std()-Y"                
[60] "FrequencyBodyGyroscope-std()-Z"                
[61] "FrequencyBodyAccelerometerMagnitude-mean()"    
[62] "FrequencyBodyAccelerometerMagnitude-std()"     
[63] "FrequencyBodyAccelerometerJerkMagnitude-mean()"
[64] "FrequencyBodyAccelerometerJerkMagnitude-std()"
[65] "FrequencyBodyGyroscopeMagnitude-mean()"        
[66] "FrequencyBodyGyroscopeMagnitude-std()"         
[67] "FrequencyBodyGyroscopeJerkMagnitude-mean()"    
[68] "FrequencyBodyGyroscopeJerkMagnitude-std()"
 
