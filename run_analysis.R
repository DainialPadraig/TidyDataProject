## run_analysis.R
## 
## This script will load the necessary libraries and run the analysis needed to
## produce a tidy data set from the Human Activity Recognition Using Smartphones
## dataset described at http://archive.ics.uci.edu/ml/dataset/Human+Activity+
## Recognition+Using+Smartphones.
##
## The script assumes that the raw data set is in the working directory.

## Install the libraries that will be used to tidy the data set.
library(plyr)
library(dplyr)
library(tidyr)

## This function will read the smartphone data set and generate a tidy data set.
run_analysis <- function() {
    ## Start by reading in the test and training data set of the phone 
    ## measurements and merging them into a single table.
    phoneData <- merge(read.table("./UCI HAR Dataset/test/X_test.txt"),
                       read.table("./UCI HAR Dataset/train/X_train.txt"),
                       all = TRUE)
    ## Make the resulting table into a plyr data frame for ease of use.
    phoneData <- tbl_df(phoneData)
    ## Get human-readable column names from the features text file.
    featureNames <- read.table("./UCI HAR Dataset/features.txt")
    ## Set column names in table with human-readable names.
    colnames(phoneData) <- featureNames$V2
    tidyData <- phoneData
    write.table(tidyData, "./tidyData.txt", row.name = FALSE)
}