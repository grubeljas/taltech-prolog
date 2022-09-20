viimane_element(_, []):- fail.
viimane_element(El, [El]).
viimane_element(El, [_|TAIL]):-
    viimane_element(El, TAIL).

suurim([El|[]], [El]).
suurim([X,Y|TAIL], [B|L]):-
    ((X > Y)
    -> B = X
    ; B = Y)
    ,suurim([Y|TAIL], L).
