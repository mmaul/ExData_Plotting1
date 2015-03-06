#plot2
setClass("CDate")
setAs("character","CDate", function(from) as.Date(from, format="%d/%m/%Y") )
data <- read.csv("household_power_consumption.txt",colClasses = c("CDate","character",rep("numeric",7)) ,sep=";",na.strings="?")
ss = subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
ss$DateTime <- as.POSIXlt(paste(ss$Date, ss$Time," "))

png(filename = "plot2.png",
    width = 504, height = 504, units = "px", pointsize = 12,
    bg = "transparent", res = NA, 
    type = "cairo")
plot(ss$DateTime,ss$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
