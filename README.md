GettingAndCleaningData Course Project
=====================================

This repo contains the run_analysis.R script and this README.md
---------------------------------------------------------------

sourcing run_analysis.R does the following:

1. create a "data" dir if it does not exist
2. download the zip file from the web into the "data" dir
3. unzip the zip file into it's directory structure
4. unlink the zip file since it is not needed anymore
5. reads the test and train features, subjects, and activities into dataframes for manipulation
6. add the feature names to the test and train dataframes
7. reduce the columns of the test and train dataframes to only those with "mean" or "std" in the column names
8. set the activity levels instead of the numbers for the activities dataframe
9. creates a "totalSet" dataframe by merging the test and train dataframes with the features named properly and the activity levels set
10. creates a melt dataframe of from the "totalSet" for the purposes of casting it into an aggregated summary
11. casts the melt into a tidyDataSet dataframe
12. writes the tidyDataSet into a file for upload

