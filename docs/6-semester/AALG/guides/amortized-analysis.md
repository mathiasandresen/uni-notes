---
title: Amortized Analysis
---



## Amortized Analysis

- The overall idea is to find out how much the average operation costs, because worst case running time may be too pessimistic
- Divide by n to get the cost of a single operation
  - If specified by the exercise

### Aggregate Analysis

- Start by figuring out what it costs to make n operations
  1. Figure out the costs of "standard" operations
     - For example: For a dynamic table, there are $\sim n$ $\Rightarrow$ $O(n)$ insertions without doing any expansions
  2. Figure out the costs of "dynamic"/"varying" cost operations
     - For example: For a dynamic table, that doubles its size when filled, there are $log2(n)$ expansions, that each cost $2^j$ 
     -  because we have to copy all elements to the next table
  3. 

### Amortized Analysis of Dynamic Tables (little bit of a hack)

- If the dynamic table expands by a factor, the amortized complexity is $O(1)$

- If the dynamic table expands by a set amount, the amortized complexity is $O(n)$

