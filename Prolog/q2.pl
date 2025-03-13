
knows(sylvester, tweety).

knows(X, Y) :- friend(X, Y).

cat(polo).
penguin(olo).


likes_to_eat(X, Y) :- cat(X), bird(Y).

bird(X) :- parakeet(X).
bird(X) :- penguin(X).

flies(X) :- parakeet(X).
chirps(X) :- parakeet(X).
