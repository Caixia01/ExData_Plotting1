household <- read.table('data/household_power_consumption.txt',sep = ';',header=TRUE,na.strings = '?')
household_selected <- subset(household, Date == '1/2/2007' | Date == '2/2/2007')

household_selected$datetime <- paste(household_selected$Date, household_selected$Time, sep=" ")
household_selected$datetime <- strptime(household_selected$datetime, "%d/%m/%Y %T")
household_selected$wdays <- weekdays(household_selected$datetime)

png(file = 'plot4.png', width = 480, height = 480)

par(mfcol=c(2,2))
with(household_selected,plot(datetime,Global_active_power,type='l',xlab='',
                             ylab = 'Global Active Power'))

with(household_selected,plot(datetime,Sub_metering_1, type='l',xlab='',
                             ylab='Energy sub matering'))
lines(household_selected$datetime,household_selected$Sub_metering_2, type='l',
      col='red')
lines(household_selected$datetime,household_selected$Sub_metering_3, type = 'l',
      col = 'blue')
legend('topright',lty = 1, lwd = 2.5, col = c('black','red','blue'),legend = c('Sub_metering_1',
                                                                               'Sub_metering_2',
                                                                               'Sub_metering_3'))
with(household_selected,plot(datetime,Voltage,type='l'))

with(household_selected,plot(datetime,Global_reactive_power,type='l'))
dev.off()
