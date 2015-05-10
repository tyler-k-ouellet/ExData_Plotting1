library(datasets)

hpc <- read.csv("~/Downloads/household_power_consumption.txt", sep=";", na.strings="?")
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc <- hpc[hpc$Date <= as.Date("2007-02-02") & hpc$Date >= as.Date("2007-02-01"), ]
hpc$test <- strptime(hpc$Time, format = "%H:%M:%S", tz = "GMT")
hpc$test <- format(hpc$test, "%H:%M:%S")
hpc$test <- NULL

hpc$Date.Time <- with(hpc, paste(Date,Time))
hpc$Date.Time <- strptime(hpc$Date.Time, "%Y-%m-%d %H:%M:%S")

png(filename = "plot2.png",
    width = 480, 
    height = 480,
    bg = "transparent" 
)

with(hpc, plot(Date.Time,Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))


dev.off()
