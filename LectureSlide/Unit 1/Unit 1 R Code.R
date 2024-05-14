# Monday, May 6:
1 + 1
c(1,2,4) # does not store the vector in the environment
x = c(1,2,4) # does store the vector
1:100
101:200
5 - 3
5*4
20/3
2^5

# Generate 50 heights, assuming heights follow a 
# normal distribution with mean 65 and std dev. 3
data = rnorm(50,65,3)
hist(data)
data = rnorm(500,65,3)
hist(data)
?rnorm
?hist

x = 1
y = 3

a = "hello"
b = c("hello","hi")
tf = c(TRUE,FALSE,FALSE)
simple.command = "welcome"
simple_command = "welcome"
simplecommand = "welcome"
simpleCommand = "welcome"
simple.command # equivalent to print(simple.command)

# Tuesday, May 7:
cars
?cars
pressure

x = 4:6
x + 2
x*2
x^2


x = 4:6
y = numeric(3) # another way to initialize y is y = double(3)
for(i in 1:3){
  y[i] = x[i]^2
}

x = 11:20
x
x[2]
x[2:4]
# What if I want to access the odd indices of x?
?seq
seq(1,10,2)
seq(from=1,to=10,by=2)
x[seq(1,10,2)]

# Access the 1st and 7th elements of x:
x[c(1,7)]

x = 11:20
x[11] = 30
x

?matrix
matrix(1:9)
matrix(1:9,nrow=3)
mymat = matrix(1:9,nrow=3,byrow=TRUE)
mymat[2,3]
# To get the 2nd row of mymat:
mymat[2,]
# To get the 2nd column of mymat:
mymat[,2]

mymat2 = matrix(NA,nrow=2,ncol=5)
mymat2
mymat2[1,4] = 20
mymat2

students = 1:3
grades = c("A","B","C")
data.frame(students,grades)
mydf = data.frame(students,grades)
# To access grades column of mydf:
mydf$grades
mydf[,2]
colnames(mydf)

# Two ways to make an R list:
# Method 1:
mylist = vector("list",length=2)
mylist
mylist[[1]] = 1:5
mylist[[2]] = rep("A",6)
mylist
mean(mylist[[1]])

# Wednesday, May 8:
# Method 2 to make a list (the length of the list
# is not predefined):
mylist2 = list()
mylist2
mylist2[[1]] = 1:5
mylist2[[2]] = rep("A",6)
mylist2

length(mylist2[[2]])

# Slide 16 alternative:
a.vec = c(1,1.4,2,4,6.3)
a.vec
a.matrix = matrix(4,3,6,4) # cannot do this
a.matrix = matrix(c(4,3,6,4),nrow=2)
a.matrix

# Create a vector "data" with 5 elements such that
# each element contains the square of its index, using
# a for() loop
data = numeric(5)
for(i in 1:5){
  data[i] = i^2
}
# Can do the same as above without a for() loop:
x = 1:5
data = x^2 # data was not initialized 

# We don't need to initialize in these cases:
myvec = c(1,1.4,2,4,6.3)
myvec
myvec = 1:9
myvec
myvec = seq(from=1,to=5,by=2)
myvec
myvec = rep(4,6)
myvec

# Instead of 1:5, we can use other vectors created
# on-the-fly:
data = numeric(5)
for(i in 1:5){
  data[i] = i^2
}

data = numeric(5)
data
for(i in seq(1,5,2)){
  data[i] = i^2
}
data

data = numeric(5)
data
for(i in c(1,3,4)){
  data[i] = i^2
}
data

myvec = 101:110
length(myvec)

students = 1:3
grades = c("A","B","C")
mydf = data.frame(students,grades)
length(mydf$students)

mymat = matrix(1:9,nrow=3)
dim(mymat) #output is a vector of length 2
dims = dim(mymat)
nrow(mymat)
ncol(mymat)
# Eauivalent to nrow(mymat):
dim(mymat)[1]
# Or:
dims = dim(mymat)
dims[1]

students = 1:3
grades = c("A","B","C")
mydf = data.frame(students,grades)
dim(mydf)
nrow(mydf)
ncol(mydf)

# which() requires a logical input (one T/F or multiple T/F)
# output of which() is the indices of the input that are
# true
which(c(TRUE,FALSE,TRUE))

x = rnorm(100,0,1)
x
x < (-1)
which(x < -1)
length(which(x < -1))/100 # proportion of x values that are
# less than -1 (68-95-99.7% rule says this should be
# approx 16%)

