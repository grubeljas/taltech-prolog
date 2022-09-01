viimane_element(_, []):- fail.
viimane_element(El, [El]).
viimane_element(El, [_|TAIL]):-
    viimane_element(El, TAIL).
