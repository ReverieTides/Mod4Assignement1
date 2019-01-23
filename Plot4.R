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

#plot 4
png("Plot4.png")
par(mfrow = c(2,2))

#Plot 4.1
with(powerData,plot(dateTime,Global_active_power,type = "l",xlab = "",ylab = "Global Active Power"))

#Plot 4.2
with(powerData,plot(dateTime,Voltage,type = "l",xlab = "datetime",ylab = "Voltage"))

#plot 4.3
plot(powerData$dateTime,powerData$Sub_metering_1,type = "l",xlab  = "",ylab = "Energy sub meeting")
lines(powerData$dateTime,powerData$Sub_metering_2,col = "red")
lines(powerData$dateTime,powerData$Sub_metering_3,col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty = c(1,1),cex = 0.5,bty = "n")

#plot 4.4
with(powerData,plot(dateTime,Global_reactive_power,type = "l",xlab = "datetime",ylab = "Global_reactive_power"))
dev.off()
