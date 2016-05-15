# some more detailed examples based on the topics
# of the previous module
# 
# Anonymous function
# 
# Closure
# 


summary <- function(x){
  c(mean(x), median(x), sd(x), IQR(x))
}

lapply(df, summary)

summary <- function(x){
  funs <- c(mean, median, sd, mad, IQR)
  lapply(funs, function(f){f(x, na.rm = T)})
}

# Anonymous functions
t1 <- function(x, y){x - y}(100,6)
t2 <- (function(x, y){x - y})(100,6)


# Closure
# 
# Function written by another function
# inherit or enclose the enviromnet where thery were built
# can access all the parameters of the parent
# can use 2 sets of parameters

f <- function(x) sin(x)

# > environment(f)
# <environment: R_GlobalEnv>
#  > environment(mean)
#  <environment: namespace:base>

# primitive functions: sum
environment(sum)

y <- 2
subtraction_new <- function(x){x - y}
subtraction_new(5)

as.list(environment(subtraction_new))
