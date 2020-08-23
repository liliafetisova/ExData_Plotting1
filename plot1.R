df <- read.table("household_power_consumption.txt", header = TRUE,
                 sep = ";", stringsAsFactors = F)
df<-df[df$Date%in%c('1/2/2007','2/2/2007'),]

i <- c(3:8)                                  # Specify columns you want to change
df[ , i] <- apply(df[ , i], 2,            # Specify own function within apply
                  function(x) as.numeric(as.character(x)))

df$DateTime<-as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
par(mfcol=c(1,1))
#plot1
hist(df$Global_active_power, col = 'red',  main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
# Copy my plot to a PNG file
dev.copy(png, file = "plot1.png", width=480, height=480)  
dev.off()  