## Merge the training and the test sets to create one data set.

subject_test <- read.table("UCI HAR Dataset/test//subject_test.txt")
X_test <- read.table("UCI HAR Dataset/test//X_test.txt")
y_test <- read.table("UCI HAR Dataset/test//y_test.txt")

subject_train <- read.table("UCI HAR Dataset/train//subject_train.txt")
X_train <- read.table("UCI HAR Dataset/train//X_train.txt")
y_train <- read.table("UCI HAR Dataset/train//y_train.txt")

features <- read.table("UCI HAR Dataset/features.txt")
features$V2 <- as.character(features$V2)

all_test <- cbind(subject_test, y_test, X_test)
colnames(all_test)[1] <- "subject"
colnames(all_test)[2] <- "training"

all_train <- cbind(subject_train, y_train, X_train)
colnames(all_train)[1] <- "subject"
colnames(all_train)[2] <- "training"

all_data <- rbind(all_test, all_train)
colnames(all_data) <- c("subject", "training", features$V2)


## Extract only the measurements on the mean and standard deviations for each measurement.

mean_idx <- features$V1[grepl("mean()", features$V2, fixed=TRUE)]
std_idx <- features$V1[grepl("std()", features$V2, fixed=TRUE)]
all_idx <- c(mean_idx, std_idx)

# The first two columns are other data, so we need to add 2 to every index number
all_idx <- all_idx+2
# Sort in order to keep the column order.
sort_idx <- sort(all_idx)

sub_data <- all_data[, sort_idx]
sub_data <- cbind(all_data[, 1:2], sub_data)


## Use descriptive activity names to name the activities in the data set.

activies <- data.frame(number=c(1:6),
                       activity=c("walking", "walking up", "walking down", "sitting", "standing", "laying"))
# I don't know how to create this directly as characters...
activies$activity <- as.character(activies$activity)

# Replace the numbers under "training" with the activity names.
for (number in activies$number) {
  sub_data$training[sub_data$training==number] <- activies$activity[number]
}


## Appropriately label the data set with descriptive variable names.



## Create a second, independent tidy data set with the average of each variable
## for each activity and each subject.