# GettingAndCleaningData_week4_assignment

This Repository was created for completing the week4 assignment of "getting and cleaning data" course

Steps to run  the script:

1. Clone the repository.
2. Set repo root directory as R working directory.
3. Download data zipfile.
4. Unzip the "UCI HAR Dataset" folder.
5. Run below command.
   source("run_analysis.R")
   run_analysis()
   
Above steps will generate a tidy data set.

# Script run_analysis.R description:

1. Script requires dplyr package. If it is not there, it should be installed using below command
   install.packages("dplyr")
2. Loads the dplyr library
3. Loads the x_train, y_train, subject_train data from the train folder
4. Loads the x_test, y_test, subject_test data from the test folder
5. Loads the activity labels for Y,from activity_labels.txt
6. Loads feature variables from features.txt
7. Combines train and test data into single dataset, performing the "1st" task mentioned in the instruction (1 Merges the training and the test sets to create one data set.)
8. Extracts all the variables with mean and standard deviation in its name, performing the "2nd" task mentioned in the instruction (2 Extracts only the measurements on the mean and standard deviation for each measurement.)
9. Replace y_total values with their equivalent descriptive activity names present in activity object, performing the "3rd" task mentioned in the instruction (3 Uses descriptive activity names to name the activities in the data set)
10. Set the X_total variable names with variable names derived from feature Object , performing the "4th" task mentioned in the instruction (4 Appropriately labels the data set with descriptive variable names.)
11.  perform groupBy operation on the resultant dataset and do mean operation on each variable, performing the "5th" task mentioned in the instruction (5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.)

