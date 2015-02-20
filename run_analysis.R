## 1. Merge the training and the test sets to create one data set. ##

# Open and combine the test data.
subject_test <- read.table("UCI HAR Dataset/test//subject_test.txt")
X_test <- read.table("UCI HAR Dataset/test//X_test.txt")
y_test <- read.table("UCI HAR Dataset/test//y_test.txt")
all_test <- cbind(subject_test, y_test, X_test)
colnames(all_test)[1] <- "subject"
colnames(all_test)[2] <- "training"

# Open and combine the training data.
subject_train <- read.table("UCI HAR Dataset/train//subject_train.txt")
X_train <- read.table("UCI HAR Dataset/train//X_train.txt")
y_train <- read.table("UCI HAR Dataset/train//y_train.txt")
all_train <- cbind(subject_train, y_train, X_train)
colnames(all_train)[1] <- "subject"
colnames(all_train)[2] <- "training"

# Read the feature annotation and convert feature descriptions to characters.
features <- read.table("UCI HAR Dataset/features.txt")
features$V2 <- as.character(features$V2)

# Combine everything.
all_data <- rbind(all_test, all_train)
colnames(all_data) <- c("subject", "training", features$V2)


## 2. Extract only the measurements on the mean and standard deviations for each measurement. ##

# Extract and combine the respective indices.
mean_idx <- features$V1[grepl("mean()", features$V2, fixed=TRUE)]
std_idx <- features$V1[grepl("std()", features$V2, fixed=TRUE)]
all_idx <- c(mean_idx, std_idx)

# The first two columns are other data, so we need to add 2 to every index number
all_idx <- all_idx+2
# Sort in order to keep the column order.
sort_idx <- sort(all_idx)

# Subset the combined data set.
sub_data <- all_data[, sort_idx]
sub_data <- cbind(all_data[, 1:2], sub_data)


## 3. Use descriptive activity names to name the activities in the data set. ##

# Create a data frame with the activities and their numbers.
activies <- data.frame(number=c(1:6),
                       activity=c("walking", "walking up", "walking down", "sitting", "standing", "laying"))
# I don't know how to create this directly as characters...
activies$activity <- as.character(activies$activity)

# Replace the numbers under "training" with the activity names.
for (number in activies$number) {
  sub_data$training[sub_data$training==number] <- activies$activity[number]
}


## 4. Appropriately label the data set with descriptive variable names. ##
# Already done above (features as colnames).


## 5. Create a second, independent tidy data set with the average of each variable
## for each activity and each subject. ##

# Split the data by subject and activity.
data_split <- split(sub_data, sub_data[, c("subject", "training")])

# Calculate means for the activities.
data_mean <- sapply(data_split, function(x) apply(x[, 3:68], 2, mean))

# Transpose the data.
data_mean <- t(data_mean)

# Split the subject and activity name again, adjust the column names and remove row names.
tidy_data <- cbind(do.call(rbind, strsplit(rownames(data_mean), ".", fixed=TRUE)), data_mean)
colnames(tidy_data) <- c("subject", "activity", colnames(data_mean))
rownames(tidy_data) <- NULL

# Write the tidy data set to a file.
write.table(tidy_data, "tidy_data.txt", row.name=FALSE)