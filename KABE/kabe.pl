:- module(kabe, [blind/3]).

blind(Color,X,Y):-
    X>0,
    Y>0,
    step_variants(Color,X,Y),
    !.
blind(Color,X,Y):-
    step_variants(Color,X1,Y1),
    !.
blind(_,_,_).

leia_suund(1,1):- !.
leia_suund(2,-1).
enemy(1,2).
enemy(2,1).
kabe(1,10).
kabe(2,20).
check_kabe(1,8,Y):-
    retract(ruut(8,Y,1)),
    assert(ruut(8,Y,10)),
    !.
check_kabe(2,1,Y):-
    retract(ruut(1,Y,2)),
    assert(ruut(1,Y,20)),
    !.
check_kabe(_,_,_).
abs(X,Y) :- X < 0 -> Y is -X ; Y = X.
same_diagonal(X,Y,X1,Y1,N):-
    Xabs is X - X1,
    abs(Xabs,N),
    Yabs is Y - Y1,
    abs(Yabs,N1),
    N == N1.
free_diagonal(X,Y,X1,Y1,1):-
    same_diagonal(X,Y,X1,Y1,1),!.
free_diagonal(X,Y,X1,Y1,N):-
    X2 is X - 1,
    Y2 is Y + 1,
    ruut(X2,Y2,0),
    same_diagonal(X,Y,X2,Y2,1),
    same_diagonal(X2,Y2,X1,Y1,N1),
    N1 < N,
    free_diagonal(X2,Y2,X1,Y1,N1).
free_diagonal(X,Y,X1,Y1,N):-
    X2 is X + 1,
    Y2 is Y - 1,
    ruut(X2,Y2,0),
    same_diagonal(X,Y,X2,Y2,1),
    same_diagonal(X2,Y2,X1,Y1,N1),
    N1 < N,
    free_diagonal(X2,Y2,X1,Y1,N1).
free_diagonal(X,Y,X1,Y1,N):-
    X2 is X + 1,
    Y2 is Y + 1,
    write(X2),write(Y2),
    ruut(X2,Y2,0),
    same_diagonal(X,Y,X2,Y2,1),
    same_diagonal(X2,Y2,X1,Y1,N1),
    N1 < N,
    free_diagonal(X2,Y2,X1,Y1,N1).
free_diagonal(X,Y,X1,Y1,N):-
    X2 is X - 1,
    Y2 is Y - 1,
    ruut(X2,Y2,0),
    same_diagonal(X,Y,X2,Y2,1),
    same_diagonal(X2,Y2,X1,Y1,N1),
    N1 < N,
    free_diagonal(X2,Y2,X1,Y1,N1).

step_variants(Color,X,Y):-
    (ruut(X,Y,Color);
    kabe(Color,Kabe),
    ruut(X,Y,Kabe)),
    force_take(Color,X,Y),
    !.
step_variants(Color,X,Y):-
    (ruut(X,Y,Color);
    (kabe(Color,Kabe),
    ruut(X,Y,Kabe))),
    step(Color,X,Y).

force_take(Color,X,Y):-
    if_take_possible(Color,X,Y,X1,Y1,X2,Y2),
    take(Color,X,Y,X1,Y1,X2,Y2),
    check_kabe(Color,X2,Y2).

if_take_possible(Color,X,Y,X1,Y1,X2,Y2):-
    kabe(Color,Kabe),
    ruut(X,Y,Kabe),
    enemy(Color,Color1),
    kabe(Color1,EnemyKabe),
    (ruut(X1,Y1,Color1);ruut(X1,Y1,EnemyKabe)),
    write(X1),write(Y1),
    same_diagonal(X,Y,X1,Y1,N),
    free_diagonal(X,Y,X1,Y1,N),
    N1 is N + 1,
    ruut(X2,Y2,0),
    write(X2),write(Y2),
    same_diagonal(X,Y,X2,Y2,N1),
    same_diagonal(X1,Y1,X2,Y2,N3),
    N3 = 1,
    !.
if_take_possible(Color,X,Y,X1,Y1,X2,Y2):-
    enemy(Color,Color1),
    kabe(Color1,EnemyKabe),
    leia_suund(Color,Suund),
    X1 is X + Suund,
    Y1 is Y - 1,
    (ruut(X1,Y1,Color1);ruut(X1,Y1,EnemyKabe)),
    X2 is X1 + Suund,
    Y2 is Y1 - 1,
    ruut(X2,Y2, 0),!.
