---
title: Tidskompleksitet
course: CC
session: 09
date: 12-11-2019
---

# Tidskompleksitet



Lad $M$ være en TM, der standser for ethvert input.

**Tidskompleksiteten af $M$** er en funktion

$$
t_M:\N\to\N
$$

så 

​	$t_M(n)=k$ 

hvis $M$ på et vilkårligt input af længde n højst bruger k skridt.



Sammelign vækstrater med [O-notation](..\..\3-semester\AD1\extra1-big-o-cheat-sheet.md)



## Kompleksitetsklasser

**Kompleksitetsklasse**

$=$

famillie af sprog, der alle kan afgøres med afgører med bestemt tidskompleksitet.



**Definition**

Lad $f: \N \to \R_+$

Så er $TIME(f(n))$ familien af sprog givet ved:

$$
TIME(f(n))=\left\{ L\ \mid \begin{array}\  L \text{ kan afgøres af en TM M, }\\
\text{der har tidskompleksitet } O(f(n) \end{array} \right\}
$$



## Antallet af Bånd på TM

Hvad betyder antallet af bånd på en TM for tidskompleksiteten?

**Sætning**

Lad M være en k--bånds-TM med tidskompleksiteten $t(n)\geq n$.

Så kan vi simulere M på en 1-bånds TM med tidskompleksitet $t^2(n)$

​	Afhængig ikke af antal bånd!

