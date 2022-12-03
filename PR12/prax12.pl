:- dynamic vesi/1,kalad/1.

struktuur([sober(_,_,_,_,_), sober(_,_,_,_,_), sober(_,_,_,_,_), sober(_,_,_,_,_), sober(_,_,_,_,_)]).

varv(sober(A,_,_,_,_),A).
kodakondsus(sober(_,B,_,_,_),B).
jook(sober(_,_,C,_,_),C).
sigarett(sober(_,_,_,D,_),D).
lemmikloom(sober(_,_,_,_,F),F).

first(X,[X|_]).
kesk(X,[_,_,X|_]).
korval(A,B,[A,B,_,_,_]).
korval(B,C,[_,B,C,_,_]).
korval(C,D,[_,_,C,D,_]).
korval(D,F,[_,_,_,D,F]).
korval(B,A,[A,B,_,_,_]).
korval(C,B,[_,B,C,_,_]).
korval(D,C,[_,_,C,D,_]).
korval(F,D,[_,_,_,D,F]).

moistatus():-
  struktuur(Sobrad),
  member(S1, Sobrad),
    kodakondsus(S1, inglane),
    varv(S1, punane),
  member(S2, Sobrad),
    kodakondsus(S2, hispaanlane),
    lemmikloom(S2, koer),
  member(S3, Sobrad),
    varv(S3, roheline),
    jook(S3, kohv),
  member(S4, Sobrad),
    kodakondsus(S4, ukrainlane),
    jook(S4, tee),
  korval(S51, S52, Sobrad),
    varv(S51, valge),
    varv(S52, roheline),
  member(S6, Sobrad),
    sigarett(S6, winston),
    lemmikloom(S6, madu),
  member(S7, Sobrad),
    sigarett(S7, kool),
    varv(S7, kollane),
  kesk(S8,Sobrad),
    jook(S8,piim),
  first(S9,Sobrad),
    kodakondsus(S9,norralane),
  korval(S101,S102,Sobrad),
    sigarett(S101,chesterfield),
    lemmikloom(S102,rebane),
  korval(S111,S112,Sobrad),
    sigarett(S111,kool),
    lemmikloom(S112,hobune),
  member(S12,Sobrad),
    sigarett(S12,luckystrike),
    jook(S12,mahl),
  member(S13,Sobrad),
    kodakondsus(S13,jaapanlane),
    sigarett(S13,kent),
  korval(S141,S142,Sobrad),
    kodakondsus(S141,norralane),
    varv(S142,sinine),
  member(S15,Sobrad),
    jook(S15,vesi),
    kodakondsus(S15,Koda1),
    append(vesi(Koda1)),
  member(S16,Sobrad),
    lemmikloom(S16,kalad),
    kodakondsus(S16,Koda2),
    append(kalad(Koda2)).

joob_vett(Kes):-
    moistatus,
    vesi(Kes).

lemmikloomaks_kalad(Kellel):-
    moistatus,
    kalad(Kellel).
