mother(pavel, natali).
mother(kurara, natali).
mother(natali, zina).
mother(galina, zina).
mother(alena, galina).
mother(vitali, galina).
mother(alexander, galina).
mother(valeri, silvi).
mother(dmitri, silvi).
mother(aleksei, nat).
mother(who, nat).
mother(silvi, vanavanaema1).
mother(ivan, vanavanaema2).
mother(zina, vanavanaema3).
mother(vladimir, vanavanaema4).

married(natali, valeri).
married(galina, sergei).
married(zina, vladimir).
married(nat, dmitri).
married(silvi, ivan).
married(vanavanaema1, vanavanaisa1).
married(vanavanaema2, vanavanaisa2).
married(vanavanaema3, vanavanaisa3).
married(vanavanaema4, vanavanaisa4).

:- discontiguous female/1.
:- discontiguous male/1.
male(pavel).
male(valeri).
female(natali).
female(kurara).
male(aleksei).
female(who).
male(dmitri).
female(nat).
male(ivan).
female(silvi).
female(galina).
male(sergei).
female(alena).
male(vitali).
male(alexander).
female(zina).
male(vladimir).
male(vanavanaisa1).
male(vanavanaisa2).
male(vanavanaisa3).
male(vanavanaisa4).
female(vanavanaema1).
female(vanavanaema2).
female(vanavanaema3).
female(vanavanaema4).

father(Child, Father):- mother(Child, Mother), married(Mother, Father), male(Father).
brother(Child, Brother):- mother(Child, Mother), mother(Brother, Mother), Child\=Brother, male(Brother).
sister(Child, Sister):- mother(Child, Mother), mother(Sister, Mother), Child\=Sister, female(Sister).
parent(Child, Parent):- mother(Child, Parent); father(Child, Parent).
aunt(Child, Aunt):- parent(Child, Parent), sister(Parent, Aunt).
uncle(Child, Uncle):- parent(Child, Parent), brother(Parent, Uncle).
grandfather(Child, Grandfather):- parent(Child, Parent), father(Parent, Grandfather).
grandmother(Child, Grandmother):- parent(Child, Parent), mother(Parent, Grandmother).

ancestor(C, G) :- 
    parent(C, G). 
ancestor(C, G) :-
    parent(C, Parent),
    ancestor(Parent, G). 

male_ancestor(C, G) :- 
    father(C, G). 
male_ancestor(C, G) :-
    parent(C, Parent),
    male_ancestor(Parent, G). 

female_ancestor(C, G) :- 
    mother(C, G). 
female_ancestor(C, G) :-
    parent(C, Parent),
    female_ancestor(Parent, G). 

ancestor1(Child, Parent, 1):-
    parent(Child, Parent).
ancestor1(Child, Parent, N):-
    parent(Child, P),
    T is N - 1,
    ancestor1(P, Parent, T).
    
ancestor2(Child, Parent, N):-
    ancestor(Child,Parent),
    count_children(Parent, N0),
    N0 > N.

count_children(Parent, N) :-
    count_children(Parent, [], 0, N).

count_children(Parent, L, N0, N) :-
    (parent(C, Parent), \+member(C, L))
    -> (N1 is N0+1, count_children(Parent, [C|L], N1, N))
    ; N = N0.
