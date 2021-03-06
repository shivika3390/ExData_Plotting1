##Reading the whole file
file1 <- "./household_power_consumption.txt"
powerdata <- read.csv(file1, header = TRUE, sep=';', na.strings ="?", stringsAsFactors = FALSE)

##Subsetting the file based on Dates given
powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
df <- powerdata[(powerdata$Date=="2007-02-01") | (powerdata$Date=="2007-02-02"),]

##Converting Dates
datetime <- paste(as.Date(df$Date), df$Time)
df$Datetime <- as.POSIXct(datetime)

df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))

##Plot3
plot(df$Datetime,df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(df$Datetime,df$Sub_metering_2, col="red")
lines(df$Datetime,df$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()