library(datasets)

hpc <- read.csv("~/Downloads/household_power_consumption.txt", sep=";", na.strings="?")
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc <- hpc[hpc$Date <= as.Date("2007-02-02") & hpc$Date >= as.Date("2007-02-01"), ]
hpc$test <- strptime(hpc$Time, format = "%H:%M:%S", tz = "GMT")
hpc$test <- format(hpc$test, "%H:%M:%S")
hpc$test <- NULL

png(filename = "plot1.png",
    width = 480, 
    height = 480,
    bg = "transparent" 
)

hist(hpc$Global_active_power,breaks = 12, 
     ylim = c(0,1200), 
     col = "red", 
     main = "Global Active Power", 
     xlab ="Global Active Power (kilowatts)" 
)

dev.off()
