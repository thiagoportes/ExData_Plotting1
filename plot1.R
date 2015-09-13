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

#Start device
png(filename = "plot1.png", width = 480, height = 480, units = "px")

hist(d$Global_active_power, xlab='Global Active Power (kilowatts)', main='Global Active Power', col = 'red')

# Close the device
dev.off()
