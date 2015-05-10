## Plot 4 is a set of 4 graphs showing various aspects of the data over the same time period

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

## set up 4 graphs
par(mfrow = c(2, 2))
## Graph 1 shows Global Active Power over time
plot(DateTime, TwoDaysDT$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l") 

## Graph 2 shows Voltage over time
plot(DateTime, TwoDaysDT$Voltage, xlab = "datetime", ylab = "Voltage", type = "l") 

## Graph 3 shows Sub Meter measures over time
plot(DateTime, TwoDaysDT$Sub_metering_1, type="n", 
     xlab = "", ylab = "Energy sub metering") 
points(DateTime, TwoDaysDT$Sub_metering_1, type = "l", col = 'black')
points(DateTime, TwoDaysDT$Sub_metering_2, type = "l", col = 'red')
points(DateTime, TwoDaysDT$Sub_metering_3, type = "l", col = 'blue')

## Graph 4 shows Global Reactive Power over time
plot(DateTime, TwoDaysDT$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

## save the graphs to a png file
dev.copy(png, file = "plot4.png", 
         height = 480, width = 480) 
dev.off()  
