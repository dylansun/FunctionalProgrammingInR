# in R, like any ohter data type, functions can be
# 1. passed around as arguments to other function
# 2. returned by other function
# 3. stored in lists
fn <- function(f, ...){
  f(...)
}
fn(mean, x = 1:50)

add <- function(x,y,z){
  x+y+z
}
prod <- function(x,y,z){
  x*y*z
}

use <- function(x,y,z, fun){
  fun(x,y,z)
}

use(2,7,23,prod)
use(2,4,23,add)

# Higher order built in functions in R
# Reduce
# Filter
# Find
# Map
# Position
# Negate

# Reduce function: reduces a vector to a single value
# Reduce(f,1:3)
Reduce(sum, 1:3)

# predicate function: Filter Find Position
find.even.numbers <- Filter(function(x){x%%2==0}, 1:100)
find.odd.numbers <- Filter(function(x){x%%2==1}, 1:100)

is.divisor <- function(b,x) {
  x %% b == 0
}
is.prime <- function(x){
  length(Filter(function(b){is.divisor(b,x)}, 1:x)) == 2
}

# Find
# Truncated form of Filter
# Usually locates the first item in a vector that
# satisfies a predicate

Find(is.prime, 1:100)
Filter(is.prime, 1:100)

# Position
# Has a lot of similarities with the Find() function
# Provides the index of the element that would be returned
# by Find() instead of it's value
Position(is.prime, 50:100, right = T)

# Negate
# To find wheter a given number is composite or not
is.composite <- Negate(is.prime)
is.composite(23)

# Seveal functionals
# lapply() apply() tapply()
