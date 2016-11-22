#load data.table package to use fast file reader function fread()
library(data.table)
#download and unzip file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "exdata.zip")
unzip("exdata.zip")
#read 2075259 rows and 9 columns quickly, subset a dataframe of 2880 rows and 9 columns with two dates
power<-fread("household_power_consumption.txt", header = TRUE, na.strings = "?", stringsAsFactors = FALSE, data.table = FALSE)
powerData<-power[power$Date %in% c("1/2/2007","2/2/2007"),]
#create a histogram with one varible called Global Active Power
hist(powerData$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
#send plot to graphic device png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()