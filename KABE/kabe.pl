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
    leia_suund(Color,Suund),
    X1 is X - Suund,
    Y1 is Y - 1,
    (ruut(X1,Y1,Color1);ruut(X1,Y1,EnemyKabe)),
    X2 is X1 - Suund,
    Y2 is Y1 - 1,
    ruut(X2,Y2, 0),!.
if_take_possible(Color,X,Y,X1,Y1,X2,Y2):-
    kabe(Color,Kabe),
    ruut(X,Y,Kabe),
    enemy(Color,Color1),
    kabe(Color1,EnemyKabe),
    leia_suund(Color,Suund),
    X1 is X - Suund*2,
    Y1 is Y - 2,
    (ruut(X1,Y1,Color1);ruut(X1,Y1,EnemyKabe)),
    X2 is X1 - Suund,
    Y2 is Y1 - 1,
    ruut(X2,Y2, 0),!.
if_take_possible(Color,X,Y,X1,Y1,X2,Y2):-
    kabe(Color,Kabe),
    ruut(X,Y,Kabe),
    enemy(Color,Color1),
    kabe(Color1,EnemyKabe),
    leia_suund(Color,Suund),
    X1 is X - Suund*3,
    Y1 is Y - 3,
    (ruut(X1,Y1,Color1);ruut(X1,Y1,EnemyKabe)),
    X2 is X1 - Suund,
    Y2 is Y1 - 1,
    ruut(X2,Y2, 0),!.
if_take_possible(Color,X,Y,X1,Y1,X2,Y2):-
    kabe(Color,Kabe),
    ruut(X,Y,Kabe),
    enemy(Color,Color1),
    kabe(Color1,EnemyKabe),
    leia_suund(Color,Suund),
    X1 is X - Suund*4,
    Y1 is Y - 4,
    (ruut(X1,Y1,Color1);ruut(X1,Y1,EnemyKabe)),
    X2 is X1 - Suund,
    Y2 is Y1 - 1,
    ruut(X2,Y2, 0),!.
if_take_possible(Color,X,Y,X1,Y1,X2,Y2):-
    kabe(Color,Kabe),
    ruut(X,Y,Kabe),
    enemy(Color,Color1),
    kabe(Color1,EnemyKabe),
    leia_suund(Color,Suund),
    X1 is X - Suund*5,
    Y1 is Y - 5,
    (ruut(X1,Y1,Color1);ruut(X1,Y1,EnemyKabe)),
    X2 is X1 - Suund,
    Y2 is Y1 - 1,
    ruut(X2,Y2, 0),!.
if_take_possible(Color,X,Y,X1,Y1,X2,Y2):-
    kabe(Color,Kabe),
    ruut(X,Y,Kabe),
    enemy(Color,Color1),
    kabe(Color1,EnemyKabe),
    leia_suund(Color,Suund),
    X1 is X - Suund*6,
    Y1 is Y - 6,
    (ruut(X1,Y1,Color1);ruut(X1,Y1,EnemyKabe)),
    X2 is X1 - Suund,
    Y2 is Y1 - 1,
    ruut(X2,Y2, 0),!.
if_take_possible(Color,X,Y,X1,Y1,X2,Y2):-
    kabe(Color,Kabe),
    ruut(X,Y,Kabe),
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
    kabe(Color,Kabe),
    ruut(X,Y,Kabe),
    enemy(Color,Color1),
    kabe(Color1,EnemyKabe),
    leia_suund(Color,Suund),
    X1 is X + Suund*2,
    Y1 is Y + 2,
    (ruut(X1,Y1,Color1);ruut(X1,Y1,EnemyKabe)),
    X2 is X1 + Suund,
    Y2 is Y1 + 1,
    ruut(X2,Y2, 0),!.
if_take_possible(Color,X,Y,X1,Y1,X2,Y2):-
    kabe(Color,Kabe),
    ruut(X,Y,Kabe),
    enemy(Color,Color1),
    kabe(Color1,EnemyKabe),
    leia_suund(Color,Suund),
    X1 is X + Suund*3,
    Y1 is Y + 3,
    (ruut(X1,Y1,Color1);ruut(X1,Y1,EnemyKabe)),
    X2 is X1 + Suund,
    Y2 is Y1 + 1,
    ruut(X2,Y2, 0),!.
if_take_possible(Color,X,Y,X1,Y1,X2,Y2):-
    kabe(Color,Kabe),
    ruut(X,Y,Kabe),
    enemy(Color,Color1),
    kabe(Color1,EnemyKabe),
    leia_suund(Color,Suund),
    X1 is X + Suund*4,
    Y1 is Y + 4,
    (ruut(X1,Y1,Color1);ruut(X1,Y1,EnemyKabe)),
    X2 is X1 + Suund,
    Y2 is Y1 + 1,
    ruut(X2,Y2, 0),!.
