Code Book 
=================

###Overview###

Data is defined for a given Subject and Activity that was performed with various statistical measurements of the observation. Subjects are numbered 1 through 30 for each test subject.
Activities include the following: LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS

Lastly are the fields variable and value. Each variable represents a different observation and statistical method as well as axis in some cases (e.g. x,y,z). The general format is this: Domain.SignalType.AccelerationType.AccelerationSubType.Magnitude.StatisticalOperation.Axis

Examples of each variable segment:
Domain: Frequency, Time; Represents whether the data is in respect to frequency or time. Time measurements were measured at a constant of 50Hz. Fourier transforms provided the Frequency.
SignalType: Body, Gravity; Indicates whether the acceleration signal was from the body or gravity.
AccelerationType: Acc, Gyro; Indicates whether the measurement was for linear acceleration or angular velocity
AccelerationSubType: Jerk,null; Differentiates whether the measurement is simply acceleration (null) or if it is its first derivative Magnitude: Mag,null; Indicates whether the measurement is the magnitude of the 3 dimensional signals (Mag) or an individual axis (null)
StatisticalOperation: mean,std; mean: Mean (average) value or std: Standard deviation
Axis: x,y,z; Indiciates the observation's value on that axis.


###Units###
Acceleration (Acc) units are in terms of standard gravity units `g`
Gyroscope (Gyro) units are in terms of radians/second
Jerk based off of Acceleration will be g/s or m/s^3

###Variables list###
"Frequency.Body.Acc.Jerk.Mag.mean"
"Frequency.Body.Acc.Jerk.Mag.std"
"Frequency.Body.Acc.Jerk.mean.X"
"Frequency.Body.Acc.Jerk.mean.Y"
"Frequency.Body.Acc.Jerk.mean.Z"
"Frequency.Body.Acc.Jerk.std.X"
"Frequency.Body.Acc.Jerk.std.Y"
"Frequency.Body.Acc.Jerk.std.Z"
"Frequency.Body.Acc.Mag.mean"
"Frequency.Body.Acc.Mag.std"
"Frequency.Body.Acc.mean.X"
"Frequency.Body.Acc.mean.Y"
"Frequency.Body.Acc.mean.Z"
"Frequency.Body.Acc.std.X"
"Frequency.Body.Acc.std.Y"
"Frequency.Body.Acc.std.Z"
"Frequency.Body.Gyro.Jerk.Mag.mean"
"Frequency.Body.Gyro.Jerk.Mag.std"
"Frequency.Body.Gyro.Mag.mean"
"Frequency.Body.Gyro.Mag.std"
"Frequency.Body.Gyro.mean.X"
"Frequency.Body.Gyro.mean.Y"
"Frequency.Body.Gyro.mean.Z"
"Frequency.Body.Gyro.std.X"
"Frequency.Body.Gyro.std.Y"
"Frequency.Body.Gyro.std.Z"
"Time.Body.Acc.Jerk.Mag.mean"
"Time.Body.Acc.Jerk.Mag.std"
"Time.Body.Acc.Jerk.mean.X"
"Time.Body.Acc.Jerk.mean.Y"
"Time.Body.Acc.Jerk.mean.Z"
"Time.Body.Acc.Jerk.std.X"
"Time.Body.Acc.Jerk.std.Y"
"Time.Body.Acc.Jerk.std.Z"
"Time.Body.Acc.Mag.mean"
"Time.Body.Acc.Mag.std"
"Time.Body.Acc.mean.X"
"Time.Body.Acc.mean.Y"
"Time.Body.Acc.mean.Z"
"Time.Body.Acc.std.X"
"Time.Body.Acc.std.Y"
"Time.Body.Acc.std.Z"
"Time.Body.Gyro.Jerk.Mag.mean"
"Time.Body.Gyro.Jerk.Mag.std"
"Time.Body.Gyro.Jerk.mean.X"
"Time.Body.Gyro.Jerk.mean.Y"
"Time.Body.Gyro.Jerk.mean.Z"
"Time.Body.Gyro.Jerk.std.X"
"Time.Body.Gyro.Jerk.std.Y"
"Time.Body.Gyro.Jerk.std.Z"
"Time.Body.Gyro.Mag.mean"
"Time.Body.Gyro.Mag.std"
"Time.Body.Gyro.mean.X"
"Time.Body.Gyro.mean.Y"
"Time.Body.Gyro.mean.Z"
"Time.Body.Gyro.std.X"
"Time.Body.Gyro.std.Y"
"Time.Body.Gyro.std.Z"
"Time.Gravity.Acc.Mag.mean"
"Time.Gravity.Acc.Mag.std"
"Time.Gravity.Acc.mean.X"
"Time.Gravity.Acc.mean.Y"
"Time.Gravity.Acc.mean.Z"
"Time.Gravity.Acc.std.X"
"Time.Gravity.Acc.std.Y"
"Time.Gravity.Acc.std.Z"