x = rnorm(1e6,0,1)
length(which(x < -1))/1e6

myvec = 101:110
# Which indices of myvec are odd?
# odd numbers have a remainder of 1 when divided by 2
# even numbers have a remainder of 0 when divided by 2
# 5 and 1 are equivalent in mod 2
# 4 and 2 are equivalent in mod 2
myvec%%2
myvec%%2 == 1 # double = sign checks equality (output is
# trues and falses)
which(myvec%%2) # error because myvec%%2 is not logical
which(myvec%%2 == 1) # returns c(1,3,5,7,9)
# Obtain the elements of myvec that are odd:
myvec[which(myvec%%2 == 1)]

mymat = matrix(1:6,nrow=2)
mymat
t(mymat)

# matrix multiplication
# [1 2] [3 4
#        5 6]
# (1,2) has dimensions 1x2
# the matrix has dimensions 2x2
myvec = c(1,2)
myvec
t(myvec)%*%matrix(c(3,4,5,6),nrow=2,byrow=TRUE)

abs(-3.4)

# cbind() and rbind() take vectors and put them together
# to make a matrix
# cbind() binds the vectors as one vector then the next one
# as a new column
# rbind() binds the vectors as one vector then the next one
# as a new row

a = c(1,2)
b = c(3,4)
mymat = cbind(a,b)
mymat
mymat2 = rbind(a,b)
mymat2
# To get the 2nd row and 2nd column:
mymat2[2,2] # this is showing a named vector as the ouput
# or:
mymat2["b",2]

mymat = matrix(1:12,nrow=3)
mymat
cbind(mymat,c(3,7,1))
cbind(mymat,c(3,7))

# rm() removes objects from the environment
x = 3
rm(x)

sqrt(9)

?log
log(10) # not equal to 1 since this is actually natural log

# log (a^b) = b* log(a)
# ln (e^x) = x*ln(e) = x

exp(1)
log(exp(1))
exp(2)

# Thursday, May 9:
sum(1:5)
x = c(2,7,8)
sum(x)
sum(1,3,4)

mean(1,2,6)
?mean
x = c(1,2,6)
mean(x)

median(c(1,2,6,3))
median(c(1,5,9))
median(c(1,5,1000))

min(1:5)
max(1:5)

x = c(10,5,1,3)
sort(x)

# order() tells you which elements of the input vector need to be
# 1st, 2nd, etc. in order sort the input vector
order(x)
# output is c(3,4,2,1)
# 3 means position 3 of the input vector is where the smallest value is
# 4 means position 4 of the input vector is where the next smallest value is
# 2 means position 2 of the input vector is where the next smallest value is
# 1 means position 1 of the input vector is where the next smallest value is

# order(x) returns numbers in 1:length(x)

x[order(x)] # same as sort(x)

students = 1:6
grades = rep(c("A","B","C"),2)
df = data.frame(students,grades)
df
df[,2] #2nd column of the data frame
order(df[,2]) # c(1,4,2,5,3,6) this is the order of rows that we want

df[order(df[,2]),] # data frame is sorted with A students first, then B students, etc

round(3.5)
round(3.9)
round(3.1)
?round
round(3.72,digits=1)
round(3.77,digits=1)

x = 4:6
counts = table(x) # output is a NAMED vector
pie(counts)
counts/sum(counts) # gives proportions
?pie

expression = paste(names(counts),"\n",counts/sum(counts)*100,"%")
pie(counts,labels=expression)

expression = paste(names(counts),"\n",round(counts/sum(counts)*100,2),"%")
pie(counts,labels=expression)

install.packages("MASS")
install.packages("igraph")
library(igraph)
plot(make_full_graph(5))

data()
mtcars
?mtcars

mydata = read.csv("MyDataCSV.csv")
?read.csv

# To store R objects as data files
save(counts,file="counts.RData")
rm(counts)
load("counts.RData")

x = rnorm(1000,0,1)
hist(x)

jpeg("histogram.jpeg")
hist(x)
dev.off()

pdf("histogram.pdf")
hist(x)
dev.off()


y = 3

myfunc = function(x){
  
}

my.mean = function(x){
  mysum = sum(x)
  n = length(x)
  return(mysum/n)
}

my.mean(1:10)

my.mean = function(x){
  mysum = sum(x)
  n = length(x)
  ans = mysum/n
  return(ans)
}
my.mean(1:10)


my.mean = function(x){
  mysum = sum(x)
  n = length(x)
  ans = mysum/n
  ans
}
my.mean(1:10)
my.mean(1:3)

