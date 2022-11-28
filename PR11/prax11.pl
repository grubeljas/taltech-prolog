yhisosa(_,[],[]).
yhisosa([],_,[]).
yhisosa([El|Tale], List1, [El|X]):-
    member(El,List1),
    yhisosa(Tale,List1,X).
yhisosa([El|Tale], List1, X):-
    \+member(El,List1),
    yhisosa(Tale,List1,X).

yhend(List,[],_).
yhend(List, [EL|Tale], X):-
    member(El, X),
    yhend(List, Tale, X).
yhend(List, [EL|Tale], X):-
    \+member(El, X),
    append(X1, [El], X)
    yhend(List, Tale, X1).


