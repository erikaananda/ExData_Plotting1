## Plot 2 is a line of Global Active Power over time

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

####
## create a separate variable to hold the timestamp for each measure
DateTime <- as.POSIXct(strptime(paste(TwoDaysDT$Date, TwoDaysDT$Time), 
                                "%d/%m/%Y %H:%M:%S"))
## plot a line graph of Global Active Power over time
plot(DateTime, 
     TwoDaysDT$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")

## save the graph to a png file
dev.copy(png, file = "plot2.png", 
         height = 480, width = 480) 
dev.off() 
