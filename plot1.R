#plot1
# Download data file 'household_power_consumption.zip' from:
#   https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# and unzip in working directory
setClass("CDate")
setAs("character","CDate", function(from) as.Date(from, format="%d/%m/%Y") )
data <- read.csv("household_power_consumption.txt",colClasses = c("CDate","character",rep("numeric",7)) ,sep=";",na.strings="?")
ss = subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
ss$DateTime <- as.POSIXlt(paste(ss$Date, ss$Time," "))

png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, 
    type = "cairo")
par(mar=c(5,4,4,2))
hist(ss$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",freq=TRUE,col="red")
dev.off()

