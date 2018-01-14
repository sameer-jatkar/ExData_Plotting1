## Set working directory and download + unzip data file. This code is not included here. 
## This code assumes that the data file is available in current directory

## build column names vector
ColNames <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")


## Read the data file
data.file <- read.table("household_power_consumption.txt",sep=";",header = TRUE, na.strings = "?",col.names = ColNames)

## Subset the data frame for data between two dates
data.analysis <- data.file[data.file$Date %in% c("1/2/2007","2/2/2007"),]

##plot histogram
png(file = "plot1.png",width=480,height=480)
hist(data.analysis$Global_active_power,col="red",xlab="Global Active Power (Kilowatts)",main="Global Active Power")
dev.off()
