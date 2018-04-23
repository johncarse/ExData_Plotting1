# Subsetted original data file at the command line, outside of R (took alternative suggested in assignment):
# head -1 household_power_consumption.txt > feb2007.csv
# grep  '^[12]\/2\/2007' household_power_consumption.txt >> feb2007.csv
data_file <- "../data/feb2007.csv"
measurements <- read.csv(data_file, header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings="?")
measurements$Date <- as.Date(measurements$Date, format = "%d/%m/%Y")

# Generate a usable datetime stamp for the measures and add it to the data frame
dts <- paste(as.Date(measurements$Date), measurements$Time)
measurements$dts <- as.POSIXct(dts)

# Plot the graph
plot(measurements$dts, measurements$Sub_metering_1, 
     type="l", 
     xlab="", 
     ylab="Energy sub metering")
lines(measurements$dts, measurements$Sub_metering_2,
      type = "l",
      col = "red")
lines(measurements$dts, measurements$Sub_metering_3,
      type = "l",
      col = "blue")

legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd=1, 
       col=c("black", "red", "blue"))

# Save the histogram to a 480x480 PNG file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
