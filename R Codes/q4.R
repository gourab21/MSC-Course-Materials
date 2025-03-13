a=c(1,2,3,4,5);
s=0;
for (i in a){
  if (!(i %% 2==0)){
    s=s+i;
  }
}
print("List - ");
print(a);
print(paste("Sum of Odd terms - ",s));