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
