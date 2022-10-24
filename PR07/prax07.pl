is_a(roovloomad,elusolend).
is_a(mitte-roovloomad,elusolend).
is_a(veeimetajad,roovloomad).
is_a(kalad,roovloomad).
is_a(saarmas,veeimetajad).
is_a(kobras,veeimetajad).
is_a(ahven,kalad).
is_a(haug,kalad).
is_a(zooplankton,mitte-roovloomad).
is_a(veetaimed,mitte-roovloomad).
is_a(vesikatk,veetaimed).
is_a(vetikas,veetaimed).

eats(zooplankton,veetaimed).
eats(kalad,zooplanton).
eats(veeimetajad,kalad).

inherits(X,Y):-
    is_a(X,Y),!.
inherits(X,Y):-
    is_a(X,W),
    inherits(W,Y).

eats(X,Y):-
    inherits(Z,Y),
    eats(X,Z).
eats(X,Y):-
    inherits(Z,X),
    eats(Z,Y).
eats(X,Y):-
    inherits(Z,Y),
    inherits(W,X)
    eats(W,Z).
