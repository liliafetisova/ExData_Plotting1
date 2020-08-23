df <- read.table("household_power_consumption.txt", header = TRUE,
                 sep = ";", stringsAsFactors = F)
df<-df[df$Date%in%c('1/2/2007','2/2/2007'),]

i <- c(3:8)                                  # Specify columns you want to change
df[ , i] <- apply(df[ , i], 2,            # Specify own function within apply
                  function(x) as.numeric(as.character(x)))

df$DateTime<-as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
png("plot3.png", width=480, height=480, units="px")
#plot3
par(mfcol=c(1,1))
Sys.setlocale(category = "LC_ALL", locale = "english")
plot(df$DateTime,df$Sub_metering_1,
     ylab="Energy sub metering",
     type="l",
     col="black", 
     xlab = '')

lines(df$DateTime,df$Sub_metering_2, col="red")

lines(df$DateTime,df$Sub_metering_3, col="blue")

legend("topright",
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1)

dev.off()