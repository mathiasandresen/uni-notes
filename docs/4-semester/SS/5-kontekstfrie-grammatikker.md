---
title: Kontekstfrie Grammatikker
course: SS
session: 5
date: 13-03-2019
---

# Kontekstfrie Grammatikker

|                                                     | **Beskrive**                               | **Genkende**                                                 |
| --------------------------------------------------- | ------------------------------------------ | ------------------------------------------------------------ |
| **[Regulære <br />sprog](../SS/1a-regulære-sprog.md)** | [Regulære udtryk](../SS/3-regulære-udtryk.md) | [Endelige automater](../SS/1b-endelige-automater.md) <br />- [NFA](../SS/2-nondeterministiske-endelige-automater.md) og DFA (ækv.) |
| **Kontekstfrie <br />sprog**                        | <u>Kontekstfrie grammatikker</u>           | Pushdown-automater<br />- NDPDA og DPDA (ikke ækv.)          |



 ## Definition

En **kontekstfri grammatik** er en 4-tupel
$$
(V,\Sigma,R,S)
$$

| Symbol   | Betydning                                       |
| -------- | ----------------------------------------------- |
| V        | Endelig mængde af variable (aka. nonterminaler) |
| $\Sigma$ | Endelig mængde af terminaler                    |
| R        | Endelig mængde af regler                        |
| S        | Startvariabel $S\in V$ (aka. startsymbol)       |



Regler i R er på formen:
$$
A \longrightarrow w, \quad w \in (V\cup\Sigma)^*
$$

### Eksempel

Sprog:
$$
L=\{a^nb^n | n \geq0\}
$$
CFG:
$$
\text{S} \longrightarrow \varepsilon \ |\  \text{aSb}
$$

​	svarer til:
$$
\begin{align*}
\text{S} &\longrightarrow \varepsilon \\
\text{S} &\longrightarrow \text{aSb}
\end{align*}
$$

#### Byggelse af en streng

Strengen *aaabbb*
$$
\begin{align*}

\text{S} &\Rightarrow \text{aSb} \\
& \Rightarrow \text{aaSbb} \\
& \Rightarrow \text{aaaSbbb} \\
& \Rightarrow \text{aaabbb}


\end{align*}
$$


## Definition

**Derivition**

Lad G være en CFG hvor $G=(V,\Sigma,R,S)$ 
og lad $u,v \in (V\cup\Sigma)^*$

Hvis
$$
\begin{align*}
u&=u_1Au_2 \quad og \quad A\longrightarrow w \\
og \quad v &=u_1wu_2 
\end{align*}
$$
så skriver vi
$$
u \Rightarrow v
$$
<center> u deriverer i et skridt til v

$$
u \Rightarrow^* v
$$

<center> u deriverer i 0 eller flere et skridt til v







