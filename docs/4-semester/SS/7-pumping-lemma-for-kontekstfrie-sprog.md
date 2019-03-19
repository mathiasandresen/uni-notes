---
title: Pumping Lemma for Kontekstfrie Sprog
course: SS
session: 7
date: 19-03-2019
---

# Pumping Lemma for Kontekstfrie Sprog

**Sætning** 

Hvis L er et kontekstfrit sprog, så findes der et $p>0$ således at for alle $s\in L$ hvor $|s|\geq p$,
findes der en opsplitning $s=uvxyz$ således at:

1. $uv^ixy^iz\in L$ for alle $i\geq0$
2. $|vy|>0$
    * v og y er ikke begge tomme
3. $|vxy|\le p$
    * v og y skal findes inden for et vindue på p tegn



**Anvendelse**

Vise at L ikke er kontekstfrit (modstridsbevis):

* Antag L var kontekstfrit, så var der et $p>0​$ så alle $s\in L​$ hvor $|s|\geq p​$ har en opsplitning så (1), (2) og (3) er overholdt.
* Men så finder vi en $s\in L, \quad |s|\geq p​$, så ingen opsplitning kan overholde (1), (2) og (3)



## Eksempel

$L=\{a^nb^nc^n\ | \ n \geq 0\}$ 	(Kongeeksemplet på et ikke kontekstfrit sprog)



Antag at L var kontekstfrit. Så var der et $p>0$ så for alle $s\in L$ hvor $|s|\geq p$ findes en opsplitning så (1), (2) og (3) er overholdt.

MEN, så finder vi en $s\in L, \quad |s|\geq p$, så ingen opsplitning kan overholde (1), (2) og (3)

​	Vælg $s=a^pb^pc^p$, 	klart at $|s|=3p\geq p$

Undersøg nu alle mulige opsplitninger.
$$
\underbrace{a...a}_p\ \underbrace{b...b}_p \ \underbrace{c...c}_p
$$
Hvor kan v og y ligge henne? 

* v eller y indeholder flere slags tegn.
    * Så bliver (1) overtrådt; $uv^ixy^i z​$ har tegn i forkert rækkefølge
* v består af a'er.
    * Men hvis (3) skal gælde, så må y bestå af a'er eller af b'er. Og så bliver (1) overtrådt:
        * $uv^ixy^i z$ har for få c'er
* v består af b'er. 
    * Men så skal y bestå af b'er eller af c'er, hvis (3) skal overholdes. Men så vil der være for få a'er.
* v består af c'er.
    * Så skal y også kun bestå af c'er. Så vil der være for mange c'er

Ingen opsplitning er gyldig, <u>DVS: L er ikke kontekstfrit.</u> 