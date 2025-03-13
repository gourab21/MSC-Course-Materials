#sum ith element from start and end
a=c(1,2,3,4,5,6,7,8,9,10,11);
n=length(a);
cond=0;
print("List - ");
print(a);
if (n%%2==0){cond=1;}
for (i in 1:floor(n/2)){
  cat(a[i]," + ",a[n-i]," = ",a[i]+a[n+1-i],'\n')
}
if (cond==0){
  cat(a[ceiling(n/2)])
}