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

transport(Kust, Kuhu, laevaga):-
    laevaga(Kust, Kuhu,_).
transport(Kust, Kuhu, bussiga):-
    bussiga(Kust, Kuhu,_).
transport(Kust, Kuhu, rongiga):-
    rongiga(Kust, Kuhu,_).
transport(Kust, Kuhu, lennukiga):-
    lennukiga(Kust, Kuhu,_).
reisi_transpordiga(Kust, Kuhu, mine(Kust, Kuhu, Transport)):-
    transport(Kust, Kuhu, Transport).
reisi_transpordiga(Kust, Kuhu, mine(Kust, Peatus, Transport, mine(Peatus,Kuhu,Transport1))):-
    transport(Kust, Peatus, Transport),
    reisi_transpordiga(Peatus, Kuhu, mine(Peatus, Kuhu, Transport1)).
reisi_transpordiga(Kust, Kuhu, mine(Kust, Peatus, Transport, Road)):-
    \+ labitud(Peatus),
    transport(Kust, Peatus, Transport),
    assert(labitud(Peatus)),
    reisi_transpordiga(Peatus, Kuhu, Road);
    retractall(labitud(_)).
