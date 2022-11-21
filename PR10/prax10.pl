:- use_module(library(clpfd)).

tee_kaik(X,Y,X1,Y1):-
    ruut(X,Y,Color)
    repeat,
    assert(ruut(X1,Y1,Color)),
    assert(ruut(X,Y,0)).
