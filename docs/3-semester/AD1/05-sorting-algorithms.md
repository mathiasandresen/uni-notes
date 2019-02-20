---
title: Sorting Algorithms
date: 2018-10-04
---

# Sorting Algorithms

**Sorting:**

Input: A sequence of n numbers

Output: A permutation (reordering) of the input sequence

(slide 8)



> When in doubt, sort!

\- One of the principles of algorithm design.



**Insertion sort**

* *In-place*[^in-place] sorting algorithm
* Worst case complexity $\Theta(n^2)​$

**Merge sort**

* Uses the [DaC](./AD1 - Divide-and-Conquer.md#divide-and-conquer) technique
* Not *in-place*[^in-place] sorting, which requires additional storage with the size of the input array
* Worst case complexity $\Theta(n\cdot lg(n))$


**Important properties**

* Whether a sorting algorithm is in-place?
* What is the worst case complexity  $\Theta(n^2)$ or $\Theta(n\cdot lg(n))$?



[^in-place]: **In-place**: Only a constant number of elements of the input array are ever stored outside the array. 

## Bubble Sort

* Popular but inefficient.
* Repeatedly swapping adjacent elements that are out of order.

![1538650073759](./images/1538650073759.png)

### Example

![1538650106941](./images/1538650106941.png)





## Selection Sort

![1538650752712](./images/1538650752712.png)

**Pseudo Code**:

![1538650776951](./images/1538650776951.png)

### Example

![1538650804300](./images/1538650804300.png)

## Quick Sort

A DaC algorithm.

Does not require additional array like [Merge Sort](./AD1 - Divide-and-Conquer.md#merge-sort) 

* Sorts in-place [^in-place]

![1538652281759](./images/1538652281759.png)

![1538652290222](./images/1538652290222.png)

### Example

![1547029910612](C:\Users\Mathias\AppData\Roaming\Typora\typora-user-images/1547029910612.png)

