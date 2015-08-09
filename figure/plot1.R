# Data cleaning and pre-processing 
TB <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
required_data <- subset(TB, TB$Date == "1/2/2007" | TB$Date == "2/2/2007")
required_data[ ,c(3:9)] = apply(required_data[ ,c(3:9)], 2, function(x) as.numeric(as.character(x)))
tidydata <- mutate(required_data, t = strptime(paste(Date, Time, sep = " "),"%d/%m/%Y %H:%M:%S"))

# End of Data cleaning

# Plot 1

hist(tidydata$Global_active_power, main = "Global Active Power", col = "red",xlab = "Global Active Power (kilowatts)",las = 1)
dev.copy(png,file="plot1.png")
dev.off()


