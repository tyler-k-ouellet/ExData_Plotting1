library(datasets)

hpc <- read.csv("~/Downloads/household_power_consumption.txt", sep=";", na.strings="?")
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc <- hpc[hpc$Date <= as.Date("2007-02-02") & hpc$Date >= as.Date("2007-02-01"), ]
hpc$Time <- strptime(hpc$Time, format = "%H:%M:%S", tz = "GMT")
hpc$Time <- format(hpc$Time, "%H:%M:%S")

hpc$Date.Time <- with(hpc, paste(Date,Time))
hpc$Date.Time <- strptime(hpc$Date.Time, "%Y-%m-%d %H:%M:%S")

png(filename = "plot3.png",
    width = 480, 
    height = 480,
    bg = "transparent"  
)

with(hpc, plot(Date.Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(hpc, lines(Date.Time, Sub_metering_2, col = "red" ))
with(hpc, lines(Date.Time, Sub_metering_3, col = "blue" ))

legend("topright", 
       legend = names(hpc)[7:9],
       col = c("black","red", "blue"),
       lty = c(1,1,1)
       )

dev.off()
