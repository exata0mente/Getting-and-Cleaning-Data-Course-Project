## About the dataset

In the file * tidy_data_set.txt * refers to an experiment in which 30 volunteers wore a Samsung Galaxy S II smartphone at their waist and performed randomly defined activities. The smartphone generated data through its internal sensors, accelerometer and gyroscope, in addition to the time variable. The original experiment generated 561 resource vectors that span time and frequency, plus some estimates.

For this project I am interested only in measurements covering averages and standard deviation.

In the Data Set Structure topic, I'll talk about what each column in the dataset means, and I'll also indicate some counts about the data. In "Measured Variables" there will be the composition of the name of the variable, which indicates descriptively which sensor used, what it measured, in which domain and axis.
In References I indicate the experiment that generated the original data set and some sources that aided the sequence of this script.

> Important information: For the time being I am not yet fluent in English, so I will use Google Translate as a helper in the translation from Brazilian Portuguese to English. I apologize for any possible errors that may interfere with the interpretation of the text

## Data Set Structure

In the table below is the description of each column of the tidy_data_set.txt file.

|Column Number|Column Name      |Type of Data |Description of records           |
|----------------|--------------------|-------------|------------------------------------------------------------|
|1               |idSubject           | integer     |Volunteer identification code                 |
|2               |idActivity          | integer     |Identification code of the activity performed                 |
|3               |nameActivity        | string      |Name of the activity performed                                 |
|4               |variableMeasurement | string      |Measured variable name|
|5               |avgMeasuremente     | float       |Average of the measurements of the                              |

- This dataset has 3,160 records.
- Participated in the original experiment 30 volunteers
- There are 6 activities (which were randomly distributed among participants) being walking, walking upstairs, walking downstairs, sitting, standing and laying.

## Token in Measurement name

To assist in understanding the `variableMeasurement` column in the table below we describe what each part of the name means:

|Token|Description|
|------|---------|
|Frequence or Time| Refers to the domain to which that measurement represents|
|Gravity| Cell phone sensor signal that measures gravity|
|Accelerometer| Cell phone sensor that measures acceleration|
|Gyroscope| Cell phone sensor that measures cell position and direction|
|Jerk| Derivation of the linear acceleration of the body and angular velocity with respect to time|
