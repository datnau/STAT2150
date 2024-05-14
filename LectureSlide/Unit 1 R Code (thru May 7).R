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
data = rnorm(50,65,3) #rnorm(size, mean, std)
hist(data)
data = rnorm(500,65,3)
hist(data)

data = pnorm(50,65,3,TRUE,FALSE)
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
  y[i] = x[i]^2 # 4^2 ; 5^2 ; 6^2
}
y
a.vector <- double(5)
a.vector[1] = 1
a.vector[2] = 2
a.vector[3] = 3
a.vector[4] = 4
a.vector[5] = 5
a.vector

a.matrix <- matrix(nrow=2,ncol=2)
a.matrix[1,1] = 4
a.matrix[1,2] = 6
a.matrix[2,1] = 8
a.matrix[2,2] = 10
a.matrix
?matrix
x  = 11:20
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
?which
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

#Thursday, May 9th:

sum(1:5)
x = c(2,7,8)
sum(x)
sum(1,2,6)

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
  #order() tells you which elements of the input vector nees to be
#1st,2nd, etc. in order sort the input vector
order(x)
#output is c(3,4,2,1)
#3 means position 3 of the input vector is where the smallest value is
#4 means position 4 of the input vector is where the next smallest value is
#2 means position 2 of the input vector is where the next smallest value is
#1 means position 1 of the input vector is where the next smallest value is
# order(x) returns numbers in 1:length(x)

x[order(x)] # same as sort(x)

students = 1:6
grades = rep(c("A","B","C"),2)
df = data.frame(students,grades)
df
df[,2] #2nd column of the data frame
order(df[,2]) # c(1,4,2,5,3,6) this is the order of rows that we want
?rep

df[order(df[,2]),] #data frame is sorted with A students first, then B students, etc

round(3.5)
round(3.9)
round(3.1)
?round
round(3.72, digit = 1)
round(3.77, digits = 1)

x = 4:6
counts = table(x) #output is a NAMED vector
pie(counts)
counts/sum(counts) #gives proportions
?pie

expression = paste(names(counts),"\n", counts/sum(counts)*100,"%")
pie(counts, labels = expression)

install.packages("MASS")
install.packages("igraph")
library(igraph)
plot(make_full_graph(5))

data()
mtcars
?mtcars

mydata = read.csv('C:\\Users\\ADMIN\\Downloads\\FoodPrice_in_Turkey.csv')
mydata
?read.csv

#mydata2 = read.csv('C:\Users\ADMIN\OneDrive - EECD EDPE\Documents\CodeGym DAP')
#mydata2

write.table(mydata,'C:\\Users\\ADMIN\\Downloads\\FoodPrice_in_Turkey.csv')
write.csv(mydata,'C:\\Users\\ADMIN\\Downloads\\FoodPrice_in_Turkey.csv')

# To store R objects as data files
save(counts,file="counts.RData")
rm(counts)
load("counts.RData")

x = rnorm(1000,0,1)
hist(x)

jpeg("histogram.jpeg")
hist(x)
dev.off()


myfunc = function(x){
  

}


my.mean = function(x){
  mysum = sum(x)
  n = length(x)
  ans = mysum/n
  return(mysum/n)
}
my.mean(1:10)
my.mean(1:3)
my.mean = function(x){
  mysum = sum(x)
  print(mysum)#just for troubleshooting
  n = length(x)
  print(n)#just for troubleshooting
  ans = mysum/(n-1)
  ans
}
my.mean(1:3)

#Troubleshooting
x = 1:3
#copy the lines of code from inside the function and check what's happening
mysum = sum(x)
mysum
n = length(x)
n
ans = mysum/(n-1)



