household <- read.table('data/household_power_consumption.txt',sep = ';',header=TRUE,na.strings = '?')
household_selected <- subset(household, Date == '2/1/2007' | Date == '2/2/2007')

png(file = 'plot1.png', width = 480, height = 480)
hist(household_selected$Global_active_power, col = 'red',
     xlab='Global Active Power (kilowatts)', 
     main = 'Global Active Power')
dev.off()
