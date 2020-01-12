---
title: "Rice's Sætning"
course: CC
session: 07
date: 31-10-2019
---

# Rice's Sætning

$$
\newcommand{\egsk}{\mathscr{S}}\nonumber
$$

## Egenskab

**Definition**

En **egenskab** er en klasse af genkendelige sprog.

En egenskab $\egsk$ er **ikke-triviel** hvis der er genkendelige sprog $L_1,L_2$ så

​	$L_1 \in \egsk$ men $L_2 \notin \egsk$



Der findes kun to trivielle egenskaber:

* $\egsk_{ALT}$
* $\egsk_{INTET}=\{\}$



### Sprog 

Givet en egenskab $\egsk$, definerer vi:

$$
\egsk_{TM}=\left\{ <M> \mid M \text{ er en TM},\ L(M)\in\egsk  \right\}
$$


![image-20191030222900913](images/07-rice/image-20191030222900913.png)



## Rice's Sætning

### **Sætning**

Hvis $\egsk$ er en ikke-triviel egenskab, så er $\egsk_{TM}$ <u>uafgørbart</u>.



#### **Bevis**

Reduktion

$$
A_{TM} \leq_m \egsk_{TM}\\
$$

$$
\langle M,w \rangle \leadsto \langle M' \rangle
$$

så
$$
M \text{ accepterer } w \Leftrightarrow L(M')\in \egsk
$$
Antag at $\empty \notin \egsk$

Det er nok, da:

$$
\begin{align}
\egsk_{TM}&=\{\langle M \rangle\mid M \text{ er en TM, } L(M)\in \egsk \} &&\text{ er afgørbart}\\
&\Updownarrow\nonumber\\
\overline\egsk_{TM}&=\{\langle M \rangle\mid M \text{ er en TM, } L(M)\notin \egsk \}&&\text{ er afgørbart}\\
&=\{\langle M \rangle\mid M \text{ er en TM, } L(M)\in \overline\egsk \}
\end{align}
$$


Vi har at $\empty \notin \egsk$

Der må også være et $L \in \egsk$ (da $\egsk$ er ikke-triviel), hvor $L$ er genkendeligt

Så er der en TM $M_L$ som genkender $L$

Vi bygger, givet $\langle M,w\rangle$, en $M'$ så

* $M$ acc. $w$ $\Rightarrow$ $L(M')=L \in \egsk$
* M acc. ikke $w$ $\Rightarrow$ $L(M')= \empty \notin \egsk$



$M'=$ " 

På input x. 

1. Simuler $M$ på $w$.
2. Hvis M acc. $w$, så
    * simuler $M_L$ på $x$ og svar hvad $M_L$ svarede.
3. Ellers <u>afvis</u>

"

M acc. w $\Rightarrow$ De x'er som $M_L$ acc., bliver accepteret $\Rightarrow$ $L(M')=L\quad \in \egsk$

M acc. ikke w $\Rightarrow$ Intet x bliver acceptereret $\Rightarrow$ $L(M')=\empty\quad \notin \egsk$



### **Korollar**

* $E_{TM}$ er uafgørbart
* $REGULAR_{TM}$ er uafgørbart
* $ENDELIG_{TM}$ er uafgørbart



#### **Bevis**

![image-20191030223812780](images/07-rice/image-20191030223812780.png)



### Opskrift

1. Er der tale om et problem om TM'er?
2. Beslutningsproblem $\to$ sprogudgave
3. Sprogudgave $\to$ Egenskab 
    (hvilken sprogklasse $\egsk$ er der tale om?) [er det overhovedet tilfældet?]
4. Er $\egsk$ en klasse af genkendelige sprog?
5. (Hvis ja) Find et genkendeligt sprog $L_1 \in \egsk$ og et genkendeligt $L_2 \notin \egsk$,
    for så ved vi at $\egsk$ er ikke-triviel