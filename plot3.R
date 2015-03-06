#plot3
setClass("CDate")
setAs("character","CDate", function(from) as.Date(from, format="%d/%m/%Y") )
data <- read.csv("household_power_consumption.txt",colClasses = c("CDate","character",rep("numeric",7)) ,sep=";",na.strings="?")
ss = subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
ss$DateTime <- as.POSIXlt(paste(ss$Date, ss$Time," "))

png(filename = "plot3.png",
    width = 504, height = 504, units = "px", pointsize = 12,
    bg = "white",  res = NA, 
    type = "cairo")

plot(ss$DateTime,ss$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
points(ss$DateTime,ss$Sub_metering_2,type="l",ylab="Energy sub metering",xlab="",col="red")
points(ss$DateTime,ss$Sub_metering_3,type="l",ylab="Energy sub metering",xlab="",col="blue")
legend("topright",pch=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