my.mean = function(x){
  mysum = sum(x)
  print(mysum) # just for troubleshooting
  n = length(x)
  print(n) # just for troubleshooting
  ans = mysum/(n-1)
  ans
}
my.mean(1:3)
# Troubleshooting
x = 1:3
# copy the lines of code from inside the function and check what's
# happening
mysum = sum(x)
mysum
n = length(x)
n
ans = mysum/(n-1)
ans

# Monday, May 13:

# Last line in the body of a function gets returned unless it is
# an assignment

my.mean = function(x){
  mysum = sum(x)
  n = length(x)
  ans = mysum/n
  ans
}

my.mean(1:10)

my.mean = function(x){
  mysum = sum(x)
  n = length(x)
  ans = mysum/n # cannot have assignment as the last line
}
my.mean(1:10)

my.mean = function(x){
  mysum = sum(x)
  n = length(x)
  ans = mysum/n
  ans
}
# mysum, n & ans do not show up in the environment
# these are called LOCAL variables

mysum = sum(x)
my.mean = function(x){
  n = length(x)
  ans = mysum/n
  ans
}
my.mean(1:10) # works just by accident

# All objects referred to in a function must be either (1) arguments
# or (2) objects created inside the function

# Correct syntax of the function:
my.mean = function(x){
  mysum = sum(x)
  n = length(x)
  ans = mysum/n
  ans
}

# Bad convention: naming a function the same name as a built-in function
mean = function(x){
  mysum = sum(x)
  n = length(x)
  ans = mysum/(n-1)
  ans
}
mean(1:10) # 6.11 (wrong answer)
rm(mean)
mean(1:10) # now use built-in mean function

mysum = function(a=1,b){
  a + b
}
mysum(3,6) # a = 3 overwrites the a = 1 default
mysum(b=6) # uses a = 1 default value
mysum(6) #uses 6 for a, no default value for b, so error


# Alternative way of doing slide 33
# instead of a vector with two components, 
# let's use two arguments
diffs = function(x=1,y=2){
  return(y-x)
}
new.fun = function(x=1,y=2){
  temp = diffs(x,y)
  return(exp(temp))
}
new.fun(6,3)

y = 3
z = 5
z > 1
(z > 1) & (z < 4)
(z > 1) | (z < 4)
y < z
!(y < z)
y == z
y != z
y < 3
y <= 3

y<-2 # will set y equal to 2 (using arrow as an assignment)
y < (-2)

x = 1:9
x < 4

mtcars # built-in
mtcars$cyl == 8
# Subset mtcars to show only cars that are 8-cylinder:
# Instead of specifying the qualified row numbers, we can use T/F
# If T, then that row will be kept; if F, then that row will not be kept
mtcars[mtcars$cyl == 8,]
nrow(mtcars[mtcars$cyl == 8,])
nrow(mtcars)

# Subset mtcars to show all cars that are both 8-cylinder and
# manual transmission
mtcars[(mtcars$cyl == 8) & (mtcars$am == 1),]

# Slide 35:
# ifelse() syntax:
# ifelse(condition,output if the condition is true,
# output if the condition is false)

# if...else syntax:
if(1 < 2){
  w = 3
} else{
  w = 2
}

# Instead of using else, you can use multiple "if"s:
if(1 < 2){
  
}
if (1 >= 2){
  
}
# Example of multiple conditions:
if(1 < 2){
  
} else if(1 == 2){
  
} else{
  
}
# Or you can have multiple "else if" groups


# Slide 35:
cond.function = function(x){
  if(x > 0){
    print("Non-negative number")
  } else{
    print("Negative number")
  }
}
cond.function(-2)
cond.function(2)

# Nested if statements
nested_if = function(x){
  if(x < 5){
    if(x < 4){
      print("x is less than 4")
    } else{
      print("x is in [4,5)")
    }
  } else{
    print("x is in [5,infinity)")
  }
}
nested_if(3)
nested_if(5)
nested_if(4.5)

# Make a function that finds the minimum element and maximum element of
# a matrix & the function reports if the maximum is larger than 100

minmax = function(A){
  minele = min(A)
  maxele = max(A)
  return(c(minele,maxele))
  if(maxele > 100){
    return("Maximum element is larger than 100")
  }
}
# this function has two return statements
# after the first return() is encountered, the function must end
mymat = matrix(2:101,nrow=5)
minmax(mymat)


