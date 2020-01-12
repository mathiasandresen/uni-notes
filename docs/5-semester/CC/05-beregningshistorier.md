---
title: Uafgørbare Problemer om Beregningshistorier
---

# Uafgørbare Problemer om Beregningshistorier

## Konfigurationer

En TM $M$ accepter input $w$ hvis der findes en følge af konfigurationer
$$
C_1,\dots,C_k
$$
så

* $C_1=q_0w$                                                       ($q_0$ er $M$'s starttilstand')
* $C_i\to C_{i+1}$                                                     (for $1 \leq i \leq k-1$)
* $C_k$ er en accepterende konfiguration       (indeholder $q_{accept}$)



## Lineært Begrænsede Automater (LBA)

En **Lineært begrænset automat (LBA)** er en TM der aldrig anvender flere båndceller end dem input står på.



1. Klassen af sprog som kan genkendes med LBA'er er præcis de **kontekst-sensitive sprog**
    *  Defineret med CSG'er, hvor regler er på formen
        * $uAv\to u\alpha v$
2. Klassen af sprog som kan genkendes af LBA'er er præcis de sprog som kan genkendes af algoritmer med lineær pladskompleksitet.



### Acceptproblemet for LBA'er

"Givet en LBA $M$ og input $w$, vil $M$ acceptere $w$?"

$$
A_{LBA}=\left\{\langle M,w\rangle \mid M \text{ er en LBA, der accepterer } w \right\}
$$

**Sætning**

$A_{LBA}$ er afgørbart!

#### Bevis

![image-20200111161113301](images/05-beregningshistorier/image-20200111161113301.png)

### Tomhedsproblemet for LBA'er

"Givet en LBA $M$, gælder det at $L(M)=\empty$"

$$
E_{LBA}=\{\langle M\rangle\mid M \text{ er en LBA, } L(M)=\empty\}
$$

**Sætning**

$E_{LBA}$ er uafgørbart



### Totalitetsproblemet for CFG'er

"Givet en CFG $G$, gælder det at $L(G)=\Sigma^*$?"

$$
ALL_{CFG}=\{ \langle G\rangle \mid G \text{ er en CFG, } L(G)=\Sigma^*\}
$$

**Sætning**

$ALL_{CFG}$ er uafgørbart!