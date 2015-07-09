# Data cleaning and pre-processing 
TB <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
required_data <- subset(TB, TB$Date == "1/2/2007" | TB$Date == "2/2/2007")
required_data[ ,c(3:9)] = apply(required_data[ ,c(3:9)], 2, function(x) as.numeric(as.character(x)))
tidydata <- mutate(required_data, t = strptime(paste(Date, Time, sep = " "),"%d/%m/%Y %H:%M:%S"))

# End of Data cleaning

# plot 3

with(tidydata, plot(tidydata$t,tidydata$Sub_metering_1, type = "n" ,ylab = "Energy sub metering",xlab = ""))
lines(tidydata$t,tidydata$Sub_metering_1, type = "l")
lines(tidydata$t,tidydata$Sub_metering_2, type = "l",col = "red")
lines(tidydata$t,tidydata$Sub_metering_3, type = "l",col = "blue")
legend("topright",lty = "solid",cex=0.6,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,file = "plot3.png")
dev.off()
