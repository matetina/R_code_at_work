# Create a vector. 
rv <- c(11, 18, 19, 21, 29, 46, 21)

getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

result <- getmode(rv)
print(result) 