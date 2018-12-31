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
png(file="plot2.png", bg="white",width = 480, height = 480, units='px')
Sys.setlocale("LC_TIME", "English")
plot(HouseholdPower$DateTime,HouseholdPower$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatt)', type = 'l')
dev.off()
