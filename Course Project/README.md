#Getting and Cleaning Data Course Project

This file describes how the script run_analysis.R works

1. Make a folder called "data" in which you unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. Furthermore, make sure that, next to the folder "data", the run_analysis.R script is also in the current working directory.

2. Use source("run_analysis.R") command in RStudio.

3. You will find that two output files are generated in the current working directory:
  * DT_merge.txt (9.9 Mb): it contains a data frame with a 10299/82 dimension.
  * Tidy_DT.txt (268 Kb): it contains a data frame with a 180/82 dimension.

4. Use data <- read.table("data_with_means.txt") command in RStudio to read the file.
