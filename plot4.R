library(dplyr)
df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df1 <- filter(df, df$Date >= "2007-02-01" & df$Date <= "2007-02-02")
#Plot 4
par(mfrow = c(2,2), cex = 0.5)

plot(time, 
     df1$Global_active_power, 
     type = "l", 
     xlab = "Day of week", 
     ylab = "Global Active Power", 
     main = "Global Active Power")

plot(time, 
     df1$Voltage, 
     type = "l", 
     xlab = "Day of week", 
     ylab = "Voltage", 
     main = "DANGER DANGER HIGH VOLTAGE")

plot(time, 
     df1$Sub_metering_1, 
     type = "l", 
     col = "green", 
     xlab = "Day of week", 
     ylab = "Sub Mettering")

lines(time, df1$Sub_metering_2,  col = "red")
lines(time, df1$Sub_metering_3,  col = "blue")
legend("topright", 
       legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"), 
       col = c("green", "red", "blue"), lty = 1)

plot(time, 
     df1$Global_reactive_power, 
     type = "l", 
     xlab = "Day of week", 
     ylab = "Global Reactive Power", 
     main = "Global Reactive Power")
dev.copy(png, file = "plot4.png")

dev.off()