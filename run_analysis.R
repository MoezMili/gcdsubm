## This script needs "dplyr" and "reshape2" libraries
library(dplyr)
library(reshape2)
## Step 0: Download the data, unzip and load it into tables with appropriate labels
## Assign data set URL to url
## Create data directory if does not exist
## Download the file and unzip the file collapsing directory structure 
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
setwd ("D:/datacourse/coursrepo/gcdproject")
if(!file.exists("./data")){dir.create("./data")}
download.file(url,destfile="./data/Dataset.zip",method="curl",mode="wb")
unzip("./data/Dataset.zip", exdir ="./data",junkpaths = TRUE )
## Get Labels from features
labelsTab <- read.table(file="./data/features.txt")
## Get Training Data Xtrain, add column names from labels
## and complete with Activity and Subjects from ytrain and subject_train
Xtrain <- read.table(file="./data/X_train.txt",col.names = labelsTab[,2])
ytrain <- read.table(file="./data/y_train.txt",col.names ="ActivityId")
subjtrain <- read.table(file="./data/subject_train.txt",col.names ="Subject")
Xtrain <- cbind(subjtrain, ytrain,Xtrain)
## Get Test Data Xtest, add column names from labels 
## and complete with Activity and Subjects from ytest and subject_test
Xtest <- read.table(file="./data/X_test.txt",col.names = labelsTab[,2])
ytest <- read.table(file="./data/y_test.txt",col.names ="ActivityId")
subjtest <- read.table(file="./data/subject_test.txt",col.names ="Subject")
Xtest <- cbind(subjtest,ytest,Xtest)
## Step 1: Merge Trainig and Test
alldata <- rbind(Xtrain, Xtest)
## Step 2: Create a Subdata set with "std" and "mean" columns only & keep Subject and ActivityId
Sublabels <- names(alldata)
Sublabels <- Sublabels[grep("Subject|ActivityId|[Ss]td|[Mm]ean",Sublabels)]
Subdata <- select(alldata,Sublabels)
## Step 3: Use descriptive activity names to name the activities in the data set
## Get Activity labels - Replace Activity Id by Activity label and change column name to Activity
actlb <- read.table(file="./data/activity_labels.txt",col.names=c("ActivityId","Activity"))
Subdata$ActivityId <- sapply(Subdata$ActivityId,function(x){gsub(x,actlb[actlb$ActivityId==x,2],x)})
colnames(Subdata)[2]<-c("Activity")
## Step 5 : creates a tidy data set with the average of each variable for each activity and each subject
tidydata <- melt(Subdata, id=c("Subject","Activity"))
tidydata <- dcast(tidydata,Subject+Activity~variable,mean)
## Write the tidydata set to txt file
write.table(tidydata,file="./data/tidydata.txt",row.names = FALSE)