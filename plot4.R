#load data.table package to use fast file reader function fread()
library(data.table)
#download and unzip file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "exdata.zip")
unzip("exdata.zip")
#read 2075259 rows and 9 columns quickly, subset a dataframe of 2880 rows and 9 columns with two dates
power<-fread("household_power_consumption.txt", header = TRUE, na.strings = "?", stringsAsFactors = FALSE, data.table = FALSE)
powerData<-power[power$Date %in% c("1/2/2007","2/2/2007"),]
#combine 4 plots into one graph
par(mfrow=c(2,2), mar=c(4,4,2,2), oma=c(1,1,1,1))
plot(dateTime, powerData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(dateTime, powerData$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(dateTime, powerData$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(dateTime, powerData$Sub_metering_2, col="red")
lines(dateTime, powerData$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),  col = c("black","red","blue"), lty = 1, cex = 0.75, bty = "n")
plot(dateTime, powerData$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
#send plot to graphic device png
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
