# : https://www.visualcinnamon.com/portfolio 
# 
# 
# We celebrate Pi-day (3/14) every year at the library. And though it is december, 
# and there is months to the big day, it is not too early to begin planning. This 
# is something we do in the incredibly amounts of time we have left over when all 
# the other tasks that also only take a tiny portion of the day are done.
# In other words, this is something we plan in our weekly lunchbreak.
# 
# Usually Henrik delivers a small talk about Pi. We eat some Pie, and there is 
# much rejoicing.
# 
# But we would like to show something else. A cool visualization perhaps. There 
# are several out there, but it is no fun just to show cool stuff. Its much cooler 
# to understand how it is done.
# 
# One of the visualizaions we found on the net is this. 
# https://www.visualcinnamon.com/portfolio/the-art-in-pi It is made by the 
# extremely talented Nadieh Bremer. Take a look at her page. She does a lot of 
# other cool stuff!
#   
# So. How to replicate this? 
#   
# The idea is to take pi. Draw a line segment from 0,0 in the plane to a new point, 
# determined by the first digit. Then we draw another segment from that point, to 
# a newer point, determined by the second digit in Pi. Continue ad nauseam, or 
# until your computer catches fire. Add colours, and make it look cool.
# 
# First item is to get pi to a million decimal places.
# Read it in, and make a vector containing all the digits.
# I'll begin with a smaller string.

testnumvec <- "3.1415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679"


# Not quite pi. But I can't be bothered figuring out how many digits of pi I should use in order to get all the digits from 0 to 9. I want that to make sure that whatever I do, works on all the digits.

# Next up is getting rid of the period. 

numvec <- gsub("[[:punct:]]", "", testnumvec)



# In Denmark we would use a "," instead of "." This removes all punctuation.

# Now we convert it to a vector with individual digits. And cast them as integers rather than characters.

numvec <- as.integer(unlist(strsplit(numvec,"")))

# We begin a (0,0). The next point is determined by the first digit i pi - 3. 
# The number 3 should determine witch direction, angle, we should move. The new 
# x-value will be cos(f(3)), where f(3) is some function, that converts 3 to the 
# correct angle. That should be some fraction of pi. The new y-value is similarly 
# determined by sin(f(3)).
# 
# What should f(x) be? Imagine a decimal clock, with the ten digits 0 to 9 
# positioned around the circle. In the original 0 is at top, at 12 o'clock. 
# 5 is at 6 o'clock. And the numbers follow the circle clockwise.
# In the unity circle 0 is positioned at 1/2pi. 5 at 1 1/2 pi. 
# So f(0)=1/2pi, f(5)=1 1/2pi. 

# This formula gives us the result we need:
#   5/2*pi - z/5*pi.
# 
# z is the digit in pi. For all xof them, we can calculate the steps we need in this way:

x <- cos(5/2*pi - numvec/5*pi)
y <- sin(5/2*pi - numvec/5*pi)

# So. Beginning at (x0,y0), we calculate the trig functions, add it to (x0,y0) and 
# get (x1,y1). When we continue to do that, we notice, that xi is the cumulative 
# sum of all the calculated x-values. If we calculate the trig functions for all 
# of the digits in pi, and then calculate the cumulative sum, we get all the 
# x-values. Similarly with all the y-values.

# Thats neat, and thanks to Henrik, who pointed this out. We get the cumulative 
# sums easily:
# And we can then get the cumulative sums with:

x <- cumsum(x)
y <- cumsum(y)


# Thats it! There is just a little detail. The first value in x,y is the first 
# step we need to take - or the second point if you will.
# We will need to add a 0 at the start:
  

x <- c(0,x)
y <- c(0,y)


# Thats it! I should now be able to plot it. Lets just do a quick test:
  

plot(x,y, type="l")

# That looks almost like what we need. The most notable difference is that Nadieh 
# only plots the decimals. I include the "3" as well.
# We are going to test this, and it is cumbersome to do all the preceding steps.
# Let's begin with defining the generation of points as a function, that takes a 
# string. In just a little while I'll invoke the magick of ggplot. So it would be 
# convenient that the result is a dataframe:
  

piPoints <- function(piString){
  numbers <- gsub("[[:punct:]]", "", piString)
  numbers <- as.integer(unlist(strsplit(numbers,"")))
  x <- cos(5/2*pi - numbers/5*pi)
  y <- sin(5/2*pi - numbers/5*pi)
  x <- cumsum(x)
  y <- cumsum(y)
  x <- c(0,x)
  y <- c(0,y)
  df <- data.frame(as.integer(c(0,numbers)),x,y)
  colnames(df) <- c("num", "x", "y")
  return(df)
}

# All right. We now have a dataframe with three columns. The number, and the x,y 
# coordinates. We can plot that with ggplot:


df <- piPoints(testnumvec)
library(ggplot2)

ggplot(df, aes(x=x,y=y,group="1"))+
  geom_path(aes(colour=factor(df$num)))

# Weird. Something is wrong. Look at the second linesegment. It goes up and to the 
# right, just as it should, since this segment represents a "1". But the color? 
#   It is green. It should be sorta orangy. The reason is that ggplot looks at the 
# number, and by implication the color, at the origin of the linesegment. Not at 
# the end.
# How to change that? What I really need to do, is shifting the number column one 
# place relative to the x,y pairs.
# Simply done - remove the 0 at the beginning of the num-vector in the function. 
# And the final digits in the x and y vectors. I really don't like it, as it 
# increases the size of the dataframe - but I add an id-column as well. Just a 
# sequential number, to control the colouring:

