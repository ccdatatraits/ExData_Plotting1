# Loads only the relevant data-frame (DF) required for all plots.
# Returns DF in your running environment

readRelevantData <- function() {
    unzip("exdata-data-household_power_consumption.zip") # Unzips file that gets stored in GIT
    file <- "household_power_consumption.txt" # Zip file above contains this file
    # Creates a new myDate class and provide conversion between this and character
    setClass("myDate")
    setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y"))
    # Read the full data. Note first column in of type "myDate" so it gets interpreted accordingly
    DF <- read.table(file, header = TRUE, sep = ";", 
                          as.is = TRUE, na.strings="?", 
                          colClasses = c("myDate", "character", rep("numeric", 7L)))
    # Don't losing data for Time so it contains Date value from first column
    # and then DF is transformed so Time column contains both Date and Time values
    DF$Time <- paste(DF$Date, DF$Time)
    DF <- transform(DF, Time = strptime(Time, format = "%Y-%m-%d %H:%M:%S"))
    # Subsets and returns only the DF that has a Date column with the value of Date
    # TODO: Parameterize this Date value using function param [dates = c("2007-02-01", "2007-02-02")]
    DF <<- subset(DF, Date == "2007-02-01" | Date == "2007-02-02")
}