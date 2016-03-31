#Code Book

##Column1

Subject: An identifier of the subject who carried out the experiment

##Column2

Activity: Identifies one of six activities the subjects performed

    WALKING 
    WALKING_UPSTAIRS 
    WALKING_DOWNSTAIRS 
    SITTING 
    STANDING 
    LAYING
    
##Columns 3 to 68
Data in these columns is the mean of the measurements per subject and activity, for each of the mean and standard variables. 
The name of each of this columns identifies the variables as follows:

    "t" for time or "f" for Fast Fourier Transform
    "BodyAcc" for body linear acceleration or "GravityAcc" for gravity acceleration
    "Gyro" indicates signal from the gyroscope
    "Jerk" indicates signal derived from angular velocity and body linear acceleration
    "Mag" indicates the magnitude of the three-dimensional signals calculated using the Euclidean norm
    "X", "Y" or "Z" indicates the 3-axial direction
    "mean" for mean value or "std" for standard deviation
 
So for example "tBodyAcc.mean...Y" is the mean time measurement of body acceleration in the Y axis.
