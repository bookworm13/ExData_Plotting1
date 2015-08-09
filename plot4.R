#ExData_Plotting4
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

png(filename = "plot4.png", 
    width = 480,
    height = 480,
    units = "px")

par(mfrow = c(2,2), mar = c(4, 4, 2, 1))
with(mydata, {
        plot(DateTime, Global_active_power,type = "l",
                        xlab = "", ylab = "Global Active Power")
        plot(DateTime, Voltage,type = "l",
                    xlab = "datetime", ylab = "Voltage")
        plot(DateTime, Sub_metering_1,type = "l", col = "black", 
                    xlab = "", ylab = "Energy sub metering")
        lines(DateTime, Sub_metering_2, col = "red")
        lines(DateTime, Sub_metering_3, col = "blue")
        legend("topright", lty = c(1,1), col = c("black", "red", "blue"), bty = "n",
                            legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime", ylab= "Global_reactive_plot")
})
dev.off()