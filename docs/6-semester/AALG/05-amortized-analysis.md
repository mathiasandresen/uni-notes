---
title: Amortized Analysis
---

# Amortized Analysis

**The Problem Setting**

* We have a **data structure**
* We perform a **sequence of operations** on the data structure
* Operations may be of different types (e.g. insertions, deletions)
* Depending on the state of the structure the actual cost of an operation may differ (e.g. inserting into a sorted array)
* Just analyzing the worst-case time of a single operation may not say too much
* We want the amortized running time of an operation





## Accounting Method

Charge different operations with different **amortized costs**

* Some operations charged **more** than they actually cost.
* Some operations charged **less** than they actually cost.



If **amortized cost** ($\hat c_i$) > actual cost ($c_i$), store the remained amount on **specific objects** as **credit**

If **amortized cost** ($\hat c_i$) < actual cost ($c_i$), use **credit** to compensate

