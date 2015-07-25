Code Book
=========

This is the codebook for the Getting and Cleaning Data course project



Description of the DATA
-----------------------

From the data README:


Human Activity Recognition Using Smartphones Dataset
Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:


- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.



Notes: 

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.







Description of the run_analysis.R program and how it operates
--------------------------------------------------------------

run_analysis.R does the following steps, each is described:

1. create a "data" dir if it does not exist: This is the standard pattern shown in the videos of testing whenther the "./data" dir exists and creating if not.

2. download the zip to the "data" dir: Uses download.file() to retrieve the zip into the "data" dir.  The download for this submission was taken on 7/24/2015 at 8:30pm EST

3. unzip the zip file: Uses unzip() to unzip the file into it's directory structure.

4. unlink the zip file: Uses unlink() to remove the zip file once unzipped.

5. reads the test and train features, subjects, and activities: Uses read.table() to read the raw test and train features, activities, and subject data into dataframes for manipulation.

6. add the feature names to the test and train data: Adds the feature or column names to the test and train features, activities, and subject data to make it easier to fiddle with.

7. reduce the columns to only those with "mean" or "std" in the column names: Uses grep() to identify the columns with the strings "mean" and "std" in them and reduces the test and train feature data sets to those columns

8. set the activity levels instead of the numbers: Uses as.factor() to create levels from the activity names and apply them.

9. creates a totalSet dataframe with all the test and train rows with the features names properly and the activity levels set: Uses cbind() and rbind() to put the subjectID, activity, and features together for the test and train data sets, then row bind 
	them into one data set.  At this point we have a large and tidy data set.  All the columns are named properly, the rows contain 
	a single observation each, and the data in the table is all related.

10. creates a melt of that for the purposes of casting it into a summary: Combines the subjectID and the activity into a single column so that the summary tidyDataSet can be created using dcast.

11. casts the melt into a tidyDataSet: Uses dcast() to recast the tall skinny dataset into a summary table using "mean" as the aggregation function for the cast.  This takes the mean of
	all occurances of each variable in the dataset having the same value in the "subjectID_activity" column

12. writes the tidyDataSet into a file



