---
title: Logical (Heuristic) Query Optimization
---

# Logical (Heuristic) Query Optimization

1. Break up conjunctive selection predicates

2. Push selections down

3. Introduce joins by combining selections and cross products

4. Determine join order 

    **Heuristic**: execute joins with input from selections before executing other joins

5. Introduce and push down projections

    Not always useful



**Rules of thumb**

* Perform selections as early as possible
* Perform projections as early as possible



**The optimization process**

* Generate initial query plan from SQL statement
* Transform query plan into more efficient query plan via a series of modifications, each of which hopefully reducing execution time

