#load data.table package to use fast file reader function fread()
library(data.table)
#download and unzip file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "exdata.zip")
unzip("exdata.zip")
#read 2075259 rows and 9 columns quickly, subset a dataframe of 2880 rows and 9 columns with two dates
power<-fread("household_power_consumption.txt", header = TRUE, na.strings = "?", stringsAsFactors = FALSE, data.table = FALSE)
powerData<-power[power$Date %in% c("1/2/2007","2/2/2007"),]
#plot sub_metering_1 according to different times of two days
plot(dateTime, powerData$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
#add line graph for sub_metering_2 to existing plot
lines(dateTime, powerData$Sub_metering_2, col="red")
#add line graph for sub_metering_3 to existing plot
lines(dateTime, powerData$Sub_metering_3, col="blue")
#add legend to graph
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 1, cex = 0.75)
#send plot to graphic device png
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
