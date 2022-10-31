:- dynamic mark/1.
:- discontiguous eats/2.

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
    is_a(X,Y).
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
    inherits(W,X),
    eats(W,Z).

count_terminals(X, T, C):-
    get_terms(X),
    get_list(T),
    count(T,C).

get_terms(X):-
    inherits(Y,X),
    \+inherits(_,Y),
    \+mark(Y),
    assert(mark(Y)),
    (get_terms(X);
    !).

get_list(_):-
    \+mark(_).
get_list([X|T]):-
    retract(mark(X)),
    (get_list(T);
    T is [], !).

count([],0).
count([_|Tail], N):-
    count(Tail, N1),
    N is N1 + 1.
