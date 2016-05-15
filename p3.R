# Learning Objectives
# 1. functionf factories
# 
# 2. Moving Statistics
# 
# 3. Mutable state
# 
# 4. List of functions
# 
# 

# Function factories
# One of the primary work of closure is make it.
# 
# Mostly used for maimum likilihood problems
# 
# Used to handle complicated situations
# 
# Recall the examples of fixing the missing values
# and finding the root
# 
# Give single function with multiple arguments
# 

# Example
# 
# To add x and i 
# 
g0 <- function(x,i){
  x+i
}

g <- function(i){
  function(x){
    x+i
  }
}

g1 <- g(1)
g2 <- g(2)

# To compute maximum likelihood estimates for 
# some well known distributions

estimate_new <- function(dist) {
  initial_estimate <- function(x, theta) {
    neglik <- function(theta = theta , x = x, log = T) {
      args <- c(list(x), as.list(theta), as.list(log))
      neglik <- -sum(do.call(dist, args))
      neglik
    }
    optim(par = theta, fn = neglik, x = x)$par
  }
  initial_estimate
}

w <- rweibull(100,2,1)
(estimate_new("dweibull"))(w, theta = c(mean(w),sd(w)))

# Mutable state
# 
count_call <- function(){
  i <- 0
  function(){
    i <<- i+1
    cat("This function has been called ", i, "times\n")
    date()
  }
}
# Nota:
# <- Assigns in the current environment
# <<- Handles primarily the parent environment

# List of functions
# Functions can be stored in list
# 
# Helps the user to deal with a set of functions that care close knit
# 
# similar to dataframe
# 

list_function <- list( m = mean, s = sd)
with(list_function, m(x=1:10))

fun <- function(f, ...){
  f(...)
}
lapply(list_function, fun, x = 1:10)
lapply(list_function, do.call, list(x = 1:10, na.rm = T))

