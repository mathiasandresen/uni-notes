---
title: Approximation for NP-complete Problems
---

# Approximation for NP-complete Problems



## Approximation Ratios

Suppose that

* we are working on an *optimization* problem with input size $n$
*  each solution has a *cost* value, and we want to identify the optimal solution, i.e., the one with the minimum or maximum possible cost
* optimal solution is $C^*$, returned by an **exact** algorithm that runs in **exponential** time
* approximate solution is $C$, returned by an *approximation* algorithm that runs in **polynomial** time



**Maximization Problem**

* $0<C\leq C^*$,			$C^*/C$ gives a factor
* E.g. $C^*=100,\quad C=90, \quad C^*/C=10/9$ 

**Minimization Problem**

* $0< C^* \leq C$,			$C/C^*$ gives a factor
* E.g. $C^*=100,\quad C=110, \quad C/C^*=11/10$



A p(n)-approximation algorithm has an approximation ratio  p(n), if, for any input size of n, it satisfies $\max({C\over C^*}, {C^* \over C})\leq p(n)$

* $C$ is controlled by ratio $p(n)$
* It provides a guarantee on the performance of an approximation algorithm
    * Consider a 1.2-approximation algorithm with optimal cost $C^*=100$
        * For a **minimization** problem, the algorithm returns a value that is no larger than $100*1.2=120$
        * For a **maximization** problem, the algorithm returns a value that is no smaller than $100/1.2=83.3$
* Approximation ratio is never smaller than 1
* 1-approximation algorithm produces the optimal solution



## Approximation Scheme

An **approximation scheme** for an optimization problem is an **approximation algorithm** that takes as input 

* The **problem** and a value $\varepsilon > 0$
* Then, the scheme is a ($1+\varepsilon$)-approximation algorithm



Polynomial-time approximation scheme, PTAS

* Scheme runs in polynomial time of input size $n$ for any fixed $\varepsilon > 0$, e.g., $O(n^{2/ε})$

Fully polynomial-time approximation scheme, FPTAS

* Scheme runs in polynomial time of both input size $n$ and $1/ε$, e.g., $O((1/ε)^2 n^3$





## Algorithms

* [Approximation Algorithm for Vertex-Cover in lecture 11 slides p. 15](extra/Lecture-11.pdf#page=15)

* [Approximation Algorithm for Traveling-Salesman in lecture 11 slides p. 22](extra/Lecture-11.pdf#page=22)