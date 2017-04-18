household <- read.table('data/household_power_consumption.txt',sep = ';',header=TRUE,na.strings = '?')
household_selected <- subset(household, Date == '1/2/2007' | Date == '2/2/2007')

household_selected$datetime <- paste(household_selected$Date, household_selected$Time, sep=" ")
household_selected$datetime <- strptime(household_selected$datetime, "%d/%m/%Y %T")
household_selected$wdays <- weekdays(household_selected$datetime)

png(file = 'plot2.png', width = 480, height = 480)
with(household_selected,plot(datetime,Global_active_power, type='l',xlab='',
     ylab='Global Active Power (kilowatts)'))
dev.off()
