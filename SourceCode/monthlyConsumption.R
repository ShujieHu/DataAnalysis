mydata <- read.table('household_power_consumption.txt', sep = ';', header = T, colClasses = "character")

#From 01/07 - 01/29
#Calculate column 3 average to estimate the monthly usage

res <- array(0, 36)

for (i in 1:3) {
    year <- 2006 + i
    for (j in 1:12) {
        mon <- j
	matString <- paste("/", as.character(mon), "/", as.character(year), sep = "")
        total <- as.numeric(mydata[grep(matString,mydata[,1]), 3])
        res[(i-1)*12 + j] <- mean(total, na.rm=T)
    }
}

pdf("plot.pdf")
plot(res, xlab="month", ylab="Power", ylim = c(0,2), main = "The power usage from 2007 to 2009", )
points(res, col = "blue", type = 'l')
dev.off()
