## Name: run_analysis.R
## Author: Keith Beers
## Course: Getting and Cleaning Data
## This script performs the merging and analysis of data as outlined in the 
## Course Project for the Getting and Data (see README.md for additional details)

## Load required data tidying tools
library(dplyr) # required for and %>% operator and summarise_each function


## load common activity labels and features field names files

# load activity_labels.txt file for activity_id translation file
activity_labels <- read.table("./data/activity_labels.txt",col.names=c("activity_id","activity")) 

# load features.txt file for observation field names
fields <- read.table("./data/features.txt",col.names=c("id","names")) 


## 1. Merges the training and the test sets to create one data set.

# load Training observation (X) data
train_obs_data <- read.table("./data/train/X_train.txt")
# load Training subject data
train_subject_data <- read.table("./data/train/subject_train.txt",col.names="subject")
# load Training activity (Y) data
train_activity_data <- read.table("./data/train/Y_train.txt",col.names="activity_id")
# column bind the Training observation, subject and activity data into 1 dataframe
train_data <- cbind(train_obs_data,train_subject_data,train_activity_data)

# clean up Training temp dataframes 
rm("train_obs_data","train_subject_data","train_activity_data")

# load Test observation (X) data
test_obs_data <- read.table("./data/test/X_test.txt")
# load Test subject data
test_subject_data <- read.table("./data/test/subject_test.txt",col.names="subject")
# load Test activity (Y) data
test_activity_data <- read.table("./data/test/Y_test.txt",col.names="activity_id")
# column bind the Test observation, subject and activity data into 1 dataframe
test_data <- cbind(test_obs_data,test_subject_data,test_activity_data)

# clean up Test temp dataframes 
rm("test_obs_data","test_subject_data","test_activity_data")

#  concatenate Training and Test data sets into 1 data frame
combined_data <- rbind(train_data, test_data)

# clean up temp test_data and train_data data frames
rm("train_data","test_data")


## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

# make vector of the mean()/std() columns indexes
field_indexes <- grep("-mean\\(\\)|-std\\(\\)",fields[,2])

# replace supplied list of field names with R-friendlier label names
field_names <- gsub("\\(|\\)","",fields[,2])
field_names <- gsub("-","_",field_names)
field_names <- gsub(",",".",field_names)

# clean up temp fields data frame
rm("fields")

# extract data based on Mean/Std field_indexes, subject and activity_id cols
filtered_data <- combined_data[,c(field_indexes,562,563)]

# create names vector with mean()/std() names to apply later on filtered dataset
filtered_field_names <- c(field_names[field_indexes],"subject","activity")

# clean up temp combined_data data frame and field_indexes, field_names vectors
rm("combined_data","field_indexes","field_names")

## 3. Uses descriptive activity names to name the activities in the data set

# merge the activity_id column in data with the activity labels
merged_data <- merge(filtered_data,activity_labels,by="activity_id")
# remove the redundant activity_id column
merged_data$activity_id <- NULL

# clean up temp filtered_data and activity_labels data frames
rm("filtered_data","activity_labels")


## 4. Appropriately labels the data set with descriptive variable names. 

# label merged_data data frame with R-friendly variable names
names(merged_data) <- filtered_field_names

# clean up temp filtered_field_names vector
rm("filtered_field_names")


## 5. From the data set in step 4, creates a second, independent tidy data set with
## the average of each variable for each activity and each subject.

# create tidy set of variable means from merged_data grouped by activity and subject
act_subj_means <- merged_data %>% group_by(activity,subject) %>%
                                  summarise_each(funs(mean))

# Output the summarized tidy data set
print(act_subj_means)

# write complete tidy data set to tidy.txt file for upload on course project
write.table(merged_data, file = "./data/tidy1.txt", row.name=FALSE)

# write independent tidy data set to tidy.txt file for upload on course project
write.table(act_subj_means, file = "./data/tidy2.txt", row.name=FALSE)




