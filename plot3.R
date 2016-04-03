library(dplyr)
df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df1 <- filter(df, df$Date >= "2007-02-01" & df$Date <= "2007-02-02")
#Plot 3
plot(time, 
     df1$Sub_metering_1, 
     type = "l", 
     col = "green", 
     xlab = "Day of week", 
     ylab = "Sub Mettering")
lines(time, df1$Sub_metering_2,  col = "red")
lines(time, df1$Sub_metering_3,  col = "blue")
legend("topright", 
       legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"), 
       col = c("green", "red", "blue"), lty = 1)
dev.copy(png, file = "plot2.png")
dev.off()