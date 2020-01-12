---
title: Er der Flere Problemer end Algoritmer? Og er Problemer Beslægtede?
course: CC
session: 04
date: 08-10-2019
---

# Er der Flere Problemer end Algoritmer? Og er Problemer Beslægtede?

**Læringsmål**

* Forstå begreberne "samme størrelse" for mængder og de begreber, der er nødvendige for at definere det (herunder bjektioner)

* Forstå og kunne anvende teknikken til diagonalisering

* Forstå hvordan diagonaliseringsteknikken og beviset for uafgørbarhed er relateret

* Forstå sætningen om uafgørbarhed for $HALT_{TM}$ og dens bevis ved reduktion

    ![1570456807824](images/04-more-problems-than-algorithms/1570456807824.png)

## Mængdens Størrelse

**Enentydig (1-1)**

Lad $A,B$ være mængder og $f:A\to B$

$f$ er *1-1* eller *enentydig* hvis:
$$
\forall a_1,a_2\in A: f(a_1)\neq f(a_2)
$$
hvis $a_1 \neq a_2$

(Altså hvis 2 forskellige værdier, giver 2 forskellige outputs i funktionen)



**På**

Lad $A,B$ være mængder og $f:A\to B$

$f$ er *på* hvis:
$$
\forall b \in B : \exists a \in A: f(a) = b
$$


**Bijektion**

Lad $A,B$ være mængder og $f:A\to B$

$f$ er en **bijektion** hvis $f$ er 1-1 og på.



**Samme Størrelse**

Lad $A,B$ være mængder.

Vi siger at $A$ og $B$ har samme størrelse (**kardinalitet**) hvis:
$$
\exists f: A\to B, \text{så } f \text{ er en bijektion}
$$
![1570457592515](images/04-more-problems-than-algorithms/1570457592515.png)

**Tællelig Mængde**

Lad $A$ være en mængde.

$A$ er tællelig hvis $A$ har samme størrelse som de naturlige tal ($\N$).



### Tællelige Mængder 

#### Positive Rationelle Tal

$\Q_+$ er en tællelig mængde! (Positive rationelle tal)

![1570458181649](images/04-more-problems-than-algorithms/1570458181649.png)

#### Alle Strenge over Sigma

$\Sigma^*$ er en tællelig mængde!

![1570458514766](images/04-more-problems-than-algorithms/1570458514766.png)

* **Konsekvens**: 
    * Der er kun tælleligt uendeligt mange TM'er
        * Da hver TM $M$ beskrives med en strengkonstruktion $\langle M\rangle$



### Overtællelige Mængder

Lad $A$ være en uendelig mængde.

Hvis $A$ ikke er tællelig, kalder vi $A$ for overtællelig.



#### Positive Reelle Tal

$\R_+$ er overtællelig.

Bevis: [Numberphile - Diagonalisering](https://youtu.be/elvOZm0d4H0?t=280).





#### Potensmængden af alle Strenge

$\mathcal{P}(\Sigma^*)$ er en overtællelig mængde.

Bevis ved diagonalisering:

Observation: Ethvert sprog svarer til en uendelig 0-1-følge (og omvendt)

![1570460133317](images/04-more-problems-than-algorithms/1570460133317.png)

![1570460152110](images/04-more-problems-than-algorithms/1570460152110.png)



## Uafgørbare Sprog

### HALT

**Theorem 5.1**

$HALT_{TM}$ er uafgørbart.

#### Bevis

Lad os antage af TM $R$ afgør $HALT_{TM}$, så kan vi konstruerer TM $S$ til at afgøre $A_{TM}$:

$S=$ "På input $\langle M, w\rangle$":

1. Kør TM $R$ på input $\langle M, w\rangle$
2. Hvis $R$ afviser, *afvis*
3. Hvis $R$ accepterer, simuler $M$ på $w$ indtil den halter
4. Hvis $M$ har accepteret, *accepter*, ellers *afvis*

Ergo: Hvis $R$ afgør $HALT_{TM}$, så afgør $S$, $A_{TM}$. Men da $A_{TM}$ er uafgørbart, da må $HALT_{TM}$ også være uafgørbart. $\square$

