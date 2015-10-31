##Getting-and-Cleaning-Data Peer Assessment
###run_analysis.R
Input:Raw data
* ./UCI HAR Dataset/train/X_train.txt
* ./UCI HAR Dataset/train/Y_train.txt
* ./UCI HAR Dataset/train/subject_train.txt
* ./UCI HAR Dataset/test/X_test.txt
* ./UCI HAR Dataset/test/Y_test.txt
* ./UCI HAR Dataset/test/subject_test.txt

Output:Tidy data
* out.txt

Processing:  
1. Merges the training and the test sets to create one data set.  
2. Extracts only the measurements on the mean and standard deviation for each measurement.   
3. Uses descriptive activity names to name the activities in the data set  
4. Appropriately labels the data set with descriptive activity names.   
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.   
###CodeBook.md
Describes the variables, the data, and transformations of the raw data