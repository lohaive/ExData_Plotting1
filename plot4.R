setwd("D:/Coursera")

# Download zip file
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile = "./HousehouldPower.zip")

# Unzip data
listZip<-unzip("./HousehouldPower.zip")

# Read data into R
HouseholdPower<-read.table(text = grep("^[1,2]/2/2007",readLines(file("./household_power_consumption.txt")),value=TRUE), sep = ';')
names(HouseholdPower)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
HouseholdPower$Date<-as.Date(HouseholdPower$Date,"%d/%m/%Y")
HouseholdPower$DateTime <- as.POSIXct(paste(HouseholdPower$Date, HouseholdPower$Time))

# Construct and save the plot
png(file="plot3.png", bg="white",width = 480, height = 480, units='px')
Sys.setlocale("LC_TIME", "English")
# Set the plot area
par(mfrow=c(2,2))
# Plot 1
plot(HouseholdPower$DateTime,HouseholdPower$Global_active_power, xlab = '', ylab = 'Global Active Power', type = 'l')
# Plot 2
plot(HouseholdPower$DateTime,HouseholdPower$Voltage, xlab = 'datetime', ylab = 'Voltage', type = 'l')
# Plot 3
plot(HouseholdPower$DateTime,HouseholdPower$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(HouseholdPower$DateTime,HouseholdPower$Sub_metering_2, col="red")
lines(HouseholdPower$DateTime,HouseholdPower$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1,col = c("black","red","blue"),bty = "n")
# Plot 4
plot(HouseholdPower$DateTime,HouseholdPower$Global_reactive_power, xlab = 'datetime', ylab = 'Global_reactive_power', type = 'l')
dev.off()
