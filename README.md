GettingAndCleaningData Course Project
=====================================

This repo contains the run_analysis.R script and this README.md
---------------------------------------------------------------

run_analysis.R does the following:

1. create a "data" dir if it does not exist
2. download the zip to the "data" dir
3. unzip the zip file
4. unlink the zip file
5. reads the test and train features, subjects, and activities
6. add the feature names to the test and train data
7. reduce the columns to only those with "mean" or "std" in the column names
8. set the activity levels instead of the numbers
9. creates a totalSet dataframe with all the test and train rows with the features names properly and the activity levels set
10. creates a melt of that for the purposes of casting it into a summary
11. casts the melt into a tidyDataSet
12. writes the tidyDataSet into a file


