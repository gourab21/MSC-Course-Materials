path(a,b).
path(b,c).
path(c,d).
path(d,c).
path(e,d).
path(X,Y):- path(X,Z),path(Z,Y).




