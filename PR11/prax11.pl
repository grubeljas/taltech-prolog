yhisosa([],List1,[]).
yhisosa([El|Tale], List1, [El|X]):-
    member(El,List1),
    yhisosa(Tale,List1,X).
yhisosa([El|Tale], List1, X):-
    not member(El,List1),
    yhisosa(Tale,List1,X).
