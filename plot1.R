## Reads the relevant data and creates PNG diagram for plot1

# Read the function and retrieve the relevant data
source('readRelevantData.R')
readRelevantData()

# With the read data (DF) plot the desired graph
with(DF, 
     hist(Global_active_power, col = "red", 
          main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))

## Copy my plot to a PNG file, by default the height and width is 480 pixels
dev.copy(png, file = "plot1.png")
## Don't forget to close the PNG device!
dev.off()