#ExData_Plotting1
#================

#Plotting Assignment 1 for Exploratory Data Analysis

mydata = read.table("household_power_consumption.txt",
                    sep = ";", dec = ".", header = TRUE,
                    na.strings = "?",
                    colClasses = c("character", "character", "numeric", "numeric",
                                   "numeric", "numeric", "numeric", "numeric", 
                                   "numeric"))
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata <- subset(mydata, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
mydata$DateTime <- paste(mydata$Date,mydata$Time, sep = " ");
mydata$DateTime <- strptime(mydata$DateTime, format = "%Y-%m-%d %H:%M:%S")

png(filename = "plot1.png", 
          width = 480,
          height = 480,
          units = "px")
hist(mydata$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()