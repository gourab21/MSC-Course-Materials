#largest and smallest number of an array
a=c(1,2,3,4,5,6,7,8,9);
ma=a[1];
mi=a[1];
for (i in a){
  if (i>ma){ma=i;}
  if (i<mi){mi=i;}
}
cat("List - ")
print(a);
cat("Maximum Element - ",ma,'\n')
cat("Minimum Element - ",mi)