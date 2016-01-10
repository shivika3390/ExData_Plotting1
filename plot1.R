##Reading the whole file
file1 <- "./household_power_consumption.txt"
powerdata <- read.csv(file1, header = TRUE, sep=';', na.strings ="?", stringsAsFactors = FALSE)

##Subsetting the file based on Dates given
powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
df <- powerdata[(powerdata$Date=="2007-02-01") | (powerdata$Date=="2007-02-02"),]

df$Global_active_power <- as.numeric(as.character(df$Global_active_power))

##Plot1
hist(df$Global_active_power, main = "Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()