mother(pavel, natali).
mother(kurara, natali).
mother(natali, zina).
mother(galina, zina).
mother(alena, galina).
mother(vitali, galina).
mother(alexander, galina).
mother(valeri, silvi).
mother(dmitri, silvi).
mother(aleksei, nat).
mother(who, nat).

married(natali, valeri).
married(galina, sergei).
married(zina, vladimir).
married(nat, dmitri).
married(silvi, ivan).

male(pavel).
male(valeri).
female(natali).
female(kurara).
male(aleksei).
female(who).
male(dmitri).
female(nat).
male(ivan).
female(silvi).
female(galina).
male(sergei).
female(alena).
male(vitali).
male(alexander).
female(zina).
male(vladimir).

father(Child, Father):- mother(Child, Mother), married(Mother, Father), male(Father).
brother(Child, Brother):- mother(Child, Mother), mother(Brother, Mother), Child\=Brother, male(Brother).
sister(Child, Sister):- mother(Child, Mother), mother(Sister, Mother), Child\=Sister, female(Sister).
parent(Child, Parent):- mother(Child, Parent); father(Child, Parent).
aunt(Child, Aunt):- parent(Child, Parent), sister(Parent, Aunt).
uncle(Child, Uncle):- parent(Child, Parent), brother(Parent, Uncle).
grandfather(Child, Grandfather):- parent(Child, Parent), father(Parent, Grandfather).
grandmother(Child, Grandmother):- parent(Child, Parent), mother(Parent, Grandmother).
