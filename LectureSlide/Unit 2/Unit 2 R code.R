# Wednesday, May 15:
data = read.csv("baseball.csv")
cor(data$Average,data$HR.AB)
cor(data)
plot(data$Average,data$HR.AB)
pairs(data)

# Slide 8:
# pie() requires input to be frequencies (how many times each category occurs, usually in the sample)
# slide mentions population quantities, so we'll make a pie chart from the population quantities
# since the pie chart will show relative frequencies, we can make up a population size, let's say 100
# Method 1 to create pie chart (directly provide the frequencies):
value = c(14,14,13,24,15,20)
group = c("brown","yellow","red","blue","green","orange")
myMMs = data.frame(value,group)
pie(myMMs$value,labels=myMMs$group) # default colours
pie(myMMs$value,labels=myMMs$group,col=c("tan4","yellow","red","blue","springgreen4","orange"))

# Method 2 to create pie chart (we have a vector with the data and we use table() to get the frequencies from the vector)
data = c(rep("brown",14),rep("yellow",14),rep("red",13),rep("blue",24),rep("green",15),rep("orange",20))
mytable = table(data)
mytable # named vector
pie(mytable) # by default, the labels are taken from the names in the named vector
pie(mytable,col=c("tan4","yellow","red","blue","springgreen4","orange"))

# Need to know:
# 1) first provide the categorical data using one of the two methods, then options like col
# 2) vector lengths must match; that is, length of colours = length(mytable) = length of labels

# Bar chart (slide 9):
data = read.csv("Class.csv")
barplot(table(data$Major))
mytable = table(data$Major)
barplot(mytable)
?barplot
barplot(mytable,horiz=TRUE)

# Slide 13:
install.packages("MASS")
R.Version() # we need 4.4.0
library(MASS)
?survey
data = survey

# Mosaic plots are made from contingency tables
mytable = table(survey$Exer,survey$Smoke) # 2 categorical data vectors
mosaicplot(mytable,xlab="Exercise Status",ylab="Smoking Status",col=2:4)
# 2 is red, 3 is green, 4 is blue
mosaicplot(mytable,xlab="Exercise Status",ylab="Smoking Status",col=2:5)

# Slide 13 - put categories in a logical order:
data = survey
table(data$Exer,data$Smoke)
myfunc = function(x){
  if(x == "None"){
    return("0")
  }
  if(x == "Some"){
    return("1")
  }
  if(x == "Freq"){
    return("2")
  }
}
newvar = sapply(data$Exer,myfunc)
mytable = table(newvar,data$Smoke)
mosaicplot(mytable)
dimnames(mytable) # this is a list and we can access elements of a list by
# which component of the list it is or by the name of that component
dimnames(mytable)$newvar = c("None","Some","Freq")
mosaicplot(mytable,col=2:5)

# Thursday, May 16:
data = read.csv("box_vs_violin.csv")
head(data)
boxplot(data$x,data$y)
?vioplot
install.packages("vioplot")
library(vioplot)
vioplot(data$x,data$y)
install.packages("sinaplot")
library(sinaplot)
?sinaplot
sinaplot(data$x,data$y) # doesn't work

mydata = c(data$x,data$y)
categories = c(rep("x",200),rep("y",200))
sinaplot(mydata,categories)

# Histograms (slide 16):
hist(trees$Height)
hist(trees$Height,nclass=5) # R ignores nclass and gives you something close to what you ask for
hist(trees$Height,nclass=10)

# For discrete data, do not use a histogram
# Flip a coin 10 times, repeat that 20 times.
# X = # of heads on each series of 10 flips
# possible values of X: 0, 1, 2, ..., 10
x = rbinom(20,10,0.5)
length(x) # 20
x 
# do not use histogram since this is discrete
barplot(table(x))
x = rbinom(200,10,0.5)
barplot(table(x))


# density() function
data = read.csv("box_vs_violin.csv")
hist(data$x)
# lines() adds to an existing plot
lines(density(data$x))
hist(data$x,prob=TRUE)
lines(density(data$x))
hist(data$x,prob=TRUE,ylim=c(0,0.14))
lines(density(data$x))

# Overlapping densities:
data = read.csv("overlapping_densities.csv")
plot(density(data$x))
lines(density(data$y))

mycol1 = rgb(173,216,230,maxColorValue=255,alpha=80)
mycol2 = rgb(255,192,203,maxColorValue=255,alpha=80)

plot(density(data$x), xlim=c(-4,7))
lines(density(data$y))
polygon(density(data$x),col=mycol1)
polygon(density(data$y),col=mycol2)

data = rock
hist(rock$peri)
hist(rock$area)
qqnorm(rock$peri)
qqline(rock$peri)
qqnorm(rock$area)
qqline(rock$area)

# QQ plot from scratch:
# syntax of qnorm() is qnorm(area to the left, mu = 0, sigma = 1)
qnorm(0.025)

datasorted = sort(rock$peri)
length(datasorted)
n = length(datasorted)
k = 1:n
k
probs = (k - 0.5) / n
# Alternatively:
probs2 = numeric(48)
for(i in 1:48){
  probs2[i] = (k[i] - 0.5) / n
}
probs
probs2
critvalues = qnorm(probs)
critvalues # Expected
plot(critvalues,datasorted) # Observed vs Expected

q1data = quantile(datasorted,0.25)
q3data = quantile(datasorted,0.75)
q1crit = quantile(critvalues,0.25)
q3crit = quantile(critvalues,0.75)
b1 = (q3data - q1data) / (q3crit - q1crit) # change in Y / change in X
b0 = mean(datasorted) - b1*mean(critvalues) # ybar - b1*xbar
abline(a = b0, b = b1) # plots a line with given slope & intercept

# Compare qqnorm() to manual method:
par(mfrow=c(2,1)) # breaks the graphical window into 2 rows and 1 column
qqnorm(rock$peri)
qqline(rock$peri)
plot(critvalues,datasorted)
abline(a = b0, b = b1)
dev.off() # go back to regular graphical window

# Preview of part of May 21 lecture:
data = read.csv("baseball.csv")
# For the variable data$HR.AB, let's see what the QQ plot shows us.
qqnorm(data$HR.AB)
qqline(data$HR.AB)
# What we see is that in both tails of the distribution (the smallest data values
# and the largest data values), the points are ABOVE the reference line
# When points in both tails are ABOVE the reference line, that indicates the
# distribution is skewed to the RIGHT. We can also see this skewness in the
# histogram:
hist(data$HR.AB)

# The following line of code will generate some data that is LEFT-skewed
# (You do not need to understand the code, but you can just see the histogram
# to see that the generated data is left-skewed)
x = rbeta(1000,8,2)
hist(x)
# Now let us look at the QQ plot for this data:
qqnorm(x)
qqline(x)
# We see that in both tails of the distribution, the points are BELOW the
# reference line. When points in both tails are BELOW the reference line,
# that indicates the distribution is skewed to the LEFT.
