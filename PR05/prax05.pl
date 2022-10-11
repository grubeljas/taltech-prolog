:- dynamic labitud/1.
:- dynamic cheapest/1.


laevaga(tallinn, helsinki, 120, time(12, 45, 0.0), time(14, 45, 0.0)).
laevaga(tallinn, stockholm, 480, time(12, 45, 0.0), time(23, 45, 0.0)).
bussiga(tallinn, riia, 300, time(12, 45, 0.0), time(15, 10, 0.0)).
rongiga(riia, berlin, 680, time(15, 45, 0.0), time(20, 45, 0.0)).
lennukiga(tallinn, helsinki, 30, time(12, 45, 0.0), time(13, 15, 0.0)).
lennukiga(helsinki, paris, 180, time(15, 45, 0.0), time(20, 45, 0.0)).
lennukiga(paris, berlin, 120, time(20, 55, 0.0), time(22, 45, 0.0)).
lennukiga(berlin, stockholm, 80, time(1, 10, 0.0), time(5, 45, 0.0)).
lennukiga(stockholm, tallinn, 50, time(6, 40, 0.0), time(7, 45, 0.0)).

transport(Kust, Kuhu, laevaga, N, Aeg1, Aeg2):-
    laevaga(Kust, Kuhu, N, Aeg1, Aeg2).
transport(Kust, Kuhu, bussiga, N, Aeg1, Aeg2):-
    bussiga(Kust, Kuhu, N, Aeg1, Aeg2).
transport(Kust, Kuhu, rongiga, N, Aeg1, Aeg2):-
    rongiga(Kust, Kuhu, N, Aeg1, Aeg2).
transport(Kust, Kuhu, lennukiga, N, Aeg1, Aeg2):-
    lennukiga(Kust, Kuhu, N, Aeg1, Aeg2).

aegade_vahe(Aeg1, Aeg2, Vahe):-
                    time(H1,M1,S1) = Aeg1,
                    time(H2,M2,S2) = Aeg2.

odavaim_reis(Kust, Kuhu, mine(Kust, Kuhu, Transport), N):-
    transport(Kust, Kuhu, Transport, N, _, _).
odavaim_reis(Kust, Kuhu, mine(Kust, Peatus, Transport, mine(Peatus,Kuhu,Transport1)), Hind):-
    transport(Kust, Peatus, Transport, N, _, _),
    odavaim_reis(Peatus, Kuhu, mine(Peatus, Kuhu, Transport1), N1),
    Hind is N + N1.
odavaim_reis(Kust, Kuhu, mine(Kust, Peatus, Transport, Road), Hind):-
    \+ labitud(Peatus),
    transport(Kust, Peatus, Transport, N, _, _),
    assert(labitud(Peatus)),
    odavaim_reis(Peatus, Kuhu, Road, N1),
    Hind is N + N1;
    retractall(labitud(_)).

lyhim_reis(Kust, Kuhu, mine(Kust, Kuhu, Transport), N):-
    transport(Kust, Kuhu, Transport, N, _, _).
lyhim_reis(Kust, Kuhu, mine(Kust, Peatus, Transport, mine(Peatus,Kuhu,Transport1)), Hind):-
    transport(Kust, Peatus, Transport, N, _, _),
    lyhim_reis(Peatus, Kuhu, mine(Peatus, Kuhu, Transport1), N1),
    Hind is N + N1.
lyhim_reis(Kust, Kuhu, mine(Kust, Peatus, Transport, Road), Hind):-
    \+ labitud(Peatus),
    transport(Kust, Peatus, Transport, N, _, _),
    assert(labitud(Peatus)),
    lyhim_reis(Peatus, Kuhu, Road, N1),
    Hind is N + N1;
    retractall(labitud(_)).
