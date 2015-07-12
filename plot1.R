mydata <- read.table("household_power_consumption.txt", sep = ";",header = TRUE)
mydata1 <- mydata[(as.Date(mydata$Date, "%d/%m/%Y") == as.Date("2007-02-01") | as.Date(mydata$Date, "%d/%m/%Y") == as.Date("2007-02-02")),] 
hist(as.numeric(as.character((mydata1$Global_active_power)),col="red"),col="red",main = "Global Active Power",xlab="Global Active Power(Kilowatts)")
