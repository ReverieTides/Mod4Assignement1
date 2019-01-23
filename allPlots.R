library(dplyr)
library(lubridate)

setwd("C:\\Users\\Dan\\Desktop\\CourseraDataScience\\Mod 4\\Week 1\\Course Project 1")

powerData <- read.csv("household_power_consumption.txt",sep = ";",
                      stringsAsFactors = FALSE,na.strings = "?",
                      colClasses = c("character", "character", "numeric","numeric", "numeric", "numeric","numeric", "numeric", "numeric"))

powerData <- powerData[powerData$Date %in% c("1/2/2007","2/2/2007") ,]

dateTimes <- paste(powerData$Date, powerData$Time)
dateTimes <- strptime(dateTimes, format = "%d/%m/%Y %H:%M:%S")

powerData$dateTime <- dateTimes

#Plot 1
hist(powerData$Global_active_power,col = "red",xlab = "Globat Active Power (kilowatts)",main = "Global Active Power")

#Plot 2
with(powerData,plot(dateTime,Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)"))

