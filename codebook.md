Cleaning Data Project - CODE BOOK
===================

### Description

This file is designed to describe the tansformations and variables in the resulting tidy data set. 

### Variables

- Column 1: SUBJECTNUM: This variable represents the number of the participant. There is data on 30 different people. Must be a number 1-30

- Columns 2-87: LAYING- : Each variable in columns 2-87 represents the mean of a certain measure while laying. For example, column 2 is "layingbodyaccmeanx". This variable describes the mean of the participant's x body acceleration while laying.

- Columns 88-173: SITTING- : Each variable in columns 88-173 represents the mean of a certain measure while sitting. For example, column 88 is "sittingbodyaccmeanx". This variable describes the mean of the participant's x body acceleration while sitting.

- Columns 174-259: STANDING- : Each variable in columns 174-259 represents the mean of a certain measure while standing. For example, column 174 is "standingbodyaccmeanx". This variable describes the mean of the participant's x body acceleration while standing.

- Columns 260-345: WALKING- : Each variable in columns 260-345 represents the mean of a certain measure while walking. For example, column 260 is "walkingbodyaccmeanx". This variable describes the mean of the participant's x body acceleration while walking.

- Columns 346-432: WALKINGDOWNSTAIRS- : Each variable in columns 346-432 represents the mean of a certain measure while walking down stairs. For example, column 346 is "walkingdownstairsbodyaccmeanx". This variable describes the mean of the participant's x body acceleration while walking down stairs.

- Columns 433-517: WALKINGUPSTAIRS- : Each variable in columns 432-517 represents the mean of a certain measure while walking up stairs. For example, column 432 is "walkingupstairsbodyaccmeanx". This variable describes the mean of the participant's x body acceleration while walking up stairs.

###Transformations

####STEP 1: CREATING DATASET
- 1.1 rbind the xtrain and xtest data. This put one dataset's columns on top of the other's columns. (must have same number of solumns)
- 1.2 rbind the ytrain adn ytest data.
- 1.3 rbind subject test and subject train data. 
- 1.4 cbind the results of the previous three steps. 

####Step 2: EXTRACT MEAN AND STD MEASUREMENTS
- 2.1 Creat a character vector with all of the columns names that contain "mean" "Mean" or "std". These are the columns that are measurements of means and stanadard deviations.
- 2.2 Creat a new dataset that subsets the result of step 1.4 with the result of step 2.1.

####Step 3: GIVE DESCRIPTIVE NAMES TO ACTIVITIES
- 3.1 Substitute the numbers 1-6 (originally apart of the YTest and YTrain data) with the corresponding activity name.

####Step 4: GIVE APPROPRIATE LABELS WITH DESCRIPTIVE NAMES
- 4.1 In steps 1.1-1.3 the script labels the corresponding given column names.
- 4.2 extract special characters from column names and maek all column names lower case (in the code this happens within part 5).

####Step 5: CREATE A TIDY DATASET TAKING THE MEAN OF EACH COLUMN FOR EACH PARTICIPANT AND EACH ACTIVITY
- 5.1 Melt data using activity names and subject numbers as ID's. This create a tall skinny dataset.
- 5.2 Use dcast to take the mean of each measure of each activity for each participant.
- 5.3 Write final tidy dataset to a txt file.
- The final result should be 31 rows. A row for the column names along with 30 rows correspondign to each participant. 
