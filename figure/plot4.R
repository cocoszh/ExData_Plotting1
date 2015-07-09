# Data cleaning and pre-processing 
TB <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
required_data <- subset(TB, TB$Date == "1/2/2007" | TB$Date == "2/2/2007")
required_data[ ,c(3:9)] = apply(required_data[ ,c(3:9)], 2, function(x) as.numeric(as.character(x)))
tidydata <- mutate(required_data, t = strptime(paste(Date, Time, sep = " "),"%d/%m/%Y %H:%M:%S"))

# End of Data cleaning

# plot 4

par(mfrow=c(2,2), mar = c(4,4,2,1),oma = c(0,0,0,0),cex.axis = 0.8, cex.lab = 0.8)

##1
plot(tidydata$t,tidydata$Global_active_power, type = "l" ,ylab = "Global Active Power",xlab = "")
##2
plot(tidydata$t,tidydata$Voltage, type = "l" ,ylab = "Voltage",xlab = "datetime")
##3
with(tidydata, plot(tidydata$t,tidydata$Sub_metering_1, type = "n" ,ylab = "Energy sub metering",xlab = ""))
        lines(tidydata$t,tidydata$Sub_metering_1, type = "l")
        lines(tidydata$t,tidydata$Sub_metering_2, type = "l",col = "red")
        lines(tidydata$t,tidydata$Sub_metering_3, type = "l",col = "blue")
        legend("topright",lty = "solid",cex=0.6,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
##4
plot(tidydata$t,tidydata$Global_reactive_power, type = "l" ,ylab = "Global_reactive_power",xlab = "datetime",las = 1)

dev.copy(png, file = "plot4.png")
dev.off
