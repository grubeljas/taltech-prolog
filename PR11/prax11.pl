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
    member(El, List),
    yhend(List, Tale, X).
yhend(List, [El|Tale], X):-
    \+member(El, List),
    yhend(List, Tale, X1),
    append(X1, [El], X).

vahe([],_,[]).
vahe([El|Tale],B,X):-
    member(El,B),
    vahe(Tale,B,X).
vahe([El|Tale],B,X):-
    \+member(El,B),
    append(X1,[El],X),
    vahe(Tale,B,X1).

ristkorrutis(Symbol,[],[]).
ristkorrutis(Symbol,[El|Tale],X):-
    ristkorrutis(Symbol,Tale,X1),
    append(X1,[[Symbol,El]],X).
ristkorrutis([],_,[]).
ristkorrutis([El|Tale],List,X):-
    ristkorrutis(El,List,X1),
    ristkorrutis(Tale,List,X2),
    append(X1,X2,X).
