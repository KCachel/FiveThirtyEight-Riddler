library(tidyverse)
library(plyr)
library(ggthemes)
library(ggdark)
library(LaCroixColoR)
library(wesanderson)
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

#Do some renaming to clean things up
clock <- rename(clock, c("twentyfourHr_HourHandVector"="hourHand", "twentyfourHr_MinuteHandVector"="minuteHand"))

#let's add a variable time so that we can see what time corresponds to what positions of our clock hands
clock$time <- format( seq.POSIXt(as.POSIXct(Sys.Date()), as.POSIXct(Sys.Date()+1), by = "1 min"),
        "%H%M", tz="GMT")

#Now we can do things like "check" our work
clock[36,]
clock[1036,]

#Things are getting serious, now we need to flip our hands
clock$flipped_hourHand <- clock$minuteHand
clock$flipped_minuteHand <- clock$hourHand


#Alright now we need to understand when the two hands are equal to the flipped two hads
clock_count <- mutate(clock, equal = (hourHand == flipped_hourHand & minuteHand ==flipped_minuteHand)) %>%
  group_by(equal)

#So what's the count
tally(clock_count)


normalclock <- clock
normalclock$type <- "Normal hand orientation"
normalclock$time <- NULL
normalclock$flipped_hourHand <- NULL
normalclock$flipped_minuteHand <- NULL

flippedclock <- clock
flippedclock$type <- "Flipped hand orientation"
flippedclock$hourHand <- clock$minuteHand
flippedclock$minuteHand <- clock$hourHand
flippedclock$time <- NULL
flippedclock$flipped_hourHand <- NULL
flippedclock$flipped_minuteHand <- NULL

plot_clock <- rbind(flippedclock, normalclock)

hourHand <- seq(0,350, by= 1)
minuteHand<- seq(0,350, by= 1)

same_poistiondf <- data.frame(hourHand, minuteHand)
same_poistiondf$type <- "Hands in same position"

plot_clock <- rbind( same_poistiondf, plot_clock)


pal <- lacroix_palette("PassionFruit", n = 3, type = "continuous")
#pal <- wes_palette(3, name = "FantasticFox1", type = "continuous")
ggplot(plot_clock, aes(hourHand, minuteHand, color = type)) + 
  geom_point()+
  dark_mode(theme_fivethirtyeight(base_family = "Courier New", base_size = 12))+
  scale_x_continuous(breaks = seq(0,360, by=30))+
  scale_y_continuous(breaks = seq(0,360, by=30))+
  scale_color_manual(values = pal)+
  labs(title = "Graphical representation: 12 hours of a clock \n with the same length minute and hour hands"
      ) +
  theme(legend.position = "bottom",
        axis.text.x=element_text(face = "bold"),
        axis.text.y = element_text( face = "bold"),
        legend.text= element_text( size = 10, face = "bold"),
        plot.title = element_text( face = "bold"),
        )+
  theme(axis.title = element_text()) +
  ylab("Minute hand degrees") +
  xlab("Hour hand degrees")


  

