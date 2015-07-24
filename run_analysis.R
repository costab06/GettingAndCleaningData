

downloadPackage<-function() {
        
        ## download the package and unzip it
        if(!file.exists("./data")) {dir.create("./data")}
        fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl,destfile="./data/tempFile.zip")
        unzip("./data/tempFile.zip", overwrite = T, exdir = "./data")
        unlink("./data/tempFile.zip")
}




##downloadPackage()

## read in the test, train, activity, feature, and subject data
testFeatureSet<-read.table("./data/UCI HAR Dataset/test/X_test.txt")
testActivitySet<-read.table("./data/UCI HAR Dataset/test/Y_test.txt")
testSubjectSet<-read.table("./data/UCI HAR Dataset/test/subject_test.txt")


trainFeatureSet<-read.table("./data/UCI HAR Dataset/train/X_train.txt")
trainActivitySet<-read.table("./data/UCI HAR Dataset/train/Y_train.txt")
trainSubjectSet<-read.table("./data/UCI HAR Dataset/train/subject_train.txt")

activityLabels<-read.table("./data/UCI HAR Dataset/activity_labels.txt")
featureLabels<-read.table("./data/UCI HAR Dataset/features.txt")


## add the column Names
colnames(testFeatureSet)<-featureLabels[,2]
colnames(trainFeatureSet)<-featureLabels[,2]

colnames(testSubjectSet)<-"subjectID"
colnames(trainSubjectSet)<-"subjectID"

colnames(testActivitySet)<-"activity"
colnames(trainActivitySet)<-"activity"


## reduce feature dataframes to columns that have "mean" or "std" in them
cols <- grep("mean|std",names(testFeatureSet))
testFeatureSet<-testFeatureSet[,cols]

cols <- grep("mean|std",names(trainFeatureSet))
trainFeatureSet<-trainFeatureSet[,cols]



## change the activity numbers into levels
testActivitySet$activity<-as.factor(testActivitySet$activity)
levels(testActivitySet$activity) <- activityLabels[,2]

trainActivitySet$activity<-as.factor(trainActivitySet$activity)
levels(trainActivitySet$activity) <- activityLabels[,2]


## add the subject and the activity to the datasets
testSet<-cbind(testSubjectSet,testActivitySet,testFeatureSet)
trainSet<-cbind(trainSubjectSet,trainActivitySet,trainFeatureSet)


##put the test and training sets together
totalSet<-rbind(testSet,trainSet)



## create the tidyDataSet
tidyDataSet<-totalSet





## write the tidy data set
write.table(tidyDataSet, file = "tidyDataSet.df", row.name=FALSE)















## Makes the names meaningful
## Replace the sections with more meaningful strings
## 
## The device it came from
##Acc is the accelerometer
##Gyro is the gyroscope

## What the measurement is
## t is time
## f is frequency

## The overall movement is divided into the body movement component and the gravity component
## body is body movement
## gravity is gravity

##tBody
##tGravity

## These signals that are measured in the time domain can be
## also represented in the frequency domain by taking the time
## measurement and putting it through a fast fourier transform.
## This is just another way of representing the same quantified measurement

##fBody
##fGravity


## taken together they indicate a "Jerk" of some "Magnitude"


## Jerk
## Mag

## In some direction (tri axial means it measures in 3 axis - x, y, z)
##X, Y, Z


## Summary statistics of the information of interest
##mean or Mean
##meanFreq
##std





