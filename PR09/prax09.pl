lihtlause --> nimisonafraas, tegusonafraas.
nimisonafraas --> nimisona, omadussonafraas, nimisona.
nimisonafraas --> nimisona,nimisonafraas ;[].
nimisona -->[pakapiku];[habe];[tema];[sobimatuse];[jouluvanaks]. % terminalsümbolid esinevad reeglis paremal pool ühiklistidena
omadussonafraas --> maarsona, omadussona.
maarsona --> [liiga].
omadussona --> [lyhike];[must].
tegusonafraas --> tegusona, nimisonafraas.
tegusona --> [tingib];[pohjustab].
% test
phrase(lihtlause,[pakapiku,liiga,lyhike,habe,tingib,tema,sobimatuse,jouluvanaks]).
phrase(lihtlause,[pakapiku,liiga,must,habe,tingib,tema,sobimatuse,jouluvanaks]).
phrase(lihtlause,S). % genereerib lauseid.
