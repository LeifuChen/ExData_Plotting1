# load data
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=F)

# convert the Date variables to Date class
data$Date<-as.Date(data$Date,"%d/%m/%Y")

# select the data from the dates 2007-02-01 and 2007-02-02
plot3<-data[(data$Date>="2007-02-01" & data$Date<="2007-02-02"),]
plot3$Global_active_power<-as.numeric(plot3$Global_active_power)

#combine Time and Date into a new variable
DateTime<-as.POSIXct(strptime(paste(plot3$Date,plot3$Time),"%Y-%m-%d %H:%M:%S"))
plot3<-cbind(DateTime,plot3)

# launch graphics device
png(filename="plot3.png",width=480,height=480)

# Construct the plot
plot(x=plot3$DateTime,y=plot3$Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab="")
lines(x=plot3$DateTime,y=plot3$Sub_metering_2,col="red")
lines(x=plot3$DateTime,y=plot3$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))

# close graphics device
dev.off()