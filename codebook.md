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
