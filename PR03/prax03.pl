viimane_element(_, []):- fail.
viimane_element(El, [El]).
viimane_element(El, [_|TAIL]):-
    viimane_element(El, TAIL).

suurim([], []).
suurim([El|[]], [El]).
suurim([X,Y|TAIL], [B|L]):-
    ((X > Y)
    -> B = X
    ; B = Y)
    ,suurim([Y|TAIL], L).

paki([], []).
paki([X,X|[]], [X]).
paki([X|[]], [X]).
paki([X,X|TAIL], L):-
    paki([X|TAIL], L).
paki([X,Y|TAIL], [X|L]):-
    paki([Y|TAIL], L).

duplikeeri([],[]).
duplikeeri([X|[]],[X,X]).
duplikeeri([X|TAIL],[X,X|L]):-
    duplikeeri(TAIL,L).

repeat(_,0,[]).
repeat(X,1,[X]).
repeat(X,N,[X|L]):-
    N0 is N - 1,
    repeat(X,N0,L).

kordista([_],0,[]).
kordista([L|[]],1,[L]).
kordista([],_,[]).
kordista([X|TAIL],N,LIST):-
    repeat(X,N,ML),
    kordista(TAIL,N,L),
    append(ML,L,LIST).

even(X) :- 0 is mod(X, 2).
odd(X) :- 1 is mod(X, 2).

paaritu_arv([],[]).
paaritu_arv([EL|TAIL],[EL|X]):-
    odd(EL),
    paaritu_arv(TAIL,X).
paaritu_arv([EL|TAIL],X):-
    even(EL),
    paaritu_arv(TAIL,X).

paaris_arv([],[]).
paaris_arv([EL|TAIL],[EL|X]):-
    even(EL),
    paaritu_arv(TAIL,X).
paaris_arv([EL|TAIL],X):-
    odd(EL),
    paaritu_arv(TAIL,X).

suurem_kui([],_,[]).
suurem_kui([EL|TAIL],N,[EL|X]):-
    EL>N,
    suurem_kui(TAIL,N,X).
suurem_kui([EL|TAIL],N,X):-
    EL=<N,
    suurem_kui(TAIL,N,X).

vordle_predikaadiga([],_,[]).
vordle_predikaadiga(L,[paaritu_arv],X):-
    paaritu_arv(L,X).
vordle_predikaadiga(L,[paaris_arv],X):-
    paaris_arv(L,X).
vordle_predikaadiga(L,[suurem_kui,N],X):-
    suurem_kui(L,N,X).
