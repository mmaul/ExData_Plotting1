#plot4
setClass("CDate")
setAs("character","CDate", function(from) as.Date(from, format="%d/%m/%Y") )
data <- read.csv("household_power_consumption.txt",colClasses = c("CDate","character",rep("numeric",7)) ,sep=";",na.strings="?")
ss = subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
ss$datetime <- as.POSIXlt(paste(ss$Date, ss$Time," "))

png(filename = "plot4.png",
    width = 504, height = 504, units = "px", pointsize = 12,
    bg = "transparent",  res = NA, 
    type = "cairo")
par(mfrow = c(2, 2), mar = c(5, 4, 4, 2), oma = c(0, 0, 0, 0))
plot(ss$datetime,ss$Global_active_power,type="l",ylab="Global Active Power",xlab="")

with(ss,plot(datetime,Voltage,type="l",ylab="Voltage"))

plot(ss$datetime,ss$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
points(ss$datetime,ss$Sub_metering_2,type="l",ylab="Energy sub metering",xlab="",col="red")
points(ss$datetime,ss$Sub_metering_3,type="l",ylab="Energy sub metering",xlab="",col="blue")
legend("topright",lty=c(1,1,1),lwd=c(2,2,2),bty="n",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(ss,{
    plot(datetime,Global_reactive_power,type="l",bty="n")
    box(lwd=3)
         })

dev.off()
