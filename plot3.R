#Download
if (!file.exists('project1.zip')) {
    url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(url, destfile = 'project1.zip')
}

#Unzip it and load into data
if (!file.exists('household_power_consumption.txt')) {
    unzip("project1.zip")
}
data <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?', stringsAsFactors = FALSE)

#Filter the data for the selected dates
select <- c('1/2/2007', '2/2/2007')
d <- data[data$Date %in% select,]

d$DateTime <- strptime(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S")

#Get the range for the x and y axis
xrange <- range(d$DateTime)
yrange <- range(range(d$Sub_metering_1), range(d$Sub_metering_2), range(d$Sub_metering_3))

#Start device
png(filename = "plot3.png", width = 480, height = 480, units = "px")

#Set up the plot
plot(xrange, yrange, type='n', ylab='Energy sub metering', xlab='')

#Add lines
lines(d$DateTime, d$Sub_metering_1, type='l')
lines(d$DateTime, d$Sub_metering_2, type='l', col='red')
lines(d$DateTime, d$Sub_metering_3, type='l', col='blue')

#Add a legend
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty = 1)

# Close the device
dev.off()
