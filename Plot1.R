library(dplyr)
library(lubridate)

# Read in data
powerData <- read.csv("household_power_consumption.txt",sep = ";",
                      stringsAsFactors = FALSE,na.strings = "?",
                      colClasses = c("character", "character", "numeric","numeric", "numeric", "numeric","numeric", "numeric", "numeric"))

# Keep only the criteria dates
powerData <- powerData[powerData$Date %in% c("1/2/2007","2/2/2007") ,]

# Sort out dates and add a dateTime column
dateTimes <- paste(powerData$Date, powerData$Time)
dateTimes <- strptime(dateTimes, format = "%d/%m/%Y %H:%M:%S")
powerData$dateTime <- dateTimes

#Plot 1
png("Plot1.png")
hist(powerData$Global_active_power,col = "red",xlab = "Globat Active Power (kilowatts)",main = "Global Active Power")
dev.off()