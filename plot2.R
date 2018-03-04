# Coursera Data Science: Exploratory Data Analysis

# Course project 1: plot2

# Sameer Sharma

################################################################################
## set working directory

rm(list = ls())

data <- read.table("household_power_consumption.txt", header = T, 
                   
                   sep = ";", na.strings = "?")

#  We now need to convert the Date variable into a class Date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#  We are only interested in a subset of dates
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#  To generate a data through time plot, we need to change date variable
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")



# Plot 2

data$datetime <- as.POSIXct(data$datetime)

attach(data)

plot(Global_active_power ~ datetime, type = "l",
     
     ylab = "Global Active Power (kilowatts)", xlab = "")

dev.copy(png, file = "plot2.png", height = 480, width = 480)

dev.off()

detach(data)




