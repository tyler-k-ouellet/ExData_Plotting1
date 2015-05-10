library(datasets)

hpc <- read.csv("~/Downloads/household_power_consumption.txt", sep=";", na.strings="?")
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc <- hpc[hpc$Date <= as.Date("2007-02-02") & hpc$Date >= as.Date("2007-02-01"), ]
hpc$test <- strptime(hpc$Time, format = "%H:%M:%S", tz = "GMT")
hpc$Time <- format(hpc$test, "%H:%M:%S")
hpc$test <- NULL

hpc$Date.Time <- with(hpc, paste(Date,Time))
hpc$Date.Time <- strptime(hpc$Date.Time, "%Y-%m-%d %H:%M:%S")

png(filename = "plot4.png",
    width = 480, 
    height = 480,
    bg = "transparent"
)

par(mfrow = c(2,2))

# Plot 1
with(hpc, plot(Date.Time,Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

# Plot 2
with(hpc, plot(Date.Time, Voltage, type = "l", xlab = "datetime"))

# Plot 3
with(hpc, plot(Date.Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(hpc, lines(Date.Time, Sub_metering_2, col = "red" ))
with(hpc, lines(Date.Time, Sub_metering_3, col = "blue" ))

legend("topright", 
       legend = names(hpc)[7:9],
       col = c("black","red", "blue"),
       lty = c(1,1,1),
       bty = "n"
)

# Plot 4
with(hpc, plot(Date.Time, Global_reactive_power, type = "l", xlab = "datetime"))


dev.off()
