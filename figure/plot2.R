# Data cleaning and pre-processing 
TB <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
required_data <- subset(TB, TB$Date == "1/2/2007" | TB$Date == "2/2/2007")
required_data[ ,c(3:9)] = apply(required_data[ ,c(3:9)], 2, function(x) as.numeric(as.character(x)))
tidydata <- mutate(required_data, t = strptime(paste(Date, Time, sep = " "),"%d/%m/%Y %H:%M:%S"))

# End of Data cleaning

# plot 2

plot(tidydata$t,tidydata$Global_active_power, type = "l" ,ylab = "Global Active Power (kilowatts)",xlab = "")
dev.copy(png,file="plot2.png")
dev.off()

