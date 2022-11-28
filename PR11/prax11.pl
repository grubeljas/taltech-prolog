yhisosa(_,[],[]).
yhisosa([],_,[]).
yhisosa([El|Tale], List1, [El|X]):-
    member(El,List1),
    yhisosa(Tale,List1,X).
yhisosa([El|Tale], List1, X):-
    \+member(El,List1),
    yhisosa(Tale,List1,X).

yhend(List,[],List).
yhend(List, [El|Tale], X):-
    member(El, X),
    yhend(List, Tale, X).
yhend(List, [EL|Tale], X):-
    \+member(El, X),
    append(X1, [El], X),
    yhend(List, Tale, X1).

vahe([],_,[]).
vahe([El|Tale],B,X):-
    member(El,B),
    yhend(Tale,B,X).
vahe([El|Tale],B,X):-
    \+member(El,B),
    append(X1,[EL],X),
    yhend(Tale,B,X1).

