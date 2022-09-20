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
paki([X,X|TAIL], [X|L]):-
    paki(TAIL, L).
paki([X,Y|TAIL], [X|L]):-
    paki([Y|TAIL], [Y|L]).
