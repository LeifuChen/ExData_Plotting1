# load data
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=F)

# convert the Date variables to Date class
data$Date<-as.Date(data$Date,"%d/%m/%Y")

# select the data from the dates 2007-02-01 and 2007-02-02
plot4<-data[(data$Date>="2007-02-01" & data$Date<="2007-02-02"),]
plot4$Global_active_power<-as.numeric(plot4$Global_active_power)

#combine Time and Date into a new variable
DateTime<-as.POSIXct(strptime(paste(plot4$Date,plot4$Time),"%Y-%m-%d %H:%M:%S"))
plot4<-cbind(DateTime,plot4)

# launch graphics device
png(filename="plot4.png",width=480,height=480)

# set the layout of graphs
par(mfrow=c(2,2))

# draw the 1st graph
plot(x=plot4$DateTime,y=plot4$Global_active_power,type="l",ylab="Global Active Power",xlab="")

# draw the 2nd graph
plot(x=plot4$DateTime,y=plot4$Voltage,type="l",ylab="Voltage",xlab="datetime")

# draw the 3rd graph
plot(x=plot4$DateTime,y=plot4$Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab="")
lines(x=plot4$DateTime,y=plot4$Sub_metering_2,col="red")
lines(x=plot4$DateTime,y=plot4$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1, col=c("black","red","blue"),bty="n")

# draw the 4th graph
plot(x=plot4$DateTime,y=plot4$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")

# close graphics device
dev.off()