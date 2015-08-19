CodeBook

Initial Data

data is provided at  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. Take a look at readme_data.


Program work

The run_analysis program downloads and unzips the data. 
Then data are stored in a directory called UCI HAR Dataset.
Data cleaning is done in four parts



    
    Putting training and test datasets into one dataset.

    Subsetting only those features from the original dataset that are a mean or standard deviation measure (mean or std in feature name).

    Add subject ids (numbers 1-30) to the  data frame made in part 1.

    Add activities, by name, to the  data frame resulting from part 3.

    the resulting data.frame is stored in a variable called "result_frame".

More details are provided in the program.

At the end, there's still 81 column in the data set. 

1 subject.id : The subject ID, an integer in the range 1:30
2 activity : The activity performed by the subject
3 tBodyAcc-mean()-X
4 tBodyAcc-mean()-Y
5 tBodyAcc-mean()-Z
6 tBodyAcc-std()-X
7 tBodyAcc-std()-Y
8 tBodyAcc-std()-Z
9 tGravityAcc-mean()-X
10 tGravityAcc-mean()-Y
11 tGravityAcc-mean()-Z
12 tGravityAcc-std()-X
13 tGravityAcc-std()-Y
14 tGravityAcc-std()-Z
15 tBodyAccJerk-mean()-X
16 tBodyAccJerk-mean()-Y
17 tBodyAccJerk-mean()-Z
18 tBodyAccJerk-std()-X
19 tBodyAccJerk-std()-Y
20 tBodyAccJerk-std()-Z
21 tBodyGyro-mean()-X
22 tBodyGyro-mean()-Y
23 tBodyGyro-mean()-Z
24 tBodyGyro-std()-X
25 tBodyGyro-std()-Y
26 tBodyGyro-std()-Z
27 tBodyGyroJerk-mean()-X
28 tBodyGyroJerk-mean()-Y
29 tBodyGyroJerk-mean()-Z
30 tBodyGyroJerk-std()-X
31 tBodyGyroJerk-std()-Y
32 tBodyGyroJerk-std()-Z
33 tBodyAccMag-mean()
34 tBodyAccMag-std()
35 tGravityAccMag-mean()
36 tGravityAccMag-std()
37 tBodyAccJerkMag-mean()
38 tBodyAccJerkMag-std()
39 tBodyGyroMag-mean()
40 tBodyGyroMag-std()
41 tBodyGyroJerkMag-mean()
42 tBodyGyroJerkMag-std()
43 fBodyAcc-mean()-X
44 fBodyAcc-mean()-Y
45 fBodyAcc-mean()-Z
46 fBodyAcc-std()-X
47 fBodyAcc-std()-Y
48 fBodyAcc-std()-Z
49 fBodyAcc-meanFreq()-X
50 fBodyAcc-meanFreq()-Y
51 fBodyAcc-meanFreq()-Z
52 fBodyAccJerk-mean()-X
53 fBodyAccJerk-mean()-Y
54 fBodyAccJerk-mean()-Z
55 fBodyAccJerk-std()-X
56 fBodyAccJerk-std()-Y
57 fBodyAccJerk-std()-Z
58 fBodyAccJerk-meanFreq()-X
59 fBodyAccJerk-meanFreq()-Y
60 fBodyAccJerk-meanFreq()-Z
61 fBodyGyro-mean()-X
62 fBodyGyro-mean()-Y
63 fBodyGyro-mean()-Z
64 fBodyGyro-std()-X
65 fBodyGyro-std()-Y
66 fBodyGyro-std()-Z
67 fBodyGyro-meanFreq()-X
68 fBodyGyro-meanFreq()-Y
69 fBodyGyro-meanFreq()-Z
70 fBodyAccMag-mean()
71 fBodyAccMag-std()
72 fBodyAccMag-meanFreq()
73 fBodyBodyAccJerkMag-mean()
74 fBodyBodyAccJerkMag-std()
75 fBodyBodyAccJerkMag-meanFreq()
76 fBodyBodyGyroMag-mean()
77 fBodyBodyGyroMag-std()
78 fBodyBodyGyroMag-meanFreq()
79 fBodyBodyGyroJerkMag-mean()
80 fBodyBodyGyroJerkMag-std()
81 fBodyBodyGyroJerkMag-meanFreq()

At the end of the program, variables are cleaned.

At the end

The resulting data frame, is a variable called "result.frame" it is send to the file "tidy_data_mean_measures.txt".
It contains every "subject.id/activity" combination in columns 1 and 2.
It also contains the mean and standard deviation of each measure for that combianation  in columns 3 to 81.







