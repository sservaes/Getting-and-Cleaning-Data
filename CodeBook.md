#Getting and Cleaning Data Course Project CodeBook

This file describes the variables, the data, and any transformations or work that I have performed to clean up the data.

1. The site where the data was obtained:
  * http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

2. The data for the project:
  * https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

3. The run_analysis.R script performs the following steps to clean the data:
  * Read in the test data to the variable "test", renaming the first column "Subjects" and the second column "Labels"
  * Read in the train data to the variable "train", renaming the first column "Subjects" and the second column "Labels"
  * Read in the activity labels to the variable "activity_labels"
  * Merge the train and test dataset and arrange them by Subjects, assigning the result to the variable "dt"
  * Only select the mean and stdev columns in dt forming a variable "selection" containing the correct column numbers
  * Extract the mean and stdev columns from dt by selection and assign them to the variable "dt_sel"
  * Merge the activity labels with the actual activities using activity_labels
  * Export dt_sel to DT_merge.txt
  * Group dt_sel by Activity and Subjects forming a variable "groups"
  * Summarize groups by taking the mean and assigning this to the variable "tidy_dt"
  * Export tidy_dt to DT_tidy.txt
