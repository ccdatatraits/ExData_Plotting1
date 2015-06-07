## Reads the relevant data and creates PNG diagram for plot4

# Read the function and retrieve the relevant data
source('readRelevantData.R')
readRelevantData()

# Make sure the device is set directly to png
png(file = "plot4.png")

# Set global par to set to show 2x2 = 4 graphs together along with some margin settings
par(mfrow = c(2, 2))

# With the read data (DF) plot the desired graph
# pch is set to NA_integer_ so that no symbol is shown
with(DF, plot(Time, Global_active_power, 
              xlab = "", ylab = "Global Active Power", 
              pch = NA_integer_))
# Now using the lines function we draw the connected lines in the graph
with(DF, lines(Time, Global_active_power))

# With the read data (DF) plot the desired graph
# pch is set to NA_integer_ so that no symbol is shown
with(DF, plot(Time, Voltage, 
              xlab = "datetime", ylab = "Voltage", 
              pch = NA_integer_))
# Now using the lines function we draw the connected lines in the graph
with(DF, lines(Time, Voltage))

# Make sure the device is set directly to png
#png(file = "plot4.png")
# With the read data (DF) plot the desired graph
# pch is set to NA_integer_ so that no symbol is shown
with(DF, plot(Time, Sub_metering_1, 
              xlab = "", ylab = "Energy sub metering", 
              pch = NA_integer_))
# Now using the lines function we draw the connected lines in the graph
with(DF, {
    lines(Time, Sub_metering_1, col = "black")
    lines(Time, Sub_metering_2, col = "red")
    lines(Time, Sub_metering_3, col = "blue")
})
# Legend on the top right hand to clarify which Sub-metering is in which color
legend("topright", pch = "", col = c("black", "red", "blue"), 
       lwd = 1, bty = "n", seg.len = 2, text.font = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# With the read data (DF) plot the desired graph
# pch is set to NA_integer_ so that no symbol is shown
with(DF, plot(Time, Global_reactive_power, 
              xlab = "datetime", ylab = "Global_reactive_power", 
              pch = NA_integer_))
# Now using the lines function we draw the connected lines in the graph
with(DF, lines(Time, Global_reactive_power))

## Don't forget to close the PNG device!
dev.off()