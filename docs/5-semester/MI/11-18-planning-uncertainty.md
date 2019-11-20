---
title: Planning under Uncertainty
course: MI
session: 18.11
date: 18-11-2019
---

# Planning under Uncertainty



## Preferences and Utility

Agent chooses actions based on **outcome**.

* Whatever the agent has preferences over.
* If it does not prefer any outcome, it doesn't matter what it does.

Assume finite number of outcomes.



**Weakly Preferred**

Suppose $o_1$ and $o_2$ are outcomes. We say that $o_1$ is **weakly preferred** to $o_2$, written $o_1 \succeq o_2 $, if $o_1$ is at least as desirable as $o_2$

**Equally Preferred**

Define $o_1 \sim o_2$ if $o_1 \succeq o_2$ and $o_2 \succeq o_1$.

* They are equally preferred
* The agent is **indifferent** between $o_1$ and $o_2$

**Strictly Preferred**

Define $o_1 \succ o_2$ to mean $o_1 \succeq o_2$ and $o_2 \nsucceq o_1$ 

* We say $o_1$ is **strictly preferred** to outcome $o_2$



A **lottery** is defined to be a finite distribution over outcomes, written:

$$
[p_1:o_1,p_2:o_2,\dots , p_k:o_k]
$$

where each $o_i$ is an outcome and $p_i$ is a non-negative real number such that $\sum_ip_i=1$

The lottery specifies that outcome $o_i$ occurs with probability $p_i$.



**Axiom 9.1 - Completeness**

*An agent has preference between all pairs of outcomes:*

$$
o_1 \succeq o_2\ or\ o_2 \succeq o_1
$$

**Axiom 9.2 - Transitivity**

*Preferences must be transitive:*

$$
if\ o_1 \succeq o_2\ and\ o_2 \succeq o_3\ then\ o_1 \succeq o_3
$$

**Axiom 9.3 - Monotonicity**

*An agent prefers a larger chance of getting a better outcome than a smaller chance of getting the better outcome. That is, if* $o_1\succ o_2$ *and* $p>q$ *then*

$$
[p:o_1, (1-p): o_2] \succ [q:o_1, (1-q):o_2]
$$