if_take_possible(Color,X,Y,X1,Y1,X2,Y2):-
    enemy(Color,Color1),
    kabe(Color1,EnemyKabe),
    leia_suund(Color,Suund),
    X1 is X - Suund,
    Y1 is Y - 1,
    (ruut(X1,Y1,Color1);ruut(X1,Y1,EnemyKabe)),
    X2 is X1 - Suund,
    Y2 is Y1 - 1,
    ruut(X2,Y2, 0),!.
if_take_possible(Color,X,Y,X1,Y1,X2,Y2):-
    enemy(Color,Color1),
    kabe(Color1,EnemyKabe),
    leia_suund(Color,Suund),
    X1 is X + Suund,
    Y1 is Y + 1,
    (ruut(X1,Y1,Color1);ruut(X1,Y1,EnemyKabe)),
    X2 is X1 + Suund,
    Y2 is Y1 + 1,
    ruut(X2,Y2, 0),!.
if_take_possible(Color,X,Y,X1,Y1,X2,Y2):-
    enemy(Color,Color1),
    kabe(Color1,EnemyKabe),
    leia_suund(Color,Suund),
    X1 is X - Suund,
    Y1 is Y + 1,
    (ruut(X1,Y1,Color1);ruut(X1,Y1,EnemyKabe)),
    X2 is X1 - Suund,
    Y2 is Y1 + 1,
    ruut(X2,Y2, 0),!.

take(MyColour,X,Y,X1,Y1,X2,Y2) :-
    kabe(MyColour,Kabe),
    ruut(X,Y,Kabe),
    retractall(ruut(X, Y, Kabe)),
    retractall(ruut(X1, Y1, _)),
    retractall(ruut(X2, Y2, 0)),
    assert(ruut(X2, Y2, Kabe)),
    assert(ruut(X1, Y1, 0)),
    assert(ruut(X, Y, 0)).
take(MyColour,X,Y,X1,Y1,X2,Y2) :-
    ruut(X,Y,MyColour),
    retractall(ruut(X, Y, MyColour)),
    retractall(ruut(X1, Y1, _)),
    retractall(ruut(X2, Y2, 0)),
    assert(ruut(X2, Y2, MyColour)),
    assert(ruut(X1, Y1, 0)),
    assert(ruut(X, Y, 0)).

step(Color,X,Y):-
    write("1"),
    if_step_possible(Color,X,Y,X1,Y1),
    write(X1),write(Y1),
    make_step(X,Y,X1,Y1),
    write("3"),
    check_kabe(Color,X1,Y1).

if_step_possible(Color,X,Y,X1,Y1):-
    kabe(Color,Kabe),
    ruut(X,Y,Kabe),
    leia_suund(Color,Suund),
    X1 is X - Suund,
    Y1 is Y + 1,
    ruut(X1,Y1,0),!.
if_step_possible(Color,X,Y,X1,Y1):-
    kabe(Color,Kabe),
    ruut(X,Y,Kabe),
    leia_suund(Color,Suund),
    X1 is X - Suund,
    Y1 is Y - 1,
    ruut(X1,Y1,0),!.
if_step_possible(Color,X,Y,X1,Y1):-
    leia_suund(Color,Suund),
    X1 is X + Suund,
    Y1 is Y + 1,
    ruut(X1,Y1,0),!.
if_step_possible(Color,X,Y,X1,Y1):-
    leia_suund(Color,Suund),
    X1 is X + Suund,
    Y1 is Y - 1,
    ruut(X1,Y1,0),!.

make_step(X, Y, X1, Y1) :-
    ruut(X, Y, A),
    ruut(X1, Y1, 0),
    retractall(ruut(X, Y, _)),
    retractall(ruut(X1, Y1, 0)),
    assert(ruut(X1, Y1, A)),
    assert(ruut(X, Y, 0)).

ruut(8,4,10).
ruut(8,8,10).
ruut(6,6,2).
ruut(1,1,1).
ruut(2,2,0).
ruut(7,5,0).
ruut(7,7,0).
ruut(5,5,0).
ruut(5,7,0).
