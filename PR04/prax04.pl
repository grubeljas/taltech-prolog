:- dynamic labitud/1.

laevaga(tallinn, helsinki, 120).
laevaga(tallinn, stockholm, 480).
bussiga(tallinn, riia, 300).
rongiga(riia, berlin, 680).
lennukiga(tallinn, helsinki, 30).
lennukiga(helsinki, paris, 180).
lennukiga(paris, berlin, 120).
lunnukiga(berlin, stockholm, 80).
lennukiga(stockholm, tallinn, 50).

uhendatud(X,Y):-
    laevaga(X,Y,_);
    bussiga(X,Y,_);
    lennukiga(X,Y,_).

reisi(X,Y):-
    uhendatud(X,Y).
reisi(X,Y):-
    uhendatud(X,Z),
    reisi(Z,Y).