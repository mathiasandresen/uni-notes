---
title: Cheat Sheet for Probability Calculus
---

# Cheat Sheet for Probability Calculus

We consider probability distributions over variables.

A variable can be considered an experiment, and for each outcome of the experiement, the variable has a corresponding state.

We use upper case letters to denote vriables, eg. $A$, and lower case to denote  states.

The state space of a variable $A$ is denoted $sp(A)=(a_1,a_2,...,a_n)$

## Notation

The probability of $A$ being in state $a_i$ is denoted $P(a_i)$ or $P(A=a_i)$

If we omit the state and write $P(A)$ we have a table with probabilities, on one for each state of $A$

**Example**

$A$ is tenary with states $sp(A)=(a_1,a_2,a_3)$ and $P(A)=(0.1,0.3,0.6)$.
Thus $P(A=a_1)=0.1$

## Marginelization

Given $P(A,B)$, we want $P(A)$

$$
P(A)=\sum_BP(A,B)= \sum_{B=b}P(A,B=b)
$$

$P(A,B)=$

| A \ B | $b_1$ | $b_2$ |
| ----- | ----- | ----- |
| $a_1$ | 0.2   | 0.1   |
| $a_2$ | 0.3   | 0.4   |

$P(A)=(\overset{a_1}{0.2+0.1},\overset{a_2}{0.3+0.4})=(0.3,0.7)$



## Conditional Probability

(Can be seen either as a definititon or a theorem)

$$
P(B|A)=\frac{P(A,B)}{P(A)}
$$

Using the tables above we get

![image-20200104124215673](images/09-23appendix/image-20200104124215673.png)

## Bayes Rule

Given $P(A|B)$ and $P(B)$, we want $P(B|A)$

$$
\begin{align*}
P(B|A)&=\frac{P(A|B)\cdot P(B)}{P(A)}\\\\
&=\frac{P(A,B)}{P(A)}\quad \text{(due to the chain rule below)}
\end{align*}
$$

Note that by **marginelization** we have

$$
P(A)=\sum_B P(A,B)
$$


## The Chain Rule

AKA Fundamental Rule

Given $P(A|B)$ and $P(B)$, we want $P(A,B)$
$$
P(A,B)=P(A|B)\cdot P(B)
$$

![image-20200104124827343](images/09-23appendix/image-20200104124827343.png)
