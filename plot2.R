## Reads the relevant data and creates PNG diagram for plot2

# Read the function and retrieve the relevant data
source('readRelevantData.R')
readRelevantData()

# With the read data (DF) plot the desired graph
# pch is set to NA_integer_ so that no symbol is shown
with(DF, plot(Time, Global_active_power, 
              xlab = "", ylab = "Global Active Power (kilowatts)", 
              pch = NA_integer_))
# Now using the lines function we draw the connected lines in the graph
with(DF, lines(Time, Global_active_power))

## Copy my plot to a PNG file, by default the height and width is 480 pixels
dev.copy(png, file = "plot2.png")
## Don't forget to close the PNG device!
dev.off()