mydata <- read.table("household_power_consumption.txt", sep = ";",header = TRUE)
mydata1 <- mydata[(as.Date(mydata$Date, "%d/%m/%Y") == as.Date("2007-02-01") | as.Date(mydata$Date, "%d/%m/%Y") == as.Date("2007-02-02")),]
date_time <- paste(mydata1$Date,mydata1$Time,sep=',')
formatted_date_time <- strptime(date_time, format= "%d/%m/%Y,%H:%M:%S")
mydata2 <- cbind(mydata1, formatted_date_time)
plot(mydata2$formatted_date_time,as.numeric(as.character(mydata2$Sub_metering_1)), type = "l", col = "black", ylab= "Energy Sub metering", xlab="")
lines(mydata2$formatted_date_time,as.numeric(as.character(mydata2$Sub_metering_2)), col = "red")
lines(mydata2$formatted_date_time,mydata2$Sub_metering_3, col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ), lty=c(1,1,1), lwd=c(2.5,2.5),col=c("black","red","blue"))