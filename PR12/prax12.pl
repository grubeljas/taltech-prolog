struktuur([sober(_,_,_,_,_), sober(_,_,_,_,_), sober(_,_,_,_,_), sober(_,_,_,_,_), sober(_,_,_,_,_)]).

varv(sober(A,_,_,_,_),A).
kodakondsus(sober(_,B,_,_,_),B).
jook(sober(_,_,C,_,_),C).
sigarett(sober(_,_,_,D,_),D).
lemmikloom(sober(_,_,_,_,F),F).

first([X|_],X).
kesk([_,_,X|_],X).
oli_parem(A,B,[A,B,_,_,_]).
oli_parem(A,C,[A,_,C,_,_]).
oli_parem(A,D,[A,_,_,D,_]).
oli_parem(A,F,[A,_,_,_,F]).
oli_parem(B,C,[_,B,C,_,_]).
oli_parem(B,D,[_,B,_,D,_]).
oli_parem(B,F,[_,B,_,_,F]).
oli_parem(C,D,[_,_,C,D,_]).
oli_parem(C,F,[_,_,C,_,F]).
oli_parem(D,F,[_,_,_,D,F]).

moistatus :-
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
  oli_parem(S51, S52, Sobrad),
    varv(S51, valge),
    varv(S52, roheline),
  member(S6, Sobrad),
    sigarett(S6, winston),
    lemmikloom(S6, madu),
  member(S7, Sobrad),
    sigarett(S7, kool),
    varv(S7, kollane),
  member(S8, Sobrad),
    sigarett(S7, winston).
