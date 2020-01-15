---
title: Sprogproblemer
---

# Sprogproblemer

## Afgørbare Sprog

$$
A_{DFA}=\{\langle B, w\rangle \mid B \text{ er en DFA der accepterer } w\}
$$

* $A_{DFA}$ er <u>afgørbart</u>

$$
E_{DFA} = \{\langle A\rangle \mid A \text{ er en DFA og } L(A) = \empty\}
$$

* $E_{DFA}$ er <u>afgørbart</u>

$$
A_{CFG}=\{\langle G, w\rangle \mid G \text{ er en CFG der genererer } w\}
$$

* $A_{CFG}$ er <u>afgørbart</u>



## Uafgørbare Sprog


$$
A_{TM}=\{\langle M,w \rangle \mid M \text{ er en TM der accepterer } w\}
$$

* $A_{TM}$ er <u>uafgørbart</u>
    * <u>Genkendeligt</u>
    * **Ikke** <u>ko-genkendeligt</u>

---


$$
HALT_{TM} = \{\langle M, w\rangle \mid M \text{ er en TM der standser på input } w\}
$$

* $HALT_{TM}$ er <u>uafgørbart</u>
    * <u>Genkendeligt</u>
    * **Ikke** <u>ko-genkendeligt</u>

---


$$
E_{TM} = \{\langle M\rangle \mid M \text{ er en TM og } L(M) = \empty\}
$$

* $E_{TM}$ er <u>uafgørbart</u>

---


$$
EQ_{TM}=\{\langle M_1, M_2\rangle \mid {M_1, M_2 \text{ er TMs og } L(M_1)=L(M_2)}\}
$$

* $EQ_{TM}$ er <u>uafgørbart</u>
    * **Ikke** <u>genkendeligt</u>
    * **Ikke** <u>ko-genkendeligt</u>

---





## Sprog i NP

$$
SAT=\{\langle \phi \rangle \mid \phi \text{ er en opfyldelig Boolsk formel }\}
$$

* $SAT$ er <u>afgørbart</u>
* $SAT\in NP$

---


$$
HAMPATH=\{\langle G,s,t\rangle \mid G \text{ er en orienteret graf med en Hamilton-sti fra knude } s \text{ til } t\}
$$

* $HAMPATH$ er <u>afgørbart</u>



---


$$
COMPOSITE=\{\langle n \rangle \mid n\in \N, n \text{ sammensat}\}
$$

* $COMPOSITE$ er <u>afgørbart</u>

---


$$
3SAT = \{\langle \phi \rangle\mid \phi \text{ er en opfyldelig 3CNF-formel}\}
$$

* $3SAT$ er <u>afgørbart</u>
* $3SAT$ er NP-fuldstændig

---


$$
VERTEX-COVER=\{ \langle G,k\rangle\mid G \text{ er en ikke-orienteret graf med en k-knudeoverdækning} \}
$$

* <u>Afgørbart</u>
* NP-fuldstændigt

---


$$
UHAMPATH=\{\langle G,s,t\rangle \mid G \text{ er en ikke-orienteret graf med en Hamilton-sti fra knude } s \text{ til } t\}
$$

* <u>Afgørbart</u>
* NP-fuldstændigt

---


$$
SUBSET-SUM=\left\{\langle S, k\rangle\ \left|\ \begin{array}{} S \text{ er en endelig mængde } S\subseteq \N,\\ \text{ og der findes } S'\subseteq S \text{ så } \sum_{x\in S'} x=k,\quad k\in \N \end{array} \right. \right\}
$$

* <u>Afgørbart</u>
* NP-fuldstændigt