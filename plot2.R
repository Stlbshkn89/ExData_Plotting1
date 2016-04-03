library(dplyr)
df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df1 <- filter(df, df$Date >= "2007-02-01" & df$Date <= "2007-02-02")
#Plot 2
time <- paste(df1$Date, df1$Time)
time <- strptime(time, format = "%Y-%m-%d %H:%M:%S")
plot(time, 
     df1$Global_active_power, 
     type = "l", 
     xlab = "Day of week", 
     ylab = "Global Active Power", 
     main = "Global Active Power")
dev.copy(png, file = "plot2.png")
dev.off()
