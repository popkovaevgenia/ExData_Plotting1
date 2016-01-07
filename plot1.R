a<-read.table("household_power_consumption.txt", header=TRUE, sep=';');
a$tmp<-paste(a$Date,a$Time)
a$Date_new<-as.POSIXlt(a$tmp,format="%d/%m/%Y %H:%M:%S")
cleardata<-a[(as.Date(a$Date_new)=="2007-02-01" | as.Date(a$Date_new)=="2007-02-02"),]
cleardata$Global_active_power<-as.numeric(as.character(cleardata$Global_active_power))
png(filename="plot1.png")
hist(cleardata$Global_active_power,main="Global active power",xlab="Global active power (kilowatts)",col="red")
dev.off()