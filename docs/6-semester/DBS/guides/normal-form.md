---
title: Determine Relational Schema Normal Form
---

# Determine Relational Schema Normal Form

$$
\newcommand{\dep}[2]{\{#1\} \to \{#2\}}
\newcommand{\schema}{\mathcal{R}}
\newcommand{\oneton}[1]{\onetonop{#1}{,}}
\newcommand{\onetonop}[2]{#1_{n} #2 \dots #2  #1_{n}}
\nonumber
$$



## Normal Forms

| Normal Form | Main Characteristics         |
| ----------- | ---------------------------- |
| 1NF         | Only atomic attributes       |
| 3NF         | Some transitive dependencies |
| BCNF        | No transitive dependencies   |



## Check 1NF

A relation $\schema$ is in **1NF** if the domains of all its attributes are atomic (no composite or set-valued domains)



## Check 3NF

A relation schema $\schema$ is in **3NF** if at least one of the following conditions holds for each of its FDs $\alpha \to B$ with $B \in \schema$

1. $B \in \alpha$, i.e. the FD is **trivial**
2. $\alpha$ is a **super key** of $R$
3. $B$ is part of a candidate key for $\schema$



### Procedure

For each FD $a\to B$ with $B \in \schema$ check:

1. Is the FD **trivial**?

    * $B \in a$
    * E.g. $X \to X$

2. Is $a$ a **[super key](../04-relational-database-theory.md#super-keys)** of $R$?
    * Does $a$ determine alla attribute values of $R$?
3. Is $B$ part of a **[candidate key](../04-relational-database-theory.md#candidate-keys)** for $\schema$



## Check BCNF

The same as 3NF except condition (3) is gone.

A relation schema $\schema$ is in **BCNF** if at least one of the following conditions holds for each of its FDs $\alpha \to B$ with $B \in \schema$

1. $B \in \alpha$, i.e. the FD is **trivial**
2. $\alpha$ is a **super key** of $R$



### Procedure

For each FD $a\to B$ with $B \in \schema$ check:

1. Is the FD **trivial**?

    * $B \in a$
    * E.g. $X \to X$

2. Is $a$ a **[super key](../04-relational-database-theory.md#super-keys)** of $R$?
    * Does $a$ determine alla attribute values of $R$?