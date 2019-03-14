---
title: Pushdown Automater
course: SS
session: 6
date: 15-03-2019
---

# Pushdown Automater

> PDA = en automat med en stak



!!! warn "Udvid noter"
    indsæt information om overføringsfunktion fra SS6 afsnit 2 [https://www.youtube.com/watch?v=KUZwifJbGxE&list=PLA8H0-CuqhGGH6lTKmcgzzmK7kkwX75rF&index=2](https://www.youtube.com/watch?v=KUZwifJbGxE&list=PLA8H0-CuqhGGH6lTKmcgzzmK7kkwX75rF&index=2)



**Definition**

En pushdown-automat (PDA) er en 6-tupel
$$
(Q,\Sigma, \Gamma, q_0, \delta, F)
$$

| Symbol   | Betydning                      |
| -------- | ------------------------------ |
| Q        | Mængde af tilstande            |
| $\Sigma$ | Input alfabet                  |
| $\Gamma$ | Stak alfabet                   |
| $q_0$    | Starttilstand $q_0 \in Q$      |
| $\delta$ | Overførselsfunktion            |
| F        | Accepttilstande $F\subseteq Q$ |

$$
\delta:\quad Q \times \Sigma_{\varepsilon} \times \Gamma_{\varepsilon} \longrightarrow \mathcal{P}(Q \times \Gamma_{\varepsilon})
$$



## PDA Som en Orienteret Graf

![1552589067883](images/6-pushdown-automater/1552589067883.png)

**Betyder:**

Når PDA'en er i tilstand *q* og ser *a* som næste input tegn og *x* er øverst på stakken, så skift til tilstand *r* og erstat *x* med *y*.
$$
(r,y)\in\delta(q,a,x)
$$


## Eksempel

$$
L=\{a^nb^n\ | \ n\geq 0\}
$$

![1552589396043](images/6-pushdown-automater/1552589396043.png)

$ bruges som bundmarkør i stakken.

Inputstreng: *aabb*

Stakindhold:

![1552589510346](images/6-pushdown-automater/1552589510346.png)





## Sprog Accepteret af PDA

Lad $M=(Q,\Sigma, \Gamma, q_0, \delta, F)$ være en PDA

Lad $w\in\Sigma^*$, hvor $w=u_1...u_k$, hvor $u_i\in\Sigma_{\varepsilon} \quad (1\leq i\leq k)$

**M accepterer w** hvis:

* 