# Create the third graph
setwd("C:/coursera/DataScientist/4-ExpDataAnalysis/Project 1")
rm(list=ls())
# Read the dataset
#setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
setClass('myDate')
chrFile <- "household_power_consumption.txt"
dfPwr <- read.csv2(chrFile, header = TRUE, 
                   stringsAsFactors = FALSE, na.strings = "?")

# Filter the appropriate dates
dfPwr$Date <- as.POSIXct(dfPwr$Date, format = "%d/%m/%Y")
dfPwr <- dfPwr[dfPwr$Date>="2007-02-01" & dfPwr$Date<="2007-02-02",]

# Convert sub metering to numeric
dfPwr$Sub_metering_1 <- as.numeric(dfPwr$Sub_metering_1)
dfPwr$Sub_metering_2 <- as.numeric(dfPwr$Sub_metering_2)
dfPwr$Sub_metering_3 <- as.numeric(dfPwr$Sub_metering_3)

plot(dfPwr$Sub_metering_1, type = "l", 
     ylab = "Energy sub metering", xaxt="n", col = "black", xlab = NA)
lines(dfPwr$Sub_metering_2, col = "red")
lines(dfPwr$Sub_metering_3, col = "blue")
axis(1, at = c(0, 1500, 2950), labels = c("Thu", "Fri", "Sat"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), cex = 0.60, lty=c(1,1,1))
dev.copy(png, file = "plot3.png")
dev.off()
