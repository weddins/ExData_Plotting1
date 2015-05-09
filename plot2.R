# Create the second graph
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

# Convert column to numeric
dfPwr$Global_active_power <- as.numeric(dfPwr$Global_active_power)

# Create the second graph

plot(dfPwr$Global_active_power, type = "l", 
     ylab = "Global Active Power (killowatts)", 
     xlab = NA, xaxt="n") 
axis(1, at = c(0, 1500, 2950), labels = c("Thu", "Fri", "Sat"))
dev.copy(png, file = "plot2.png") ## Copy my plot to a PNG file
dev.off()
