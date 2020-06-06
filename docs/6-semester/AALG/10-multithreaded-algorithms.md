---
title: Multithreaded Algorithms
---

# Multithreaded Algorithms

## Concurrency Keywords

**Spawn**

* If it precedes a procedure call, it indicates a ***nested parallelism***
* No need to wait for the procedure with keyword **spawn**

**Sync**

* Must wait for all spawned procedures to complete before going to the statement after **sync**

**Parallel**

* For parallel loops
* Just like a for loop, but loop executions run concurrently



## Work, Span, Parallelism

**Work**

* The running time on a machine with one processor ($T_1$)
  * Fibonacci: $\Theta(\phi^n)$

**Span**

* The running time on a machine with infinite processors ($T_\infty$)
  * Fibonacci: $\Theta(n)$

**Parallelism**

* $Work/Span$
* How many processors on average are used by the algorithm
  * Fibonacci: $\Theta(\phi^n/n)$



**Multithreaded computation on $P$ processors**: $T_P$

## Computation DAG

Using an example of computing Fibonacci number of 4

![image-20200306083429706](images/11-multithreaded-algorithms/image-20200306083429706.png)

Edge $(u,v)$ means that $u$ must execute before $v$

![image-20200306083657129](images/11-multithreaded-algorithms/image-20200306083657129.png)



![image-20200306083528295](images/11-multithreaded-algorithms/image-20200306083528295.png)

* **Work:** The number of vertices
  * 17
* **Span**: The length of the longest path *(critical path)* 
  * 8



## Work Law and Span Law

**Work Law**

* $T_P \geq T_1/P$
* An ideal parallel computer with $P$ processors can do at most $P$ units of work

**Span Law**

* $T_P \geq T_\infty$
* An ideal parallel computer with $P$ processors cannot run any faster than a machine with unlimited number of processors



**Speedup**

* $T_1/T_P$

* How many times faster the computation on $P$ processors than on a single processor

* Recall the *work law* says that $T_P\geq T_1/P$, so the speedup must be smaller than or equal to $P$

  * The speedup on a P-processors machine can **at most** be P
  * If the speedup is P, we have a **perfect linear speedup**

  



### Example

Computing `P-Fib(4)` we know that the work $T_1 = 17$ and span $T_\infty=8$

* P=2
  * Can have perfect linear speedup $T_2= 17/2=8.5,\quad \geq T_\infty$
* P=3
  * <u>Cannot</u> have perfect linear speedup $T_3=17/3=5.7, \quad \leq T_\infty$
    * which is impossible



### Slackness

Slackness = Parallelism / P

* The larger the slackness, the more likely to achieve perfect speedup.
* When slackness is less than 1, it is impossible to achieve perfect linear speedup



## Summarize

![image-20200306085839491](images/11-multithreaded-algorithms/image-20200306085839491.png)

