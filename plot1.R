## Plot 1 is a histogram of Global Active Power

library (data.table)
#setwd("./Documents/RData/PowerConsumption")
PCFile <- "household_power_consumption.txt"

## get dataset
DT <- fread(PCFile, data.table = TRUE, na.strings = "?", 
            colClasses = c(Date = "Date", Time = "POSIXlt", Global_active_power = "numeric", 
                           Global_reactive_power = "numeric", Voltage = 'numeric', 
                           Global_intensity = 'numeric', Sub_metering_1 = 'integer', 
                           Sub_metering_2 = 'integer', Sub_metering_3 = 'integer'))

## subset the two days we want to plot
TwoDaysDT <- DT[(as.Date(DT$Date, "%d/%m/%Y") >= as.Date("01/02/2007", "%d/%m/%Y")
                 & as.Date(DT$Date, "%d/%m/%Y") <= as.Date("02/02/2007", "%d/%m/%Y")), ]

## create a histogram of Global Active Power
hist(as.numeric(TwoDaysDT$Global_active_power), col='red', 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

## save the histogram to a png file
dev.copy(png, file = "plot1.png", 
         height = 480, width = 480) 
dev.off() 