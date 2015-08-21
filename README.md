# getting-and-cleaning-data-project

this is the run analysis programming assignement. The first commented line sets the working directory to UCI HAR Dataset. This line may be uncommented if you are already working in this directory.

#Initial Data

data is provided at  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. Take a look at readme_data.

the following line can be added at the beggining of the program to download, unzip and store the data.

	url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
	filename<-"data"
	download.file(url, destfile = filename)
	data <- unzip(filename)
	setwd("./UCI HAR Dataset")

#Tidy data
the program is divided in 7 steps described in the codebook.

#Output
the program provides two outputs : a variable called result_frame, and a text file called tidy_data_mean_measures.txt stored in the UCI HAR Dataset directory.



