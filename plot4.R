mydata <- read.table("household_power_consumption.txt", sep = ";",header = TRUE)
mydata1 <- mydata[(as.Date(mydata$Date, "%d/%m/%Y") == as.Date("2007-02-01") | as.Date(mydata$Date, "%d/%m/%Y") == as.Date("2007-02-02")),]
date_time <- paste(mydata1$Date,mydata1$Time,sep=',')
formatted_date_time <- strptime(date_time, format= "%d/%m/%Y,%H:%M:%S")
mydata2 <- cbind(mydata1, formatted_date_time)

# Setting the plot area
par(mfrow= c(2,2))
par(mar=c(2,2,1,1))

# Plotting first graph
ylabel = "Global Active Power(Kilowatts)"
plot(mydata2$formatted_date_time,as.numeric(as.character(mydata2$Global_active_power)), type = "l",ylab = ylabel,xlab ="")

# Plotting second graph

plot(mydata2$formatted_date_time,as.numeric(as.character(mydata2$Sub_metering_1)), type = "l", col = "black", ylab= "Energy Sub metering", xlab="")
lines(mydata2$formatted_date_time,as.numeric(as.character(mydata2$Sub_metering_2)), col = "red")
lines(mydata2$formatted_date_time,mydata2$Sub_metering_3, col = "blue")


#Plotting third graph
plot(mydata2$formatted_date_time,as.numeric(as.character(mydata2$Voltage)), type = "l", ylab= "Voltage", xlab="datetime")

#plotting fourth graph
plot(mydata2$formatted_date_time,as.numeric(as.character(mydata2$Global_reactive_power)), type = "l", ylab= "Global_reactive_power", xlab="datetime")