piPoints <- function(piString){
  numbers <- gsub("[[:punct:]]", "", piString)
  numbers <- as.integer(unlist(strsplit(numbers,"")))
  x <- cos(5/2*pi - numbers/5*pi)
  y <- sin(5/2*pi - numbers/5*pi)
  x <- cumsum(x)
  y <- cumsum(y)
  x <- c(0,x)
  y <- c(0,y)
  id <- 1:(length(y)-1)
  df <- data.frame(as.integer(c(numbers)),x[-length(x)],y[-length(y)], id)
  colnames(df) <- c("num", "x", "y", "id")
  return(df)
}

# Lets take another look:

df <- piPoints(testnumvec)
library(ggplot2)

ggplot(df, aes(x=x,y=y,group="1"))+
  geom_path(aes(colour=factor(num)))

# Now we're there. Two steps are missing: Adding more digits - I would like to 
# get to one million digits. And getting it to look nice.

# Lets try getting to the million. I don't need to calculate pi to a million 
# decimals. I can just download it.
# https://pi2e.ch/blog/2017/03/10/pi-digits-download/#google_vignette
library(readr)
download.file("https://pi2e.ch/blog/wp-content/uploads/2017/03/pi_dec_1m.txt", "notes/pi_dec_lm.txt", mode="wb")
storpi <- read_file("notes/pi_dec_lm.txt")
meget_stor_pi <- read_file("notes/Pi - Dec.txt")
df <- piPoints(meget_stor_pi)
library(ggplot2)

ggplot(df, aes(x=x,y=y,group="1"))+
geom_path(aes(colour=id)) +
  scale_colour_gradient(low="red", high="green")
  #  geom_path(aes(colour=factor(df$num)))
  

# Lets beautify it at bit. theme_bw removes the horrible grey background. 
# coord_fixed(ratio=1) controls the aspect-ratio of the plot. Not really 
# necessary, but in just a short while I'll expand, and would like to compare stuff.
# And in theme() a lot of stuff is set to blank - we need a clean plot.
# Finally - or not quite, I change the colours. http://colorbrewer2.org/ 
# helps with choosing colours. Its targeted at maps. But this is a kind of map. 
# I am, more or less working with continous data. So instead of scale_colour_brewer, 
# I use scale_colour_distiller. It's not quite kosher to use a qualitative scale 
# for this kind of data. But I like the colours, and I really need help choosing 
# them, since I am not a talented designer. 


ggplot(df, aes(x=x,y=y,group="1"))+
geom_path(aes(colour=id)) +
  scale_colour_distiller(type="qual", palette="Set1") +
    theme_bw() + 
  coord_fixed(ratio = 1) +
  theme(line = element_blank(),
        text = element_blank(),
        title = element_blank(),
        legend.position="none",
        panel.border = element_blank(),
        panel.background = element_blank())



# Whats next?
# ====================================
# So. I've done pi to a million decimal places. What about other fundamental mathematical constants?.
# Some of these perhaps?
#   * Square root of 2 (Sqrt(2))
# * Square root of 3 (Sqrt(3))
# * Golden ratio
# * e
# * Natural logarithm of 2 (Log(2))
# * Natural logarithm of 3 (Log(3))
# * Natural logarithm of 10 (Log(10))
# * Apéry's constant (Zeta(3))
# * Lemniscate constant (Lemniscate)
# * Catalan's constant (Catalan)
# * Euler-Mascheroni constant (Euler's Constant)

# And why only a million places? Why not go to a billon?

# I feel the need. The need for speed
# ==================
# This is the writeup. So I did all this, without looking at the original code. 
# In the original, the cumulative sums are calculated differently:

x <- y <- rep(NULL, length(numvec))
x[1] <- 0
y[1] <- 0

for (i in 2:length(piVec)){
    x[i] <- x[(i-1)] + sin((pi*2)*(numvec[i]/10))
    y[i] <- y[(i-1)] + cos((pi*2)*(numvec[i]/10))  
}

# That is nice. It was also the way I tried to do it. I got lost in apply-functions 
# using lag(). That was definitely not the way to do it.
# 
# But is my way faster? I would guess it is, as for-loops in general are not very 
# fast in R. Guessing is not good enough, I need hard data. The way to get it is 
# by measuring the time used. There are several tools for that, and I'll use 
# microbenchmark, since it provides a neat plot.
# 
# You will probably need to install it:

devtools::install_github("olafmersmann/microbenchmarkCore")
devtools::install_github("olafmersmann/microbenchmark")


# Lets run the test.
library(microbenchmark)
testnumvec <- read_file("pi_dec_1m.txt")
numbers <- gsub("[[:punct:]]", "", testnumvec)
numbers <- as.integer(unlist(strsplit(numbers,"")))  
numvec <- numbers
mbm <- microbenchmark({
  x <- cos(5/2*pi - numvec/5*pi)
  y <- sin(5/2*pi - numvec/5*pi)
  x <- cumsum(x)
  y <- cumsum(y)
  x <- c(0,x)
  y <- c(0,y)
},{
  x <- y <- rep(NULL, length(numvec))
  x[1] <- 0
  y[1] <- 0
  for (i in 2:length(numvec)){
    x[i] <- x[(i-1)] + sin((pi*2)*(numvec[i]/10))
    y[i] <- y[(i-1)] + cos((pi*2)*(numvec[i]/10))  
  }
}, times=3

)
levels(mbm$expr) <- c("My way", "Original way")
mbm

autoplot(mbm)


# Thats kinda faster. Not that it makes that much of a difference - "My" method 
# does the one million digits in 0.2 seconds. The original takes a little over 9 
# times as long. Who cares? You are only going to do it once. 2 seconds is not a problem.
# I would however like to make the same plot with a billion digits. I'm not sure 
# I'll even be able to plot it. But a naive guess implies that 1.000 times the 
# number of digits will take 200 seconds, or a little more than 3 minutes to run 
# through. 9 times that is almost half an hour. That is a difference you will notice.