library(tidyverse)
#Split the clock into 360 degrees, the hour hand moves 0.5 degrees a minute
twelveHr_HourHandVector <- seq(0,360, by=0.5)

#Make a vector for the daily degree location of the hour hand once a minute
#Remember that we only want to count noon once!
twentyfourHr_HourHandVector <- c(twelveHr_HourHandVector,
                                 twelveHr_HourHandVector[2:length(twelveHr_HourHandVector)])

#Split the clock into 360 degrees, the minute hand moves 6 degreees a minute
oneHr_MinuteHandVector <- seq(0,360, by = 6)

#Make a vector for the daily degree location of the minute hand once a minute
#Remember that we only want to count top of the hour once!
twentyfourHr_MinuteHandVector <- c(oneHr_MinuteHandVector,#hour1
                                   oneHr_MinuteHandVector[2:length(oneHr_MinuteHandVector)],oneHr_MinuteHandVector[2:length(oneHr_MinuteHandVector)],
                                   oneHr_MinuteHandVector[2:length(oneHr_MinuteHandVector)],oneHr_MinuteHandVector[2:length(oneHr_MinuteHandVector)],
                                   oneHr_MinuteHandVector[2:length(oneHr_MinuteHandVector)],oneHr_MinuteHandVector[2:length(oneHr_MinuteHandVector)],
                                   oneHr_MinuteHandVector[2:length(oneHr_MinuteHandVector)],oneHr_MinuteHandVector[2:length(oneHr_MinuteHandVector)],
                                   oneHr_MinuteHandVector[2:length(oneHr_MinuteHandVector)],oneHr_MinuteHandVector[2:length(oneHr_MinuteHandVector)],#hour11
                                   oneHr_MinuteHandVector[2:length(oneHr_MinuteHandVector)],oneHr_MinuteHandVector[2:length(oneHr_MinuteHandVector)],
                                   oneHr_MinuteHandVector[2:length(oneHr_MinuteHandVector)],oneHr_MinuteHandVector[2:length(oneHr_MinuteHandVector)],
                                   oneHr_MinuteHandVector[2:length(oneHr_MinuteHandVector)],oneHr_MinuteHandVector[2:length(oneHr_MinuteHandVector)],
                                   oneHr_MinuteHandVector[2:length(oneHr_MinuteHandVector)],oneHr_MinuteHandVector[2:length(oneHr_MinuteHandVector)],
                                   oneHr_MinuteHandVector[2:length(oneHr_MinuteHandVector)],oneHr_MinuteHandVector[2:length(oneHr_MinuteHandVector)],
                                   oneHr_MinuteHandVector[2:length(oneHr_MinuteHandVector)],oneHr_MinuteHandVector[2:length(oneHr_MinuteHandVector)],
                                   oneHr_MinuteHandVector[2:length(oneHr_MinuteHandVector)])

#stop confusing 360 and 0 degrees and standardize on "0"
twentyfourHr_HourHandVector <- replace(twentyfourHr_HourHandVector, twentyfourHr_HourHandVector==360, 0)
twentyfourHr_MinuteHandVector <- replace(twentyfourHr_MinuteHandVector, twentyfourHr_MinuteHandVector==360, 0)

#Do some plotting of each of the clock hands
plot(twentyfourHr_MinuteHandVector)

plot(twentyfourHr_HourHandVector)

#Create a dataframe for the clock hands called "clock"
clock <- data.frame(twentyfourHr_HourHandVector,twentyfourHr_MinuteHandVector )