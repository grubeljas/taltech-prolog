:- dynamic labitud/1.

laevaga(tallinn, helsinki, 120).
laevaga(tallinn, stockholm, 480).
bussiga(tallinn, riia, 300).
rongiga(riia, berlin, 680).
lennukiga(tallinn, helsinki, 30).
lennukiga(helsinki, paris, 180).
lennukiga(paris, berlin, 120).
lennukiga(berlin, stockholm, 80).
lennukiga(stockholm, tallinn, 50).

uhendatud(X,Y):-
    laevaga(X,Y,_);
    bussiga(X,Y,_);
    rongiga(X,Y,_);
    lennukiga(X,Y,_).

reisi(X,Y):-
    uhendatud(X,Y).
reisi(X,Y):-
    uhendatud(X,Z),
    reisi(Z,Y).

reisi(Kust, Kuhu, mine(Kust, Kuhu)):-
    uhendatud(Kust,Kuhu).
reisi(Kust, Kuhu, mine(Kust, Peatus, mine(Peatus,Kuhu))):-
    uhendatud(Kust,Peatus),
    reisi(Peatus, Kuhu, mine(Peatus,Kuhu)).
reisi(Kust, Kuhu, mine(Kust, Peatus,Road)):-
    \+ labitud(Peatus),
    uhendatud(Kust,Peatus),
    assert(labitud(Peatus)),
    reisi(Peatus, Kuhu, Road),
    retractall(labitud(_)).

reisi_transpordiga(Kust, Kuhu, laevaga):-
    laevaga(X,Y,_).
reisi_transpordiga(Kust, Kuhu, bussiga):-
    bussiga(X,Y,_).
reisi_transpordiga(Kust, Kuhu, rongiga):-
    rongiga(X,Y,_).
reisi_transpordiga(Kust, Kuhu, lennukiga):-
    lennukiga(X,Y,_).
reisi(Kust, Kuhu, mine(Kust, Peatus,bussiga,mine(Peatus,Kuhu,Transport))):-
    bussiga(Kust,Peatus),
    reisi(Peatus, Kuhu, mine(Peatus,Kuhu,Transport)).
reisi(Kust, Kuhu, mine(Kust, Peatus,laevaga,mine(Peatus,Kuhu,Transport))):-
    laevaga(Kust,Peatus),
    reisi(Peatus, Kuhu, mine(Peatus,Kuhu,Transport)).
reisi(Kust, Kuhu, mine(Kust, Peatus,rongiga,mine(Peatus,Kuhu,Transport))):-
    rongiga(Kust,Peatus),
    reisi(Peatus, Kuhu, mine(Peatus,Kuhu,Transport)).
reisi(Kust, Kuhu, mine(Kust, Peatus,lennukiga,mine(Peatus,Kuhu,Transport))):-
    lennukiga(Kust,Peatus),
    reisi(Peatus, Kuhu, mine(Peatus,Kuhu,Transport)).
