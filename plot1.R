setClass("CDate")
setAs("character","CDate", function(from) as.Date(from, format="%d/%m/%Y") )
data <- read.csv("household_power_consumption.txt",colClasses = c("CDate","character",rep("numeric",7)) ,sep=";",na.strings="?")
#data$DateTime <- as.POSIXlt(paste(data$Date, data$Time," "))
#ss = subset(data, Date >= as.POSIXlt("2007-02-01") & Date <= as.POSIXlt("2007-02-02"))
ss = subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
ss$DateTime <- as.POSIXlt(paste(ss$Date, ss$Time," "))
hist(ss$Global_active_power,xlab="Global Active Power",main="Global Active Power (kilowatts)",freq=TRUE,col="red")
plot(ss$DateTime,ss$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
plot(ss$DateTime,ss$Sub_metering_1,type="l",ylab="Global Active Power (kilowatts)",xlab="")
points(ss$DateTime,ss$Sub_metering_2,type="l",ylab="Global Active Power (kilowatts)",xlab="",col="red")
points(ss$DateTime,ss$Sub_metering_3,type="l",ylab="Global Active Power (kilowatts)",xlab="",col="blue")
legend("topright",pch=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))