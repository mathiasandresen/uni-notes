---
title: 6 - Concurrency Problems
---

# 6 - Concurrency Problems

*Keywords*: Definition of deadlock, mutual exclusion, resource allocation graph, Coffman’s conditions, solution strategies (prevention, avoidance, detection and recovery), how to achieve deadlock prevention (breaking Coffman’s conditions), safe states and deadlock avoidance, deadlock detection and recovery, livelock, priority inversion.

## Litterature

OSTEP Chapter 25, 26, (27), 28, (29), (30), 31, 32, (33), 34

Kapitler med parenteser skimmes: (x)

## Learning Goals

After today’s lecture, you:

* ... can define and explain the concept of **deadlock**
* ... can define and explain **Coffman’s conditions** for deadlock
* ... can explain and use **deadlock prevention strategies**:
    * **prevention**
    * **avoidance**
    * **detect-and-recover**
* ... can define and explain the following concepts
    * **livelock**
    * **priority inversion**
* ... can use the **Dining Philosophers** example to explain concurrency
    issues

## Noter

#### The Dining Philosophers

* 5 filosoffer
* Mellem hver er en enkelt gaffel.
* En filosof kan enten tænke eller spise
    * Tænke: ingen gaffel
    * Spise: gaffel

![1559480046648](images/6-concurrency-problems/1559480046648.png)

