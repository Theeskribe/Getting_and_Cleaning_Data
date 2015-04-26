# Getting and Cleaning Data
# Course Project Code Book

## Required packages
* R v3.1.2 (base)
* dplyr v0.4.1(required for and %>% operator and summarise_each function)

## Data Analysis Process

#### You should create one R script called run_analysis.R that does the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#### Steps to perform analysis
1. Download project data files from the following link: [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]
2. Open your preferred R shell/UI/IDE environment (e.g. RStudio, RGui, R shell)
3. Use the `setwd("<path_to_script>")` to set the Working directory to source directory containing the `run_analysis.R` file.
4. Create a "data" subdirectory in the working directory set in Step 2.
5. Extract all files from the downloaded data source zip file from step 1 to the "data" subdir of the working directory.
6. Run the following command to run the analysis script: `source("run_analysis.R")`

#### Data Analysis Outputs 
* The full tidy data set will be written to the `./data/tidy1.txt` file.
* The summarized data averages tidy data set will be written to the `./data/tidy2.txt` file.
* The summarized data averages tidy data frame will be output to the console.

#### Please see detailed comments in run_analysis.R file for data analysis steps peformed
#### Please see README.md file for addiitonal Project requirements and details