if_take_possible(Color,X,Y,X1,Y1,X2,Y2):-
    kabe(Color,Kabe),
    ruut(X,Y,Kabe),
    enemy(Color,Color1),
    kabe(Color1,EnemyKabe),
    leia_suund(Color,Suund),
    X1 is X + Suund*5,
    Y1 is Y + 5,
    (ruut(X1,Y1,Color1);ruut(X1,Y1,EnemyKabe)),
    X2 is X1 + Suund,
    Y2 is Y1 + 1,
    ruut(X2,Y2, 0),!.
if_take_possible(Color,X,Y,X1,Y1,X2,Y2):-
    kabe(Color,Kabe),
    ruut(X,Y,Kabe),
    enemy(Color,Color1),
    kabe(Color1,EnemyKabe),
    leia_suund(Color,Suund),
    X1 is X + Suund*6,
    Y1 is Y + 6,
    (ruut(X1,Y1,Color1);ruut(X1,Y1,EnemyKabe)),
    X2 is X1 + Suund,
    Y2 is Y1 + 1,
    ruut(X2,Y2, 0),!.
if_take_possible(Color,X,Y,X1,Y1,X2,Y2):-
    kabe(Color,Kabe),
    ruut(X,Y,Kabe),
    enemy(Color,Color1),
    kabe(Color1,EnemyKabe),
    leia_suund(Color,Suund),
    X1 is X - Suund,
    Y1 is Y + 1,
    (ruut(X1,Y1,Color1);ruut(X1,Y1,EnemyKabe)),
    X2 is X1 - Suund,
    Y2 is Y1 + 1,
    ruut(X2,Y2, 0),!.
if_take_possible(Color,X,Y,X1,Y1,X2,Y2):-
    kabe(Color,Kabe),
    ruut(X,Y,Kabe),
    enemy(Color,Color1),
    kabe(Color1,EnemyKabe),
    leia_suund(Color,Suund),
    X1 is X - Suund*2,
    Y1 is Y + 2,
    (ruut(X1,Y1,Color1);ruut(X1,Y1,EnemyKabe)),
    X2 is X1 - Suund,
    Y2 is Y1 + 1,
    ruut(X2,Y2, 0),!.
if_take_possible(Color,X,Y,X1,Y1,X2,Y2):-
    kabe(Color,Kabe),
    ruut(X,Y,Kabe),
    enemy(Color,Color1),
    kabe(Color1,EnemyKabe),
    leia_suund(Color,Suund),
    X1 is X - Suund*3,
    Y1 is Y + 3,
    (ruut(X1,Y1,Color1);ruut(X1,Y1,EnemyKabe)),
    X2 is X1 - Suund,
    Y2 is Y1 + 1,
    ruut(X2,Y2, 0),!.
if_take_possible(Color,X,Y,X1,Y1,X2,Y2):-
    kabe(Color,Kabe),
    ruut(X,Y,Kabe),
    enemy(Color,Color1),
    kabe(Color1,EnemyKabe),
    leia_suund(Color,Suund),
    X1 is X - Suund*4,
    Y1 is Y + 4,
    (ruut(X1,Y1,Color1);ruut(X1,Y1,EnemyKabe)),
    X2 is X1 - Suund,
    Y2 is Y1 + 1,
    ruut(X2,Y2, 0),!.
if_take_possible(Color,X,Y,X1,Y1,X2,Y2):-
    kabe(Color,Kabe),
    ruut(X,Y,Kabe),
    enemy(Color,Color1),
    kabe(Color1,EnemyKabe),
    leia_suund(Color,Suund),
    X1 is X - Suund*5,
    Y1 is Y + 5,
    (ruut(X1,Y1,Color1);ruut(X1,Y1,EnemyKabe)),
    X2 is X1 - Suund,
    Y2 is Y1 + 1,
    ruut(X2,Y2, 0),!.
if_take_possible(Color,X,Y,X1,Y1,X2,Y2):-
    kabe(Color,Kabe),
    ruut(X,Y,Kabe),
    enemy(Color,Color1),
    kabe(Color1,EnemyKabe),
    leia_suund(Color,Suund),
    X1 is X - Suund*6,
    Y1 is Y + 6,
    (ruut(X1,Y1,Color1);ruut(X1,Y1,EnemyKabe)),
    X2 is X1 - Suund,
    Y2 is Y1 + 1,
    ruut(X2,Y2, 0),!.
if_take_possible(Color,X,Y,X1,Y1,X2,Y2):-
    kabe(Color,Kabe),
    ruut(X,Y,Kabe),
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
    kabe(Color,Kabe),
    ruut(X,Y,Kabe),
    enemy(Color,Color1),
    kabe(Color1,EnemyKabe),
    leia_suund(Color,Suund),
    X1 is X + Suund*2,
    Y1 is Y - 2,
    (ruut(X1,Y1,Color1);ruut(X1,Y1,EnemyKabe)),
    X2 is X1 + Suund,
    Y2 is Y1 - 1,
    ruut(X2,Y2, 0),!.
