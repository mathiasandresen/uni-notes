---
title: Nondeterministiske Endelige Automater
course: SS
session: 2
date: 20-02-2019
---

# Nondeterministiske Endelige Automater

En NFA M accepterer et input w hvis M ved at læse w KAN havne i en accepttilstand til sidst.



!!! note
	Hvis en NFA ingen steder har at gå, "crasher" den, og læser dermed ikke strengen.



## Definition

En nonderterministisk endelig automan (NFA) er en 5-tupel.
$$
(Q,\Sigma,\delta,q_0,F)
$$
$Q$:	endelig mængde af tilstande

$\Sigma​$:	input alfabet

$\delta$: 	overføringsfunktion

$q_0$:	starttilstand $q_0 \in Q$

$F$: 	mængde af accepttilstande $F \subseteq Q$



Transitioner beskriver mængden af mulige efterfølgertilstande for ethvert tegn.

![1550677021774](images/SS2 - Nondertiminstiske Endelige Automater/1550677021774.png)

$\delta(q_1,a)=Ø$

$\delta(q_2,a)=\{q_1,q_2\}​$

$\delta(q_1,\varepsilon)=\{q_2\}​$

$\delta(q_2, \varepsilon)=Ø$ 
$$
\delta:Q\times\Sigma_\varepsilon \rightarrow \mathcal{P}(Q)
$$
​	- mængden af alle delmængder af Q



## Ækvivalens mellem DFA og NFA

NFA'er og DFA'er er ækvivalente:

For enhver NFA N kan vi konstruere en DFA M så: $L(N)=L(M)$



**Eksempel 1:**

![1550677777960](images/SS2 - Nondertiminstiske Endelige Automater/1550677777960.png)

**Eksempel 2:**

![1550677935064](images/SS2 - Nondertiminstiske Endelige Automater/1550677935064.png)



## Lukning Under de Regulære Operationer

### Foreningsmængden

![1550678444296](images/SS2 - Nondertiminstiske Endelige Automater/1550678444296.png)

### Konkatination

![1550678467554](images/SS2 - Nondertiminstiske Endelige Automater/1550678467554.png)

### Stjerneoperationen

![1550678495757](images/SS2 - Nondertiminstiske Endelige Automater/1550678495757.png)



