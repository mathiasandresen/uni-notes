---
title: Constraints Satisfaction Problems
course: MI
Session: 16.9
date: 19-09-2019
---

# Constraints Satisfaction Problems

## Features and Variables

Describing the world (environment) by features:

![1568623217971](images/09-16-constrains-satisfaction-problems/1568623217971.png)



A **possible world** for a set of variables is an assignment of a value to each variable.

**Example (Cooking)**:

![1568623171569](images/09-16-constrains-satisfaction-problems/1568623171569.png)



## Constraint Satisfaction Problems

A **constraint** is a condition on the values of variables in a possible world.

Can be specified with:

### Extensional Constraint Specification

![1568623365559](images/09-16-constrains-satisfaction-problems/1568623365559.png)

### Intensional Constraint Specification

![1568623396341](images/09-16-constrains-satisfaction-problems/1568623396341.png)

* If teacher for AD and MI is the same, then the time of AD cannot be the same as time of MI.

### Example: Sudoku

![1568623456251](images/09-16-constrains-satisfaction-problems/1568623456251.png)

Constraints:

![1568623465604](images/09-16-constrains-satisfaction-problems/1568623465604.png)



### Definition

A **Constraint Satisfaction Problem (CSP)** is given by

* a set of variables
* a set of constraints (usually intensional)

A **solution** to a CSP consists of a possible world that satisfies all the constraints (also called a **model** of the constraints)



### CSP as State Space Problem

A CSP can be represented as a state space problem:

![1568623717950](images/09-16-constrains-satisfaction-problems/1568623717950.png)



#### Solving the CSP

![1568623770509](images/09-16-constrains-satisfaction-problems/1568623770509.png)

##### Example

![1568623810156](images/09-16-constrains-satisfaction-problems/1568623810156.png)



## Consistency Algorithms

**Idea**

![1568624557065](images/09-16-constrains-satisfaction-problems/1568624557065.png)



### Constraint Network

![1568624612387](images/09-16-constrains-satisfaction-problems/1568624612387.png)

The **constraint network** for a CSP consists of:

* 1 (oval) node for each variable $X$
* 1 (rectangular) node for each constraint $c$
* An (undirected) arc $\langle X,c \rangle$ between every constraint and every variable involved in the constraint

With each variable node $X$ is associated a **(reduced) domain** $D_X$:

* Initially the domain of the variable
* Reduced by successively deleting values that cannot be part of a solution



#### Arc Consistency

![1568624828123](images/09-16-constrains-satisfaction-problems/1568624828123.png)

![1568624834464](images/09-16-constrains-satisfaction-problems/1568624834464.png)

**Examples**

![1568625351639](images/09-16-constrains-satisfaction-problems/1568625351639.png)

##### Algorithm Outline

![1568625425652](images/09-16-constrains-satisfaction-problems/1568625425652.png)



Example: Slide 18

**Algorithm Outcomes**

![1568625850966](images/09-16-constrains-satisfaction-problems/1568625850966.png)



### Variable Elimination

* Simplify problem by eliminating variables

Operates on extensional (table) representations of constraints

![1568625994544](images/09-16-constrains-satisfaction-problems/1568625994544.png)

Algorithm requires **projection** and **join** operations on tables

**Project**

![1568626049652](../CC/images/01-turing-maskiner/1568626049652.png)

**Join**

![1568626068216](images/09-16-constrains-satisfaction-problems/1568626068216.png)

**Algorithm Outline**

![1568626142470](images/09-16-constrains-satisfaction-problems/1568626142470.png)

Example slide 24

#### Properties

![1568626394800](images/09-16-constrains-satisfaction-problems/1568626394800.png)

