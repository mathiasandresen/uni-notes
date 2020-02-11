---
title: Flow Networks and Maximum Flow
date: 11-02-2020
---

# Flow Networks and Maximum Flow

**Intended Learning Outcome**

* to understand the formalization of flow networks and flows;
    * and the definition of the maximum-flow problem. 
* to understand the Ford-Fulkerson method for finding maximum flows. 
* to understand the Edmonds-Karp algorithm and to be able to analyze its worst-case running time;
* to be able to apply the Ford-Fulkerson method to solve the maximum-bipartite-matching problem.



## Flow Network

A **flow network** $G=(V,E)$ is a directed graph

* Each edge $(u,v)\in E$ has a nonnegative **capacity** $c(u,v)\geq0$
* If $(u,v)\notin E$ then $c(u,v)=0$
* If E contains an edge (u, v), then there is no edge (v, u) in the reverse direction.
* Two special vertices: a ***source*** $s$ and a ***sink*** $t$. 
* For any other vertex v, there is a path $s\to v\to t$

A **flow** in G is a real-valued function $f:V\times V \to R$

![image-20200211082322770](images/03-flow-networks/image-20200211082322770.png)



Flow *in* equals flow *out*



### Examples

![image-20200211082351093](images/03-flow-networks/image-20200211082351093.png)



### Maximum-flow Problem

Consider the source s

The **value** of flow $f$, denoted as $|f|$, is defined as

$$
|f|=\sum_{v\in V}f(s,v)-\sum_{v_\in V} f(v,s)
$$

* Total flow out of the source minus the flow into the source.
* Typically, a flow network will not have any edges into the source, and the flow into the source will be zero. 



**Maximum-flow problem:**

Given a flow network G with source s and sink t, we wish to find a flow of maximum value.



### Anti-parallel edges

To simplify the discussion, we do not allow both (u, v) and (v, u) together in the graph.

* If E contains an edge (u, v), then there is no edge (v, u) in the reverse direction.

Easy to eliminate such antiparallel edges by introducing artificial vertices.

![image-20200211083107662](images/03-flow-networks/image-20200211083107662.png)

![image-20200211083118548](images/03-flow-networks/image-20200211083118548.png)



### Multiple sources and multiple sinks

Example: multiple factories and warehouses

Introducing a super-source s and super-sink t

* Connect s to each of the original source $s_i$ and set is capacity to $\infty$
* Connect t to each of the original sink $t_i$ and set its capacity to $\infty$

![image-20200211083304570](images/03-flow-networks/image-20200211083304570.png)



## The Ford-Fulkerson Method

A method but not an algorithm

* It encompasses several implementations with different running times

The Ford-Fulkerson method is based on

* Residual Networks
* Augmenting paths



### Residual Networks

Given a flow network $G$ and a flow $f$, the residual network $G_f$ consists of edges whose **residual capacities** are greater than 0

* **Formally**: $G_f=(V,E_f)$, where $E_f=\{(u,v)\in V \times V:c_f(u,v)>0\}$

**Residual capacities:**

![image-20200211083619669](images/03-flow-networks/image-20200211083619669.png)

* The amount of additional flow that can be allowed on edge (u, v).
* The amount of flow that can be allowed on edge (v, u), i.e., the amount of flow that can be canceled on the opposite direction of edge (u, v).

#### Example

![image-20200211083858893](images/03-flow-networks/image-20200211083858893.png)



### Augmenting Paths

Given a flow network G and a flow f, an **augmenting path** $p$ is a simple path from s to t in the **residual network** $G_f$

![image-20200211084348676](images/03-flow-networks/image-20200211084348676.png)

* $p=<s, v_2, v_3, t>$

**Residual capacity** of an augmenting path $p$:

* How much additional flow can we send through an augmenting path?
* $c_f(p)=\min(c_f(u,v):(u,v)$ is on path $p)$
    * $c_f(p)=\min(5,4,5)=4$
* The edge with the minimum capacity in $p$ is called **critical** edge (bottleneck)
    * $(v_2,v_3)$ is the critical edge of $p$



### Augmenting a flow

Given an agumenting path $p$ we define a flow $f_p$ on the residual network $G_f$

![](images/03-flow-networks/image-20200211084819652.png)

* the flow value of $|f_p|=c_f(p)>0$

![image-20200211084908383](images/03-flow-networks/image-20200211084908383.png)



#### Examples

![image-20200211085301172](images/03-flow-networks/image-20200211085301172.png)

![image-20200211085316352](images/03-flow-networks/image-20200211085316352.png)



### The Method

![image-20200211091012504](images/03-flow-networks/image-20200211091012504.png)

1. Find an augmenting path in the residual network
2. Augment the existing flow by the flow of the augmenting path
3. Keep doing this until no augmenting path exists in the residual network

The algorithms based on this method differ in how they choose *p* in line 3

Correctness is proved by the **Max-flow min-cut** theorem

#### Example

![image-20200211091245750](images/03-flow-networks/image-20200211091245750.png)

![image-20200211091259071](images/03-flow-networks/image-20200211091259071.png)

### Correctness of Ford-Fulkerson

Why is this method correct?

How do we know that when the method terminates, i.e., when there are no more augmenting paths, we have actually found a maximum flow?

**Max-flow min-cut theorem**

#### Cuts

![image-20200211091757376](images/03-flow-networks/image-20200211091757376.png)



#### Minimum Cut

![image-20200211092100392](images/03-flow-networks/image-20200211092100392.png)



#### Max-flow min-cut theorem

If $f$ is a flow in $G$ the follwoing conditions are equivalent:

1. f is a maximum flow
2. The residual network $G_f$ contains no augmenting paths
3. $|f|=c(S,T)$ for some cut $(S,T)$ of $G$

The correctness of Ford-Fulkerson method

* $2\to1$
* We prove $2\to 3$ and then $3\to1$



#### 2 to 3

![image-20200211092549505](images/03-flow-networks/image-20200211092549505.png)

![image-20200211092557320](images/03-flow-networks/image-20200211092557320.png)



#### 3 to 1

![image-20200211092617502](images/03-flow-networks/image-20200211092617502.png)

### Worst-case Running time

![image-20200211093407168](images/03-flow-networks/image-20200211093407168.png)

Assume integer flows: capacities are integer values

* Appropriate scaling transformation can transfer rational numbers to integral numbers

Each augmentation increases the value of the flow by some positive amount

* worst case. each time the flow value increases by 1

![image-20200211093627552](images/03-flow-networks/image-20200211093627552.png)

$<s,u,v,t>$, $<s,v,u,t>$, $<s,u,v,t>$, $...$

Identifying the augmenting path and augmentation can be done in $O(E)$

Total worst-case running time $O(E\cdot|f^*|)$, where $f^*$ is the max-flow found by the algorithm

*Lesson learned: how an augmenting path is chosen is very important*



## The Edmonds-Karp Algorithm

In line 3 of Ford-Fulkerson method, the Edmonds-Karp regards the residual network as an unweighted graph and finds the shortest path as an augmenting path

* Finding the shortest path in an un-weighted graph is done by calling breath first search (BFS) from source vertex s.

![image-20200211094039383](images/03-flow-networks/image-20200211094039383.png)



**Example on [L03 slides](extra/Lecture-3.pdf#page=33) 38-42**

