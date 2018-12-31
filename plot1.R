setwd("D:/Coursera")

# Download zip file
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile = "./HousehouldPower.zip")

# Unzip data
listZip<-unzip("./HousehouldPower.zip")

# Read data into R
HouseholdPower<-read.table(text = grep("^[1,2]/2/2007",readLines(file("./household_power_consumption.txt")),value=TRUE), sep = ';')
names(HouseholdPower)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# Construct and save the plot
png(file="plot1.png", bg="white",width = 480, height = 480, units='px')
hist(HouseholdPower$Global_active_power,col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
