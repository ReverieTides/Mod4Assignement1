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

#Plot 2
png("Plot2.png")
with(powerData,plot(dateTime,Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)"))
dev.off()