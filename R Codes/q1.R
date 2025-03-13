a=c(1,2,3,4,5,6);
b=c(3,4,5,6,7,8,9);
d=c(9,8,7,55,6,44,22,33);
r=c();
for (i in a){
  if (!(i  %in% unlist(r) )){r=append(r,i);}}
for (i in b){
  if (!(i  %in% unlist(r) )){r=append(r,i);}}
for (i in d){
  if (!(i  %in% unlist(r) )){r=append(r,i);}}
print("List 1 - ");
print(a);
print("List 2 - ");
print(b);
print("List 3 - ");
print(d);
print("Merged List  - ");
print(r);
