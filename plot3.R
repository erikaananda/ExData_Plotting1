## Plot 3 is a line comparison of Sub Metering measures over time

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

## create the empty graph
plot(DateTime, TwoDaysDT$Sub_metering_1, type="n", 
     xlab = "", ylab = "Energy sub metering") 

## add three lines - one for each sub meter measure
points(DateTime, TwoDaysDT$Sub_metering_1, type = "l", col = 'black')
points(DateTime, TwoDaysDT$Sub_metering_2, type = "l", col = 'red')
points(DateTime, TwoDaysDT$Sub_metering_3, type = "l", col = 'blue')

## save the graph to a png file
dev.copy(png, file = "plot3.png", 
         height = 480, width = 480) 
dev.off()   
