married(john, mary).
married(josh, catherine).
married(simone, kate).

parent(tom, mary).
parent(azure, mary).
parent(tom, catherine).
parent(azure, catherine).
parent(rick, john).
parent(tasha, john).
parent(rick, simone).
parent(tasha, simone).
parent(john, johnny).
parent(mary, johnny).
parent(john, peter).
parent(mary,peter).
parent(josh, william).
parent(catherine, william).
parent(simone, betty).
parent(kate,betty).



sibling(X,Y) :- setof((X,Y), sibling_helper(X,Y), Siblings),
               member((X,Y), Siblings),
               \+ (Y@<X, member((Y,X), Siblings)).

sibling_helper(X, Y):- parent(Z, X), parent(Z, Y), X\=Y.


grandparent(X,Y) :- setof((X,Y), grandparent_helper(X,Y), GPS),
               member((X,Y), GPS),
               \+ (Y@<X, member((Y,X), GPS)).

grandparent_helper(X, Y):- parent(P, Y), parent(X, P).


cousin(X,Y) :- setof((X,Y), cousin_helper(X,Y), Cousins),
               member((X,Y), Cousins),
               \+ (Y@<X, member((Y,X), Cousins)).


cousin_helper(X, Y):- grandparent(GP, X), grandparent(GP, Y), X \= Y, \+siblings(X,Y).

