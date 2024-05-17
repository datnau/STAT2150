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

#Thursday, May 16:
data = read.csv("C:/Users/ADMIN/OneDrive - EECD EDPE/Documents/STAT2150/LectureSlide/Unit 2/box_vs_violin.csv")
head(data)
boxplot(data$x, data$y)
?vioplot
install.packages("vioplot")
library(vioplot)
vioplot(data$x , data$y)
install.packages("sinaplot")
library(sinaplot)
?sinaplot
sinaplot(data$x , data$y)#does not work

mydata = c(data$x, data$y)
categories  = c(rep("x",200),rep("y,200"))
sinaplot(mydata,categories)

#Histograms (slide 16):
hist(trees$Height)
hist(trees$Height, nclass = 5)
hist(trees$Height, nclass = 10)

#density() function
data = read.csv("C:/Users/ADMIN/OneDrive - EECD EDPE/Documents/STAT2150/LectureSlide/Unit 2/box_vs_violin.csv")
hist(data$x)
#line() adds to an existing plot
lines(density(data$x))
hist(data$x,prob=TRUE)
lines(density(data$x))
hist(data$x,prob = TRUE, ylim = c(0,0.14))
lines(density(data$x)) 

#Overlapping densities:
data = read.csv("C:/Users/ADMIN/OneDrive - EECD EDPE/Documents/STAT2150/LectureSlide/Unit 2/overlapping_densities.csv")
plot(density(data$x))
lines(density(data$x))

mycol1 = rgb(173,216,230,maxColorValue = 255 , alpha = 80)
myco2 = rgb(255,,,maxColorValue = 255 ,alpha = 80)

plot(density(data$x))
lines(density(data))
polygon(density(data$x))
polygon(density(data$x))

data = rock
hist(rock$peri)
hist(rock$area)
qqnorm(rock$peri)
qqnorm(rock$area)

#QQ plot from scratch:
#syntax of qnorm() is qnorm(area to the left, mu = 0, sigma = 1)

datasorted = sort(rock$peri)
length(datasorted)
