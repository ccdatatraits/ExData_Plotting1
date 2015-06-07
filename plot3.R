## Reads the relevant data and creates PNG diagram for plot3

# Read the function and retrieve the relevant data
source('readRelevantData.R')
readRelevantData()

# Make sure the device is set directly to png
png(file = "plot3.png")
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
       lwd = 1, seg.len = 2, text.font = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Don't forget to close the PNG device!
dev.off()