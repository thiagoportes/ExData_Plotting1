#Download
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = 'project1.zip')

#Unzip it and load into data
unzip("project1.zip")
data <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?')

select <- c('1/2/2007', '2/2/2007')
d <- data[data$Date %in% select,]

hist(d$Global_active_power)