minmaxnew = function(A){
  minele = min(A)
  maxele = max(A)
  print(c(minele,maxele))
  if(maxele > 100){
    print("Maximum element is larger than 100")
  }
}
mymat = matrix(2:101,nrow=5)
minmaxnew(mymat)
mymat2 = matrix(1:100,nrow=5)
minmaxnew(mymat2)

minmaxnew2 = function(A){
  minele = min(A)
  maxele = max(A)
  part1 = c(minele,maxele)
  if(maxele > 100){
    part2 = "Maximum element is larger than 100"
  }
  mylist = list()
  mylist[[1]] = part1
  mylist[[2]] = part2
  mylist
}
mymat = matrix(2:101,nrow=5)
minmaxnew2(mymat)
myoutput = minmaxnew2(mymat)

# Tuesday, May 14:
# Alternative to the for() loop on slide 37:
x = 1:10
x^2

# Double for() loop example (filling in a matrix - for example, a
# multiplication table)
A = matrix(nrow=10,ncol=10)
for(i in 1:10){
  for(j in 1:10){
    A[i,j] = i*j
  }
}
A

# Example using for() with if() statements:
x = c(-1,2,-4)
# Take the square root of nonnegative values of x. If a component of x
# is negative, then keep it unchanged. Store the results in y.
y = numeric(3) # y = numeric(length(x))
for(i in 1:3){
  if(x[i] >= 0){ # common mistake: if(x >= 0); x >= 0 contains 
    # multiple T/F; we need a singular T/F inside if()
    y[i] = sqrt(x[i])
  } else{
    y[i] = x[i]
  }
}
y

# Making the x >= 0 error:
y = numeric(3) # y = numeric(length(x))
for(i in 1:3){
  if(x >= 0){ # common mistake: if(x >= 0); x >= 0 contains 
    # multiple T/F; we need a singular T/F inside if()
    y[i] = sqrt(x[i])
  } else{
    y[i] = x[i]
  }
}
y

x = 1:10
# Method 1 to find sqrt:
y = sqrt(x)
y
# Method 2 to find sqrt:
y = numeric(10)
for(i in 1:10){
  y[i] = sqrt(x[i])
}
y
# 3rd method:
y = sapply(x,sqrt)
y
# sapply() syntax: sapply(object,func); the object is typically a vector
# or we can use a list, the output is a vector

# For squaring a vector x = 1:10:
# Method 1:
y = 1:10
z = y^2
z
# Method 2:
z = numeric(10)
for(i in 1:10){
  z[i] = y[i]^2
}
z

# Method 3:
myfunc = function(x){
  x^2
}
z = sapply(y,myfunc)
z

mylist = list()
mylist[[1]] = 1:10
mylist[[2]] = 11:20
sapply(mylist,sum)
lapply(mylist,sum) # output is a list instead of output being a vector

x = matrix(101:120,nrow=4)
x
?apply
apply(x,1,mean)
apply(x,2,mean)
apply(x,1,sd)
apply(x,2,sd)

# while() loops:
# syntax: while(condition); the condition must be a singular T or F

while(1 < 2){
  x = 3
}

# We would like to construct a vector of squared integers (call it x)
# using a while() loop and stop adding elements to x after
# one perfect square over 200 is reached
?append
x = 1:3
append(x,5)
append(x,7)
x = append(x,5)

x = 1
i = 2
while(x[length(x)] < 200){
  x = append(x,i^2)
  i = i + 1
}
x

# If I don't increment (i = i + 1):
x = 1
i = 2
while(x[length(x)] < 200){
  x = append(x,i^2)
}
x


x = 1
i = 2
while(x[length(x)] < 200){
  x = append(x,i^2)
  i = i + 1
}
x
# Looking at this code sequentially:
x = 1
i = 2
x[length(x)] = 1 # 1 < 200; x = c(1)
x = append(x,i^2) # x = c(1,4)
i = i + 1 # updates i to 3
x[length(x)] = 4 # 4 < 200
x = append(x,i^2) # x = c(1,4,9)

# Negative indexing:
x = 11:17
x[6]
x[0]
x[-1] # remove the first component of x (print what the updated x will look like)
x = x[-1] # this is actual removal
x
x = 11:17
x[5:7]
x[c(1,2,7)]
x[-5:-7]
x[-c(1,2,7)]

mtcars[1:4,] # Rows 1-4 of mtcars
head(mtcars) # First 6 rows
data = mtcars


# Google search: how to make a table in r markdown site:stackexchange.com
# Google search: how to make a table in r markdown site:stackoverflow.com
