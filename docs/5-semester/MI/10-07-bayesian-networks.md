---
title: Bayesian Networks
course: MI
Session: 07.10
date: 07-10-2019
---

# Bayesian Networks

## Reasoning Under Uncertainty

Example: *Car-start-problem:*

*“In the morning, my car will not start. I can hear the starter turn, but
nothing happens. There may be several reasons for my problem. I can hear
the starter roll, so there must be power from the battery. Therefore, the most probable causes are that the fuel has been stolen overnight or that the spark
plugs are dirty. It may also be due to dirt in the carburetor, a loose connection
in the ignition system, or something more serious. To find out, I first look at
the fuel meter. It shows half full, so I decide to clean the spark plugs.”*

* How can you make a computer do these assumptions, and make a choice what to check?



For propositional logic we have Boolean logic as a framework.

When we deal with uncertain events, it would be nice to have something similar.
We can extend the truth values of propositional logic to **"certainties"** which are numbers between 1 and 0.

**Certainties: **

* A certainty of 0 means "certainly not true"
* A certainty of 1 means "certainly true"

Example:

*“if I take a cup of coffee while on break, I will with certainty 0.5 stay awake during the next lecture”*

or

*“if I take a short walk during the break, I will with certainty 0.8 stay awake during the next lecture.”*



### Casual Perspective on Car Start Problem

To simplify, we assume that we have

* $\{yes, no\} $ for $Fuel?$
* $\{yes, no\}$ for $Clean\ Spark\ Plugs?$
* $\{full, 1/2, empty\}$ for $Fuel\ Meter$
* $\{yes, no\}$ for $Start?$.

AKA *states*.

We know that the state of $Fuel?$ and $Clean\ Spark\ Plugs?$ have a casual impact on the state of $Start?$.

Also, the state of $Fuel?$ has an impact on the state of $Fuel\ Meter$.

This can be represented with a graph:

![1570365172632](images/10-07-bayesian-networks/1570365172632.png)

If we add a direction from $no$ to $yes$ in each variable, we can represent directions of the impact. (Fig. 2.2.)

![1570365274636](images/10-07-bayesian-networks/1570365274636.png)



## Casual Networks and d-Separation

A **Casual Network** consists of

* A set of *variables*
* A set of *directed links* (aka *arcs*)

Mathematically a directed graph.

If there is a link from *A* to *B* we say that *B* is a *child* of *A*, and *A* is a *parent* of *B*.



### Serial Connection

Consider fig 2.3:

![1570365651646](images/10-07-bayesian-networks/1570365651646.png)

Evidence about *A* will influence the certainty of *B*, which influences the certainty of *C*.
Similarly, evidence about *C* will influence the certainty of *A* through *B*.

If the state of *B* is known, the channel is "blocked" and we say that *A* and *C* are **d-separated** given *B*.

When a state of a variable is known, we say that the variable is *instantiated*.

> *We conclude that evidence may be transmitted through a serial connection unless the state of the variable in the connection is known*



### Diverging Connection

![1570561504529](images/10-07-bayesian-networks/1570561504529.png)

Influence can pass between all the children of A unless the state of A is known.

* *B,C,...,E* are d-separated given *A*



### Converging Connection

![1570561638114](images/10-07-bayesian-networks/1570561638114.png)

* If nothing is known about *A* except what may be inferred from knowledge of its parents, then the parents are independent.
* However, if anything is known about the consequences, then information on on possible cause may tell us something about the other causes.

![1570561832362](images/10-07-bayesian-networks/1570561832362.png)