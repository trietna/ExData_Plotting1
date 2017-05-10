# Load data
data<-read.table("household_power_consumption.txt",sep=";",dec=".",header=T,stringsAsFactors =F)
# Extract data with Date "1/2/2007" and "2/2/2007"
datasub<-subset(data,data$Date=="1/2/2007"|data$Date=="2/2/2007")
# Convert data to numeric
gap<-as.numeric(datasub$Global_active_power)
datatime<-strptime(paste(datasub$Date,datasub$Time),"%d/%m/%Y %H:%M:%S")
# Plot data
png("plot2.png",width=480,height = 480)
plot(datatime,gap,type = "l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()