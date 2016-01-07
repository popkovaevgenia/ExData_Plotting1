a<-read.table("household_power_consumption.txt", header=TRUE, sep=';');
a$tmp<-paste(a$Date,a$Time)
a$Date_new<-as.POSIXlt(a$tmp,format="%d/%m/%Y %H:%M:%S")
cleardata<-a[(as.Date(a$Date_new)=="2007-02-01" | as.Date(a$Date_new)=="2007-02-02"),]
cleardata$Global_active_power<-as.numeric(as.character(cleardata$Global_active_power))
cleardata$Global_reactive_power<-as.numeric(as.character(cleardata$Global_reactive_power)) 
cleardata$Sub_metering_1<-as.numeric(as.character(cleardata$Sub_metering_1))
cleardata$Sub_metering_2<-as.numeric(as.character(cleardata$Sub_metering_2))
cleardata$Voltage<-as.numeric(as.character(cleardata$Voltage))

png(filename="plot4.png")
par(mfrow=c(2,2))
plot(x=cleardata$Date_new,y=cleardata$Global_active_power,type="l",ylab="Global active power (kilowatts)", xlab="")
plot(x=cleardata$Date_new,y=cleardata$Voltage,type="l",ylab="Voltage", xlab="datetime")
plot(x=cleardata$Date_new,y=cleardata$Sub_metering_1,type="l",ylab="Energy sub metering", xlab="")
lines(x=cleardata$Date_new,y=cleardata$Sub_metering_2, col="red")
lines(x=cleardata$Date_new,y=cleardata$Sub_metering_3, col="blue")
legend("topright",col = c("black", "red", "blue"),bty="n",lwd=1,cex=0.7,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(x=cleardata$Date_new,y=cleardata$Global_reactive_power,type="l",ylab="Global_reactive_power", xlab="datetime")

dev.off()