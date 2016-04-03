library(dplyr)
df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df1 <- filter(df, df$Date >= "2007-02-01" & df$Date <= "2007-02-02")
#Plot 1
hist(as.numeric(df1$Global_active_power), 
     main = "Global Active Power", 
     xlab = "Kilowatts",
     col = "red")
dev.copy(png, file = "plot1.png")
dev.off()