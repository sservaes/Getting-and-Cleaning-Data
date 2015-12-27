library(data.table)
library(dplyr)

# Read in the test data
column_names <- read.table("./data/UCI HAR Dataset/features.txt")
test_data <- read.table("./data/UCI HAR Dataset/test/X_test.txt", col.names = column_names[,2])
test_labels <- read.table("./data/UCI HAR Dataset/test/Y_test.txt")
test_subjects <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
setnames(test_labels, "V1", "Labels")
setnames(test_subjects, "V1", "Subjects")
test <- cbind(test_subjects, test_labels, test_data)
rm(test_data, test_labels, test_subjects)

# Read in the train data
train_data <- read.table("./data/UCI HAR Dataset/train/X_train.txt", col.names = column_names[,2])
train_labels <- read.table("./data/UCI HAR Dataset/train/Y_train.txt")
train_subjects <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
setnames(train_labels, "V1", "Labels" )
setnames(train_subjects, "V1", "Subjects" )
train <- cbind(train_subjects, train_labels, train_data)
rm(train_data, train_labels, train_subjects, column_names)

# Read in the activity labels
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", col.names = c("Labels", "Activity"))

# Merge and arrange the dataset
dt <- rbind(train, test)
dt <- arrange(dt, Subjects)

# Select the mean and std
selection <- grep("Subjects|Labels|mean|std", colnames(dt))
dt_sel <- dt[, selection]

# Assign the activities to the labels
dt_sel <- full_join(dt_sel, activity_labels, by = "Labels")
setcolorder(dt_sel, c(1:2,82,3:81))

# Export the selected merged data
write.table(dt_sel, "./DT_merge.txt", row.names = FALSE)

# Group according to Subject and Activity
groups <- group_by(dt_sel, Activity, Subjects)
tidy_dt <- summarise_each(groups, funs(mean))

# Export the tidy dataset
write.table(tidy_dt, "./Tidy_DT.txt", row.names = FALSE)