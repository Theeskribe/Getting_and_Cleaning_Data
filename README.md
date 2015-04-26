# Getting and Cleaning Data - Course Project

## Course Project Guidelines

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]

The project data files: 
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]

#### You should create one R script called run_analysis.R that does the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Repository Files 
* README.md:  This file - Describes what this repsitories purpose and what files it contians.
* CODEBOOK.md: Describes the variables, the data, and any transformations or work that was performed to clean up the data.
* run_analysis.R: The R scipt contains the code required to perfrom the steps as detailesd in the Course Project Guidelines. The script is dependent on the project data files being downloaded from the supplied link and extracted to the "./data" subdirectory or the present working directory.
* tidy1.txt: The write.table export of tidy data set created by run_analysis.R script's Steps 1 through 4
* tidy2.txt: The write.table export of summarised tidy data set created by run_analysis.R script's Step 5

## How to replicate the analysis

#### Steps to perform analysis
1. Download project data files from the following link: [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]
2. Open your preferred R shell/UI/IDE environment (e.g. RStudio, RGui, R shell)
3. Use the `setwd("<path_to_script>")` to set the Working directory to source directory containing the `run_analysis.R` file.
4. Create a "data" subdirectory in the working directory set in Step 2.
5. Extract all files from the downloaded data source zip file from step 1 to the "data" subdir of the working directory.
6. Run the following command to run the analysis script: `source("run_analysis.R")`


#### Outputs from the run_analysis.R script
* The full tidy data set will be written to the `./data/tidy1.txt` file.
* The summarized data averages tidy data set will be written to the `./data/tidy2.txt` file.
* The summarized data averages tidy data frame will be output to the console.