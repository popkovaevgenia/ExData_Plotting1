a<-read.table("household_power_consumption.txt", header=TRUE, sep=';');
a$tmp<-paste(a$Date,a$Time)
a$Date_new<-as.POSIXlt(a$tmp,format="%d/%m/%Y %H:%M:%S")
cleardata<-a[(as.Date(a$Date_new)=="2007-02-01" | as.Date(a$Date_new)=="2007-02-02"),]
cleardata$Global_active_power<-as.numeric(as.character(cleardata$Global_active_power)) 
cleardata$Sub_metering_1<-as.numeric(as.character(cleardata$Sub_metering_1))
cleardata$Sub_metering_2<-as.numeric(as.character(cleardata$Sub_metering_2))
png(filename="plot3.png")
plot(x=cleardata$Date_new,y=cleardata$Sub_metering_1,type="l",ylab="Energy sub metering", xlab="")
lines(x=cleardata$Date_new,y=cleardata$Sub_metering_2, col="red")
lines(x=cleardata$Date_new,y=cleardata$Sub_metering_3, col="blue")
legend("topright",lwd=1,bty="n",col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
