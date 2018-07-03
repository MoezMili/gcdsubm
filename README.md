# gcdsubm
Submission Repo for Coursera Getting and Cleaning Data Assignment

The original data set can be downloaded from below URL:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This data set is related to:

Human Activity Recognition Using Smartphones Dataset
Version 1.0

Please refer to the original README file to have a global view of the original dataset.
 
The usage of this data is authorized by the owners stated below.

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

The run_analysis.R script can be used to download the original data set described above to process it and to create a tidy data set as described below:
This script will call "dplyr" and "reshape2" libraries
Step 0: Download the data, unzip and load it into tables with appropriate labels
-	Assign data set URL to url
-	Create data sub directory if does not exist
-	Download the file and unzip the file collapsing directory structure to data subdirectory
-	Get Labels from features
-	Get Training and Test Data, add column names from labels
-	and complete with Activity and Subjects
Step 1: The Trainig and Test data sets are merged into one alldata data set
Step 2: A subdata set with "std" and "mean" columns only is created. The Subject and ActivityId columns are also kept.
Step 3: The ActivityId column is replaced by descriptive activity names. The column is renamed: Activity 
Step 4: part was done on Step 0 and part on Step 3
Step 5: creates a tidy data set with the average of each variable for each activity and each subject and finally writes the tidydata set to txt file “tidydata.txt" in the data subdirectory.
