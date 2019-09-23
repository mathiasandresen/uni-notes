---
title: Reasoning Under Certainty
course: MI
Session: 23.9
date: 23-09-2019
---

# Reasoning Under Certainty

**Epistemological**

* Pertaining to an agent’s beliefs of the world

**Ontological**

* How the world is.



## Semantics of Probability

Probability theory is built on the foundation of [worlds and variables](https://artint.info/2e/html/ArtInt2e.Ch4.S1.html).

The variables in probability theory are referred to as **random variables**.



Variables are written starting with an uppercase letter.

* Each variable has a **domain**. The set of values that it can take.
* A **discrete variable** has a domain that is a finite or countable set.

A **primitive proposition** is an assignment of a value to a variable or an inequality between variables, or variables and values.

Examples:

* $A=true$
* $X<7$
* $Y>Z$

Propositions are built from primitive propositions using [logical connectives](https://artint.info/2e/html/ArtInt2e.Ch5.S1.SS1.html).



A **probability measure** is a function $P$ from worlds into non-negative real numbers such that,
$$
\sum_{\omega \in \Omega}{P(\omega)}=1
$$
​	where $\Omega$ is the set of all **possible worlds**.



The definition of $P$ is extended to cover propositions.

The probability of proposition $\alpha$ written $P(\alpha)$, is the sum of the probabilities of possible worlds in which $\alpha$ is true.
$$
P(a)= \sum_{\omega\ :\ \alpha \text{ is true in } \omega}{P(\omega)}
$$


### Probability Distribution

If $X$ is a random variable, a **probability distribution** $P(X)$ over $X$ is a function from the domain of $X$ into the real numbers, such that given a value

​	$x\in domain(X)$, $P(x)$ is the probability of the proposition $X=x$.

A probability distribution over a set of variables is a function from the values of those variables into a probability. Example:

​	$P(X,Y)$ is a probability distribution over $X$ and $Y$ such that

​	$P(X=x,Y=y)$, where $x\in domain(X)$ and $y\in domain(Y)$

has the value $P(X=x \and Y=y)$ where $X=x \and Y=y$ is a proposition and $P$ is the function on propositions defined above.



If $X_1 \dots X_n$ are all of the random variables, then an assignment to all of the random variables corresponds to a world,

and the probability of the proposition defining a world is equal to the probability of the world.

The distribution over all worlds, $P(X_1, \dots,X_n)$ is called the **joint probability distribution**.



## Axioms for Probability

Suppose $P$ is a function from propositions into real numbers that satisfies the following three **axioms of probability:**

**Axiom 1**

​	$0\leq P(\alpha)$ for any proposition $\alpha$. That is, the belief in any proposition cannot be negative.

**Axiom 2**

​	$P(\tau)=1$ if $\tau$ is a tautology. That is, if $\tau$ is true in all possible worlds, its probability is 1.

**Axiom 3**

​	$P(\alpha \or \beta)=P(\alpha)+P(\beta)$ if $\alpha$ and $\beta$ are contradictory propositions;
That is, if $\neg(\alpha \or \beta)$ is a tautology.
In other words, if two propositions cannot both be true (mutually exclusive), the probability of their disjunction, is the sum of their probabilities.



If a measure of belief follows these intuitive axioms, it is covered by probability theory.

**Proposition 8.1**: 

*If there are a finite number of finite discrete random variables, Axioms 1, 2 and 3 are sound and complete with respect to the semantics*

**Proposition 8.2**:

*The following holds for all propositions* $\alpha$ *and* $\beta$:

1. *Negation of a proposition:*

$$
P(\neg\alpha)=1-P(\alpha)
$$

2. *If* $\alpha \leftrightarrow \beta$, *then* $P(\alpha)=P(\beta)$. *That is, logically equivalent propositions have the same probability.*

3. *Reasoning by cases*:

$$
P(\alpha)=P(\alpha \and \beta)+P(\alpha \and \neg \beta)
$$

4. *If* $V$ *is a random variable with domain* $D$, *then, for all propositions* $\alpha$

$$
P(\alpha)=\sum_{d\in D}{P(\alpha \and V = d)}
$$

5. *Disjunction for non-exclusive propositions:*

$$
P(\alpha \or \beta)=P(\alpha) + P(\beta) - P(\alpha \and \beta)
$$

[Proof](https://artint.info/2e/html/ArtInt2e.Ch8.S1.SS2.html#Ch8.S1.I4)

