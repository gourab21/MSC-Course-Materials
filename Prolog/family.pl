p(pam,bob).
p(tom,bob).
p(tom,liz).
p(bob,ann).
p(bob,pat).
p(pat,jim).

f(pam).
m(tom).
m(bob).
f(liz).
f(pat).
f(ann).
m(jim).

mother(X,Y):-f(X),p(X,Y).
father(X,Y):-m(X),p(X,Y).
gfather(X,Y):-m(X),p(Z,Y),p(X,Z).
gmother(X,Y):-f(X),p(Z,Y),p(X,Z).

child(X,Y):-p(Y,X).
son(X,Y):-m(X),p(Y,X).
daughter(X,Y):-f(X),p(Y,X).