if_take_possible(Color,X,Y,X1,Y1,X2,Y2):-
    kabe(Color,Kabe),
    ruut(X,Y,Kabe),
    enemy(Color,Color1),
    kabe(Color1,EnemyKabe),
    leia_suund(Color,Suund),
    X1 is X + Suund*3,
    Y1 is Y - 3,
    (ruut(X1,Y1,Color1);ruut(X1,Y1,EnemyKabe)),
    X2 is X1 + Suund,
    Y2 is Y1 - 1,
    ruut(X2,Y2, 0),!.
if_take_possible(Color,X,Y,X1,Y1,X2,Y2):-
    kabe(Color,Kabe),
    ruut(X,Y,Kabe),
    enemy(Color,Color1),
    kabe(Color1,EnemyKabe),
    leia_suund(Color,Suund),
    X1 is X + Suund*4,
    Y1 is Y - 4,
    (ruut(X1,Y1,Color1);ruut(X1,Y1,EnemyKabe)),
    X2 is X1 + Suund,
    Y2 is Y1 - 1,
    ruut(X2,Y2, 0),!.
if_take_possible(Color,X,Y,X1,Y1,X2,Y2):-
    kabe(Color,Kabe),
    ruut(X,Y,Kabe),
    enemy(Color,Color1),
    kabe(Color1,EnemyKabe),
    leia_suund(Color,Suund),
    X1 is X + Suund*5,
    Y1 is Y - 5,
    (ruut(X1,Y1,Color1);ruut(X1,Y1,EnemyKabe)),
    X2 is X1 + Suund,
    Y2 is Y1 - 1,
    ruut(X2,Y2, 0),!.
if_take_possible(Color,X,Y,X1,Y1,X2,Y2):-
    kabe(Color,Kabe),
    ruut(X,Y,Kabe),
    enemy(Color,Color1),
    kabe(Color1,EnemyKabe),
    leia_suund(Color,Suund),
    X1 is X + Suund*6,
    Y1 is Y - 6,
    (ruut(X1,Y1,Color1);ruut(X1,Y1,EnemyKabe)),
    X2 is X1 + Suund,
    Y2 is Y1 - 1,
    ruut(X2,Y2, 0),!.
if_take_possible(Color,X,Y,X1,Y1,X2,Y2):-
    kabe(Color,Kabe),
    ruut(X,Y,Kabe),
    enemy(Color,Color1),
    kabe(Color1,EnemyKabe),
    leia_suund(Color,Suund),
    X1 is X + Suund*2,
    Y1 is Y + 2,
    (ruut(X1,Y1,Color1);ruut(X1,Y1,EnemyKabe)),
    X2 is X1 + Suund,
    Y2 is Y1 + 1,
    ruut(X2,Y2, 0),!.
if_take_possible(Color,X,Y,X1,Y1,X2,Y2):-
    kabe(Color,Kabe),
    ruut(X,Y,Kabe),
    enemy(Color,Color1),
    kabe(Color1,EnemyKabe),
    leia_suund(Color,Suund),
    X1 is X + Suund*3,
    Y1 is Y + 3,
    (ruut(X1,Y1,Color1);ruut(X1,Y1,EnemyKabe)),
    X2 is X1 + Suund,
    Y2 is Y1 + 1,
    ruut(X2,Y2, 0),!.
if_take_possible(Color,X,Y,X1,Y1,X2,Y2):-
    kabe(Color,Kabe),
    ruut(X,Y,Kabe),
    enemy(Color,Color1),
    kabe(Color1,EnemyKabe),
    leia_suund(Color,Suund),
    X1 is X + Suund*4,
    Y1 is Y + 4,
    (ruut(X1,Y1,Color1);ruut(X1,Y1,EnemyKabe)),
    X2 is X1 + Suund,
    Y2 is Y1 + 1,
    ruut(X2,Y2, 0),!.
if_take_possible(Color,X,Y,X1,Y1,X2,Y2):-
    kabe(Color,Kabe),
    ruut(X,Y,Kabe),
    enemy(Color,Color1),
    kabe(Color1,EnemyKabe),
    leia_suund(Color,Suund),
    X1 is X + Suund*5,
    Y1 is Y + 5,
    (ruut(X1,Y1,Color1);ruut(X1,Y1,EnemyKabe)),
    X2 is X1 + Suund,
    Y2 is Y1 + 1,
    ruut(X2,Y2, 0),!.
if_take_possible(Color,X,Y,X1,Y1,X2,Y2):-
    kabe(Color,Kabe),
    ruut(X,Y,Kabe),
    enemy(Color,Color1),
    kabe(Color1,EnemyKabe),
    leia_suund(Color,Suund),
    X1 is X + Suund*6,
    Y1 is Y + 6,
    (ruut(X1,Y1,Color1);ruut(X1,Y1,EnemyKabe)),
    X2 is X1 + Suund,
    Y2 is Y1 + 1,
    ruut(X2,Y2, 0),!.
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
