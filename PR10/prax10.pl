:- dynamic ruut/3.

:-
assert(ruut(1,1,1)),
assert(ruut(1,3,1)),
assert(ruut(1,5,1)),
assert(ruut(1,7,1)),
assert(ruut(2,2,1)),
assert(ruut(2,4,1)),
assert(ruut(2,6,1)),
assert(ruut(2,8,1)),
assert(ruut(3,1,1)),
assert(ruut(3,3,1)),
assert(ruut(3,5,1)),
assert(ruut(3,7,1)),
% Tuhjad ruudud
assert(ruut(4,2,0)),
assert(ruut(4,4,0)),
assert(ruut(4,6,0)),
assert(ruut(4,8,0)),
assert(ruut(5,1,0)),
assert(ruut(5,3,0)),
assert(ruut(5,5,0)),
assert(ruut(5,7,0)),
% Mustad
assert(ruut(6,2,2)),
assert(ruut(6,4,2)),
assert(ruut(6,6,2)),
assert(ruut(6,8,2)),
assert(ruut(7,1,2)),
assert(ruut(7,3,2)),
assert(ruut(7,5,2)),
assert(ruut(7,7,2)),
assert(ruut(8,2,2)),
assert(ruut(8,4,2)),
assert(ruut(8,6,2)),
assert(ruut(8,8,2)).


tee_kaik(X,Y,X1,Y1):-
    ruut(X,Y,Color),
    retract(X,Y,Color),
    retract(X1,Y1,0).
    assert(ruut(X1,Y1,Color)),
    assert(ruut(X,Y,0))).
