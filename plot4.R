df <- read.table("household_power_consumption.txt", header = TRUE,
                 sep = ";", stringsAsFactors = F)
df<-df[df$Date%in%c('1/2/2007','2/2/2007'),]

i <- c(3:8)                                  # Specify columns you want to change
df[ , i] <- apply(df[ , i], 2,            # Specify own function within apply
                  function(x) as.numeric(as.character(x)))

df$DateTime<-as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
Sys.setlocale(category = "LC_ALL", locale = "english")
png("plot4.png", width=480, height=480, units="px")
par(mfcol=c(2,2))
#1
plot(df$DateTime, df$Global_active_power, type="l", ylab ="Global Active Power (kilowatts)", xlab = '')
#2
plot(df$DateTime,df$Sub_metering_1,
     ylab="Energy sub metering",
     type="l",
     col="black", 
     xlab = '')

lines(df$DateTime,df$Sub_metering_2, col="red")

lines(df$DateTime,df$Sub_metering_3, col="blue")

legend("topright",
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1, box.lty = 0, inset = 0.02, bty="n")

#3
plot(df$DateTime, df$Voltage, type="l", ylab ="Voltage", xlab = 'datetime')
#4
plot(df$DateTime, df$Global_reactive_power, type="l", ylab ="Global_reactive_power", xlab = 'datetime')

dev.off()