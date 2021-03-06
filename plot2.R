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
plot(measurements$dts, measurements$Global_active_power, 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")

# Save the histogram to a 480x480 PNG file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
