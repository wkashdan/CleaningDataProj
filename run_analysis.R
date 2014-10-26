#PROBLEM 1 - CREATE DATASET
#First I create variables for each of the file paths
x_train_path <- "./train/X_train.txt"
y_train_path <- "./train/y_train.txt"
sub_train_path <- "./train/subject_train.txt"
x_test_path <- "./test/X_test.txt"
y_test_path <- "./test/y_test.txt"
sub_test_path <- "./test/subject_test.txt"
features_path <- "./features.txt"
activity_path <- "./activity_labels.txt"

#Here I read in each of the files 
xTrain <- read.table(x_train_path)
yTrain <- read.table(y_train_path)
subTrain <- read.table(sub_train_path)
xTest <- read.table(x_test_path)
yTest <- read.table(y_test_path)
subTest <- read.table(sub_test_path)
activities <- read.table(activity_path)[2]
#Note: unneccessary row, taken out by subsetting data frame 
features <- read.table(features_path)[2] 

#Create the full dataset
#combine the rows of train and test datasets
allX <- rbind(xTrain, xTest)
allY <- rbind(yTrain, yTest)
allSub <- rbind(subTrain, subTest)

#name columns
colnames(allX) <- as.character(features[[1]])
colnames(allY) <- c("Activity_Num")
colnames(allSub) <- c("subjectnum")

#combine all datasets
allData <- cbind(allX, allSub, allY)

#PROBLEM 2 - EXTRACT MEAN AND STD MEASUREMENTS
#the following vectors represent the column names of the columns with the means and standard deviations
meanColumns <- as.character(features[(grepl("mean",features[[1]]) | grepl("Mean",features[[1]])),])
stdColumns <- as.character(features[(grepl("std",features[[1]])),])

#create dataset of only measurements of mean and stanadard deviation
extractedData <- cbind(allData[,meanColumns], allData[,stdColumns], allData["subjectnum"], allData["Activity_Num"])

#PROBLEM 3 - GIVE DESCRIPTIVE NAMES TO ACITIVITIES
#I know this can be written with less code but this gets the job done :)
extractedData[["Activity_Num"]] <- sub(1, as.character(activities[[1]][1]), extractedData[["Activity_Num"]])
extractedData[["Activity_Num"]] <- sub(2, as.character(activities[[1]][2]), extractedData[["Activity_Num"]])
extractedData[["Activity_Num"]] <- sub(3, as.character(activities[[1]][3]), extractedData[["Activity_Num"]])
extractedData[["Activity_Num"]] <- sub(4, as.character(activities[[1]][4]), extractedData[["Activity_Num"]])
extractedData[["Activity_Num"]] <- sub(5, as.character(activities[[1]][5]), extractedData[["Activity_Num"]])
extractedData[["Activity_Num"]] <- sub(6, as.character(activities[[1]][6]), extractedData[["Activity_Num"]])
#now that this row is all string values, it makes sense to rename it
colnames(extractedData)[88] <- "activityname"

#PROBLEM 4 - GIVE APPROPRIATE LABELS WITH DESCRIPTIVE NAMES
#this code simply takes out the special characters in the column names
colnames(extractedData) <- gsub("\\(", "", colnames(extractedData))
colnames(extractedData) <- gsub("\\)", "", colnames(extractedData))
colnames(extractedData) <- gsub("_", "", colnames(extractedData))
colnames(extractedData) <- gsub("-", "", colnames(extractedData))
colnames(extractedData) <- gsub(" ", "", colnames(extractedData))
colnames(extractedData) <- gsub(",", "", colnames(extractedData))

#PROBLEM 5 - CREATE TIDY DATASET
varnames <- colnames(extractedData)
meltData <- melt(extractedData, id=c("activityname", "subjectnum"), measure.vars=varnames[1:(length(varnames) - 2)])
tidyData <- dcast(meltData, subjectnum ~ activityname + variable, mean)
colnames(tidyData) <- gsub("_", "", colnames(tidyData))
colnames(tidyData) <- tolower(colnames(tidyData))
write.table(tidyData, "./tidyData.txt", row.name=FALSE)