# load data
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=F)

# convert the Date variables to Date class
data$Date<-as.Date(data$Date,"%d/%m/%Y")

# select the data from the dates 2007-02-01 and 2007-02-02
plot1<-data[(data$Date>="2007-02-01" & data$Date<="2007-02-02"),]
plot1$Global_active_power<-as.numeric(plot1$Global_active_power)

# launch graphics device
png(filename="plot1.png",width=480,height=480)

# Construct the plot
hist(plot1$Global_active_power,xlab="Global Active Power (kilowatts)", main="Global Active Power",col="red")

# close graphics device
dev.off()