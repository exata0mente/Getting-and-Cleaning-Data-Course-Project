library(dplyr)
library(tidyr)

### - [ ]  Merges the training and the test sets to create one data set.
# Caminho relativo de cada pasta que será utilizada
testDir <- paste0(getwd(),'/data/test/')
trainDir <- paste0(getwd(),'/data/train/')
mainDir <- paste0(getwd(),'/data/')

# Carrega a tabela de atividades
activityLabels <- read.table(file = paste0(mainDir, "activity_labels.txt"),
                             col.names = c("idActivity", "nameActivity"), 
                             stringsAsFactors = FALSE)
# Deixa apenas os caracteres separando os "_" por espaço. Tornando o nome mais legível
activityLabels$nameActivity <- activityLabels$nameActivity %>% 
  sub(pattern = "_", replacement = " ") %>% tolower() 

## Vamos carregar o arquivo feature pois nele está os nomes das colunas dos arquivos "X_" de treinamento e test

# Carrega a tabela de features
featuresSet <- read.table(file = paste0(mainDir, "features.txt"),
                          col.names = c("idFeature", "nameFeature"),
                          stringsAsFactors = FALSE)

## Os nomes das variáveis não estão totalmente descritivos, vamos 'melhorá-los'.
featuresSet$nameFeature <- featuresSet$nameFeature %>% sub(pattern = "\\(\\)", replacement = "")
featuresSet$nameFeature <- featuresSet$nameFeature %>% sub(pattern = "BodyBody", replacement = "Body")
featuresSet$nameFeature <- featuresSet$nameFeature %>% gsub(pattern = "-", replacement = "")

## Agora vamos identificar as colunas que correspondem a média ou desvio padrão

# Identifica as medições por expressão regular
indexColMean <- featuresSet$nameFeature %>% grepl(pattern = 'mean')
indexColStd  <- featuresSet$nameFeature %>% grepl(pattern = 'std')

## Com isso já podemos nomear as colunas dos arquivos "X_"

# Carrega as tabelas de testes
testSubject <- read.table(file = paste0(testDir, "subject_test.txt"), col.names = "idSubject")

testLabel   <- read.table(file = paste0(testDir, "y_test.txt"), col.names = "idActivity")
testLabel   <- merge(testLabel, activityLabels, by = "idActivity")

testDataSet <- read.table(file = paste0(testDir, "X_test.txt"), stringsAsFactors = FALSE) 
names(testDataSet) <- featuresSet$nameFeature

# Carrega as tabelas de treino

trainSubject <- read.table(file = paste0(trainDir, "subject_train.txt"), col.names = "idSubject")

trainLabel   <- read.table(file = paste0(trainDir, "y_train.txt"), col.names = "idActivity")
trainLabel   <- merge(trainLabel, activityLabels, by = "idActivity")

trainDataSet <- read.table(file = paste0(trainDir, "X_train.txt"), stringsAsFactors = FALSE)
names(trainDataSet) <- featuresSet$nameFeature

## Vamos montar um "tabelão" de treino e teste

dfTest  <- bind_cols(testSubject, testLabel, testDataSet[indexColMean | indexColStd])
dfTrain <- bind_cols(trainSubject, trainLabel, trainDataSet[indexColMean | indexColStd])

### - [X] Merges the training and the test sets to create one data set.
### - [X] Extracts only the measurements on the mean and standard deviation for each measurement.
### - [X] Uses descriptive activity names to name the activities in the data set.
### - [ ] Appropriately labels the data set with descriptive variable names. 

## Agora vamos melhorar as descrições das colunas conforme abaixo:
### ^t --> Time
### ^f --> Frequence
### gyro --> Gyroscope
### acc --> Accelerometer
# Assim tBodyGyromeanZ será substuído por TimeBodyGyroscopeMeanZ

tmp <- names(dfTest) %>% 
  gsub(pattern = "^t", replacement = "Time") %>%
  gsub(pattern = "^f", replacement = "Frequence") %>%
  gsub(pattern = "[Aa]cc", replacement = "Accelerometer") %>%
  gsub(pattern = "[G]yro", replacement = "Gyroscope") %>%
  gsub(pattern = "mean", replacement = "Mean") %>%
  gsub(pattern = "std", replacement = "Std")

names(dfTest) <- tmp
names(dfTrain) <- tmp
rm(tmp)
### - [X] Merges the training and the test sets to create one data set.
### - [X] Extracts only the measurements on the mean and standard deviation for each measurement.
### - [X] Uses descriptive activity names to name the activities in the data set.
### - [X] Appropriately labels the data set with descriptive variable names. 
### - [ ] From the data set in step 4, creates a second, independent tidy data 
###       set with the average of each variable for each activity and each subject.


tidyDataSetTrain <- dfTest %>% 
  gather(key = "variableMeasurement", value = "valueMeasurement", -c("idSubject", "idActivity", "nameActivity")) %>%
  group_by(idSubject, idActivity, nameActivity, variableMeasurement) %>%
  summarise(avgMeasurement = mean(valueMeasurement))

### - [X] Merges the training and the test sets to create one data set.
### - [X] Extracts only the measurements on the mean and standard deviation for each measurement.
### - [X] Uses descriptive activity names to name the activities in the data set.
### - [X] Appropriately labels the data set with descriptive variable names. 
### - [X] From the data set in step 4, creates a second, independent tidy data 
###       set with the average of each variable for each activity and each subject.
