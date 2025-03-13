path(a,b).
path(b,c).
path(c,d).
path(d,c).
path(e,d).

path(X,Z):-path(X,Y),path(Y,Z).


