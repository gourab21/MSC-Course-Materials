a=c(1,2,3,4,5,6,7,8,9,1,2,22,33,66,55,44,55,88,99,55,66,22,33,22,11,22,33,66,55,44,77,5,4,5,1,2,35,34,21,59,86,24,51,63)
b=c(2,2,2,2,2,2,2)

# Create the function.
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}
cat("Set 1 ----------",'\n')
cat("Mean - ",mean(a),'\n')
cat("Mode - ",getmode(a),'\n')
cat("Median - ",median(a),'\n')
cat("Set 2 ----------",'\n')
cat("Mean - ",mean(b),'\n')
cat("Mode - ",getmode(b),'\n')
cat("Median - ",median(b),'\n')
