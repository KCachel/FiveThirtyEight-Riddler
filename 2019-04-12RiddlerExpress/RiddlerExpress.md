This week's Riddler Express is a nifty clock problem.  

>You purchase a new clock but are dismayed to realize that both of its hands are identical. At first, it seems it’s going to be impossible to tell the time because you don’t know which hand is for the minutes and which is for the hours.

>However, you realize you don’t need to know which is which for every time — for example, when it’s 12:30, the minute hand will be exactly on the 6 and the hour hand will be halfway between the 12 and the 1. It can’t be the other way around because if the hour hand were exactly on 6, the minute hand would have to exactly on 12, which it’s not. So you know what time it is.

>How many times during the day will you not be able to tell the time?

See <https://fivethirtyeight.com/features/how-many-times-a-day-is-a-broken-clock-right/> for the details.  

# My solution: 

I chose to solve this problem graphically. I created lines for a "normal clock" (minute hand is longer than hour hand) and what I call a "flipped clock". The flipped clock I like to imagine you literally taking the hands off the clock and cutting the minute hand to be the short one. Thus, the minute hand is the hour hand and vice versa. Confusing! But hang on.

Next, I plotted those two lines. What I am actually plotting is the degrees around the clock for each hand at minute intervals.* I chose this since it's visually easier to intuit the intersections. The X axis shows the degrees of the hour hand, and the Y axis the degrees of the minute hand. Intersections of the lines mean that we can't tell what time it is. 

## *Interpreting the plot*

You can count/see there are twelve "lines" of each color. They intersect in a checkboard pattern. Naively, that means we have 12 * 12 = 144 intersections. But look closely the top right corner will not intersection if you "connect the dots". This is because I am plotting a 12 hour interval and it ends at 11:59. So let's make that 144 - 1 = 143 intersections. Now look at the green line intersections on those points mean the two clock hands overlap on the clock. You can always tell the time when the hands overlap. So we are left with 143 - 11 = 132 intersections in a 12 hour period. We scale that up to a 24 hour period and viola! 264 intersections means there are 264 times in a day that you cannot tell what time it is by looking at a clock with the same length minute and hour hands.

<img src="https://github.com/KCachel/FiveThirtyEight-Riddler/blob/master/2019-04-12RiddlerExpress/RiddlerExpress_4_12.png" width="750">


*Note: Had you simplified the problem to assume the hands of the clock move at "minute" bins, you could say you would always be able to tell the time. But that's a different problem!
