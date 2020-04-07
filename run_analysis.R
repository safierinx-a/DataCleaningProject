setwd("F:/Career Prep/Data Science Specialization/UCI HAR Dataset")

## SETUP FEATURES
activityLabels <- read.delim("activity_labels.txt"
                        , col.names = c("classLabels", "activityName"), sep = " ", header = FALSE)
features <- read.delim("features.txt", col.names = c("index", "featureNames"), sep = " ", header = FALSE)
features$featureNames <- as.character(features$featureNames)
featuresWanted <- grep("(mean|std)\\(\\)", features$featureNames)
measurements <- features[features$index %in% featuresWanted,]$featureNames
measurements <- gsub('[()]', '', measurements)



## TEST FOLDER PROCESSING 
test <- fread("test/X_test.txt")
test <- test[, ..featuresWanted]
colnames(test) <- measurements

test_lab <- read.delim("test/Y_test.txt", header = FALSE)
colnames(test_lab) <- c("Label")
test_desc <- data.frame("Description" = as.character())
for(i in 1:nrow(test_lab)){
  s <- activityLabels[activityLabels$classLabels==test_lab$Label[i], ]$activityName
  temp <- data.frame("Description" = s)
  test_desc<-rbind(test_desc, temp)
}

test_sub <- read.delim("test/subject_test.txt", header = FALSE)
colnames(test_sub) <- c("Subject")


##TRAIN FOLDER PROCESSING
train <- fread("train/X_train.txt")
train <- train[, ..featuresWanted]
colnames(train) <- measurements

train_lab <- read.delim("train/Y_train.txt", header = FALSE)
colnames(train_lab) <- c("Label")

train_desc <- data.frame("Description" = as.character())
for(i in 1:nrow(train_lab)){
    s <- activityLabels[activityLabels$classLabels==train_lab$Label[i], ]$activityName
    temp <- data.frame("Description" = s)
    train_desc<-rbind(train_desc, temp)
}
train_sub <- read.delim("train/subject_train.txt", header = FALSE)
colnames(train_sub) <- c("Subject")

##MERGE THEM 
mer <- rbind(train, test)
mer_lab <- rbind(train_lab , test_lab)
desc <- rbind(train_desc, test_desc)
subj <- rbind(train_sub, test_sub)
merged <- cbind(subj, mer_lab, desc, mer)
colnames(merged) <- c(c("Subject", "Activity Label", "Description"),measurements)

tidy <- data.frame("Subject" = as.numeric(), "Activity Label" = as.numeric(),
                   "Description" = as.character(), "Variable" = as.character(),
                   "Average Value" = as.numeric()
)
for(i in 4:ncol(merged)){
  temp <- data.frame("Subject" = merged$Subject[i], "Activity Label" = merged$`Activity Label`[i],
                     "Description" = merged$Description[i], "Variable" = colnames(merged)[i],
                     'Average Value' = mean(merged[,i])
                     )
  tidy<- rbind(tidy, temp)
}
write.table(tidy, 'tidied.txt', row.names = FALSE)

