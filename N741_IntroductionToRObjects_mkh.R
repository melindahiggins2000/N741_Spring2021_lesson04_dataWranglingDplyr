library(knitr)
library(dplyr)

2 + 2
.Last.value

result <- 2+2
result

x <- 3.1415
class(x)

favsnack <- "hummus"
class(favsnack)

likebeets <- TRUE
class(likebeets)

beetchoice <- c(1,1,2,2,1)
class(beetchoice)

likebeets <- beetchoice == 2
likebeets
class(likebeets)

x <- 3.1415
class(x)

y <- "brocalli"
class(y)

z <- FALSE
class(z)

y

w <- c(3.1415, 6.626E-34, 343)
class(w)
v <- c("brocalli","spinach","carrots")
class(v)
is.vector(w)
length(v)
v[2]

class(x)
class(y)
class(z)

xy <- c(x,y)
xy
class(xy)

xz <- c(x,z)
xz
class(xz)

yz <- c(y,z)
yz
class(yz)

X <- c(1, 2, 3, 4, 5)
Y <- c(23, 34, 32, 21, 28)
Z <- c(4.4, 3.0, 3.4, 2.2, 3.8)
mtx <- matrix(c(X,Y,Z), nrow=5, ncol=3)
mtx
class(mtx)
dim(mtx)

mtx[2, 3]
mtx
mtx[4, ] # 4th row of the matrix
mtx[, 3] # 3rd column of the matrix

A <- c("apple","banana","grapes","apple","orange")
mtx2 <- matrix(c(X,Y,Z,A), nrow=5, ncol=4)
mtx2
is.numeric(mtx)
is.numeric(mtx2)
is.character(mtx2)

id <- c(1, 2, 3, 4, 5)
age <- c(23, 34, 32, 21, 28)
fruit <- c("apple","banana","grapes",
           "apple","orange")
beets <- c(TRUE,FALSE,FALSE,TRUE,FALSE)
df <- data.frame(id, age, fruit, beets)
df
names(df)
dim(df)
str(df)

df[2, 4] # value at 2nd row, 4th column
df[1, ] # all data on row 1
df[, 4] # all data in column 4
names(df)
df$fruit

# combine 
# x = scalar numeric vale
# age = numeric vector
# mtx = numeric matrix
# df = data frame with mixed variable types
list1 <- list(x, age, mtx, df)
list1

