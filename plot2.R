mydata <- read.table("household_power_consumption.txt", sep = ";",header = TRUE)
mydata1 <- mydata[(as.Date(mydata$Date, "%d/%m/%Y") == as.Date("2007-02-01") | as.Date(mydata$Date, "%d/%m/%Y") == as.Date("2007-02-02")),]
date_time <- paste(mydata1$Date,mydata1$Time,sep=',')
formatted_date_time <- strptime(date_time, format= "%d/%m/%Y,%H:%M:%S")
mydata2 <- cbind(mydata1, formatted_date_time)
# Plotting first graph
ylabel = "Global Active Power(Kilowatts)"
plot(mydata2$formatted_date_time,as.numeric(as.character(mydata2$Global_active_power)), type = "l",ylab = ylabel,xlab ="")





                  