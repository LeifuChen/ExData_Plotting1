# load data
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=F)

# convert the Date variables to Date class
data$Date<-as.Date(data$Date,"%d/%m/%Y")

# select the data from the dates 2007-02-01 and 2007-02-02
plot2<-data[(data$Date>="2007-02-01" & data$Date<="2007-02-02"),]
plot2$Global_active_power<-as.numeric(plot2$Global_active_power)

#combine Time and Date into a new variable
DateTime<-as.POSIXct(strptime(paste(plot2$Date,plot2$Time),"%Y-%m-%d %H:%M:%S"))
plot2<-cbind(DateTime,plot2)

# launch graphics device
png(filename="plot2.png",width=480,height=480)

# Construct the plot
plot(x=plot2$DateTime,y=plot2$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

# close graphics device
dev.off()