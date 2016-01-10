##Reading the whole file
file1 <- "./household_power_consumption.txt"
powerdata <- read.csv(file1, header = TRUE, sep=';', na.strings ="?", stringsAsFactors = FALSE)

##Subsetting the file based on Dates given
powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
df <- powerdata[(powerdata$Date=="2007-02-01") | (powerdata$Date=="2007-02-02"),]

df$Global_active_power <- as.numeric(as.character(df$Global_active_power))

##Converting Dates
datetime <- paste(as.Date(df$Date), df$Time)
df$Datetime <- as.POSIXct(datetime)

##Plot2
plot(df$Datetime, df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()