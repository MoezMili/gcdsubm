The original data set is:

Human Activity Recognition Using Smartphones Dataset
Version 1.0

Please refer to the original README file to have a global view of the original dataset.
 
The usage of this data is authorized by the owners stated below.

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

The original data has been processed as described below.
1)	The training set (x_train) and the test set (x_test) have been labeled and merged on one set.
The ActivityId (from y_train and y_test) and the Subject (from subject_train and subject_test) columns have been added to the merged data: alldata
2)	A subset of below variables means (mean) and standard deviations (std) is extracted: subdata
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The ActivityId have been replaced by the Activity descriptive names and the column is subsequently renamed.
3)	A tidy data set is created tidydata with the average of each variable for each Activity and each Subject
4)	The tidydata set is downloaded to “data” subdirectory into a TXT file tidydata.txt
