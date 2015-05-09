# Create the fourth graph
setwd("C:/coursera/DataScientist/4-ExpDataAnalysis/Project 1")
rm(list=ls())
# Read the dataset
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
setClass('myDate')
chrFile <- "household_power_consumption.txt"
dfPwr <- read.csv2(chrFile, header = TRUE, 
                   stringsAsFactors = FALSE, na.strings = "?")

# Filter the appropriate dates
dfPwr$Date <- as.POSIXct(dfPwr$Date, format = "%d/%m/%Y")
dfPwr <- dfPwr[dfPwr$Date>="2007-02-01" & dfPwr$Date<="2007-02-02",]


dfPwr$Global_active_power <- as.numeric(dfPwr$Global_active_power)
dfPwr$Voltage <- as.numeric(dfPwr$Voltage)
dfPwr$Global_reactive_power <- as.numeric(dfPwr$Global_reactive_power)

# Set up two by two graph space
par(mfrow = c(2, 2))

plot(dfPwr$Global_active_power, type = "l", 
     ylab = "Global Active Power", 
     xlab = NA, xaxt="n", cex.axis = 0.5, cex.lab = 0.5)
axis(1, at = c(0, 1500, 2950), labels = c("Thu", "Fri", "Sat"), cex.axis = 0.75)

plot(dfPwr$Voltage, type = "l", 
     ylab = "Voltage", 
     xlab = NA, xaxt="n", cex.axis = 0.5, cex.lab = 0.5) 
axis(1, at = c(0, 1500, 2950), labels = c("Thu", "Fri", "Sat"), cex.axis = 0.75)
mtext("datetime", side = 1, cex = 0.5, line = 3)

plot(dfPwr$Sub_metering_1, type = "l", 
     ylab = "Energy sub metering", xaxt="n", col = "black", xlab = NA,
     cex.axis = 0.5, cex.lab = 0.5)
lines(dfPwr$Sub_metering_2, col = "red")
lines(dfPwr$Sub_metering_3, col = "blue")
axis(1, at = c(0, 1500, 2950), labels = c("Thu", "Fri", "Sat"), cex.axis = 0.75)
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), cex = 0.1, bty = "n")

plot(dfPwr$Global_reactive_power, type = "l", 
     xlab = NA, ylab = "Global_reactive_power", xaxt="n",
     cex.axis = 0.5, cex.lab = 0.5)
axis(1, at = c(0, 1500, 2950), labels = c("Thu", "Fri", "Sat"), cex.axis = 0.75)
mtext("datetime", side = 1, cex = 0.5, line = 3)
dev.copy(png, file = "plot4.png") ## Copy my plot to a PNG file
dev.off()
