

downloadPackage<-function() {
        
        ## download the package and unzip it
        if(!file.exists("./data")) {dir.create("./data")}
        fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl,destfile="./data/tempFile.zip")
        unzip("./data/tempFile.zip", overwrite = T, exdir = "./data")
        unlink("./data/tempFile.zip")
}




downloadPackage()

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


## now, in order to summarize the data I seem to need to combine the
## subjectID and the activity into a single column, and can drop the
## individual columns

totalSet$subjectID_activity<-paste(as.character(totalSet$subjectID),
                                   as.character(totalSet$activity),sep="_")
## reorder the columns
totalSet<-totalSet[,c(1,2,82,3:81)]

## drop the first two
totalSet<-totalSet[,-c(1,2)]

## create the tidyDataMelt
tidyDataMelt <- melt(totalSet,id="subjectID_activity",measure.vars=c(2:80))

## dcast the dataframe to take the mean of all the variables by subjectID_activity
tidyDataSet<-dcast(tidyDataMelt, subjectID_activity ~ variable, mean)

## write the tidy data set
write.table(tidyDataSet, file = "tidyDataSet.df", row.name=FALSE)





















