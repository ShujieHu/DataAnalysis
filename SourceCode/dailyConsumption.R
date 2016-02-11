#mydata <- read.table('household_power_consumption.txt', sep = ';', header = T, colClasses = "character")

#see the daily usage of the family

res <- array(0, 24)

for (i in 1 : 24) {
    hour <- (i - 1)
    if (hour < 10) {
    	matString <- paste("^0",as.character(hour), ":", sep = "")
    } else {
    matString <- paste("^",as.character(hour), ":", sep = "")
    }
    total <- as.numeric(mydata[grep(matString,mydata[,2]), 3])
    res[i] <- mean(total, na.rm=T)
}

pdf("plot2.pdf")
plot(res, ylab = "Power usage", xlab = "Time (h)", main = "Daily power usage", ylim = c(0,2), xlim = c(0,24))
points(res, col = "blue", type = 'l')
dev.off()
