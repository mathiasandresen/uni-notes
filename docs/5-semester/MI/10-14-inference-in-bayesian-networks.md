---
title: Inference in Bayesian Networks
course: MI
Session: 14.10
date: 14-10-2019
---

# Inference in Bayesian Networks

Inference Problem:

* Given: a Bayesian network
* Given an assignment of values to some of the variables in the network: $E_i=e_i(i=1,\dots,l)$
    * "Instantiation of the nodes $\bold E$"
    * "Evidence $\bold E=e$ entered"
    * "Findings entered"
    * ...
* Want: for variables $A\notin \bold E$ the *posterior margnial* $P(A\mid \bold E=e)$



According to the definition of conditional probability, it is sufficient to compute for each $A\in D_A$ the value

$$
P(A=a,\bold E=e)
$$

Together with

$$
P(\bold E=e)=\sum_{a\in D_A}P(A=a,\bold E=e)
$$

This gives the posterior distribution



## Basic Principles

Let $A$ be the variable of interest, $\bold E$ the evidence variables, and $\bold Y=Y_1,\dots,Y_l$ the remaining variables in the network not belonging to $A\cup \bold E$. Then
$$
P(A=a,\bold E=e)=\sum_{y_1\in D_{Y_1}}\cdots\sum_{y_l\in D_{Y_l}}P(A=a,\bold E=e,Y_1=y_1,\dots,Y_l=y_l)
$$