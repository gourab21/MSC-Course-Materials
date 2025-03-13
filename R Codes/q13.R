#Linear Search Using R Program

a=c(1,2,3,4,5,6,7,8,9);
var = readline("Enter Element to search - ");
var = as.integer(var);
#var=99
r=0

for (x in 1:length(a)){
  if (a[x]==var){
    r=1;
    print(paste("Found at position ",x));
    break;
  }
}
if (r==0){
  print("Not in List...")}