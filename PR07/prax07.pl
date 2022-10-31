:- dynamic mark/1, max/3.
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
end_point(X):-
    \+is_a(_,X).

eating(X,Y):-
    eats(X,Y),!.
eating(X,Y):-
    inherits(Z,Y),
    eating(X,Z),!.
eating(X,Y):-
    inherits(Z,X),
    eating(Z,Y),!.
start_of_chain(X):-
    \+eats(_,X).

count_terminals(X, [X], 1):-
    end_point(X).
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

extinction(X, T, C):-
    start_of_chain(X),
    count_terminals(X, T, C).
extinction(X, T, C):-
    count_terminals(X, T1, C1),
    eats(Y,X),
    extinction(Y,T2,C2),
    C is C1 + C2,
    append(T1,T2,T).

find_most_sensitive_species(X, C, T):-
    assert(max(empty,[],0)),
    rfind_most_sensitive_species(X1,C1,T1),
    max(X,C,T),
    retract(max(X,C,T)).
rfind_most_sensitive_species(X, C, T):-
    \+extinction(X, T, C),
    assert(max(X,T,C)).
rfind_most_sensitive_species(X, C, T):-
    extinction(X, T, C),
    max(X1,T1,C1),
    ((C > C1)
    -> (assert(max(X,T,C)), retract(X1,T1,C1))
    ; rfind_most_sensitive_species(X2,C2,T2)).
