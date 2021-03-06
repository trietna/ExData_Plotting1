# Load data
data<-read.table("household_power_consumption.txt",sep=";",dec=".",header=T,stringsAsFactors =F )
# Extract data with Date "1/2/2007" and "2/2/2007"
datasub<-subset(data,data$Date=="1/2/2007"|data$Date=="2/2/2007")
# Convert data to numeric
gap<-as.numeric(datasub$Global_active_power)
vol<-as.numeric(datasub$Voltage)
grp<-as.numeric(datasub$Global_reactive_power)
datatime<-strptime(paste(datasub$Date,datasub$Time),"%d/%m/%Y %H:%M:%S")
sub1<-as.numeric(datasub$Sub_metering_1)
sub2<-as.numeric(datasub$Sub_metering_2)
sub3<-as.numeric(datasub$Sub_metering_3)
# Plot data
png("plot4.png",width=480,height = 480)
par(mfrow = c(2, 2))

plot(datatime,gap,type="l",xlab="", ylab="Global Active Power")

plot(datatime,vol,type="l",xlab="datetime", ylab="Voltage")

plot(datatime,sub1,type="l",ylab="Energy Submetering", xlab="")
lines(datatime,sub2,type="l",col="red")
lines(datatime,sub3,type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(datatime,grp,type="l",xlab="datetime", ylab="Global_reactive_power")
dev.off()