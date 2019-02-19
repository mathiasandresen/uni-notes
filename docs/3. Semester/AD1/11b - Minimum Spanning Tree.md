---

title: Minimum Spanning Tree
course: AD1
session: 11
date: 14-11-2018
---

# More Graph Concepts

**Weighted Graph**

* G = (V, E), with a weight function $\bold{w}:E\rarr\R$
* Weight function **w** assigns a cost value to each edge in E.
* Eg. In a graph modeling a road netwok, the weight of an edge represents the length of a road.
* Eg. $w(e)=10$ or $w(u,v)=10$, given $e=(u)$



**Path**

* A sequence of vertices $<v_1,v_2,...,v_k>$ 
  such that vertex $v_{i+1}$ is adjacent to vertec $v_i$ for $i=1 ... k-1$
* A sequence of edges $<(v_1,v_2),(v_2,v_3),...,(v_{k-1},v_k)>$
* A sequence of edges $<e_1, e_2, ...,e_{k-1}>$, where
  * $e_1=(v_1,v_2)$
  * $e_2=(v_2,v_3),...,$ and
  * $e_{k-1}=(v_{k-1},v_k)$



**Sub-Graph**

* A subset of vertices and edges.

![1547116351129](images\1547116351129.png)

**Connected Graph**

* Any two vertices in the graph are connected by some path

![1547116386832](images\1547116386832.png)

**Tree**

* Connected undirected graph without cycles.



## Spanning Tree

A spanning tree T of a connected, undirected graph G = (V, E) is a sub-graph of G, satisfying:

* T contains all vertices of G;
* T connnects any two vertices of G;
* $T\subseteq E$ and T is acyclic.

T is a tree, since T is <u>acyclic</u> and <u>connects any two vertices</u> of the <u>undirected</u> graph G.

![1547116552981](images\1547116552981.png)

# Minimum Spanning Tree (MST)

There are more than one spanning tree.

MST of a **connected, undirected, weighted** graph G is a spanning tree T:

* Satisfying all conditions of a spanning tree.
* Has the minimum value of $w(T)=\Sigma_{(u,v)\in T}(w(u,v))$,
  among all possible spanning trees.

Finding MST is an optimization problem.



## Growing MST

**Input**

* Connected, undirected, weigthed graph G = (V, E)
* A weight function $w:E\rarr \R$

**Output**

* An MST *A*, ie. a set of edges.



Intuition - Greedy search:

* Initialize A = ø, and A is a subset of some MST, ie. a tree.
* Add one edge (u, v) to A at a time, such that $A \cup\{((u,v)\}$ is a subset of some MST.
* Key part: How to determine an edge (u, v) to add?
  * Edge $(u,v)\in E$ but $(u,v)\notin A$
  * What else?

```text
Generic-MST(G, w)
01	A = Ø
02	while A does not form a spanning tree
03		find an edge (u,v) that is safe for A
04		A = A U {(u,v)}
05	return A
```

<div style="page-break-after: always;"></div>

## Prim's Algorithm

https://www.youtube.com/watch?v=YyLaRffCdk4

A special case of the generic MST method.

**Input**

* Connected, undirected, weighted graph G = (V, E)
* A weight function $w:E\rarr \R$
* A random vertex r to start with.

**Output**

* MST where each vertex v has two attributes
  * Parent, **v.parent**: v's parent in the MST
  * Key, **v.key:** the least weight of any edge connecting v to a vertex in the MST.



**Intuition**

* A vertex based algorithm
* The algorithm maintains a tree.
* Add one vertex to a tree at a time, until all are added -- MSP
* **Safe edge**: the least weight edge that connects a vertex v not in the tree, to a vertex in the tree, ie. greedy feature, -- add v.

### Pseudocode

![1542208839967](images/1542208839967.png)

### Running Example



<center><u>See explanation in lecture-11 slides, slide 24-28!</u></center>



![1547117810248](images\1547117810248.png)

![1547117818884](images\1547117818884.png)

![1547117909565](images\1547117909565.png)

### Complexity

<center><u>See analysis in lecture-11 slides, slide 31</u></center>

$$
O(|E|*lg(|V|))
$$

<div style="page-break-after: always;"></div>

## Kruskal Algorithm

https://www.youtube.com/watch?v=5xosHRdxqHA

A special case of the generic MST method.

**Input**

* Connected, undirected, weighted graph G = (V, E)
* A weight function $w:E\rarr\R$

**Output**

* MST



**Intuition**

* An edge based algorithm
* The algorithm maintains a **forest**, where each vertex is treated as a distinct tree in the beginning.
* Add one edge from G to MST at a time.
* **Safe edge:** the least weight edge amon all edges in G that connects to distinct trees in the **forest**, ie. greedy feature.

The algorithm keeps adding a sefe edge (u, v) to the MST, if (u, v) satisfies:

* C1: has the least weight among all edges in G
* C2: connects two different trees in the forest - (u, v) is not in MST.

If u and v belong to the same tree in the forest, u and v are a part of a MST - adding (u, v) creates a cycle for MST.

### Pseudocode 

![1542208822095](images/1542208822095.png)





### Running Example

<center><u>See explanation in lecture-11 slides, slide 36-41</u></center>



![1547120224386](images\1547120224386.png)

![1547120231107](images\1547120231107.png)

![1547120240130](images\1547120240130.png)

![1547120320524](images\1547120320524.png)



## Generic Algorithm

A **cut** of an undirected graph G = (V, E) is a partition of vertices, denoted as **(S, V-S)**, where $S\sub V$

An edge $(u,v)\in E$ **crosses** the cut if 

* *u* is in *S* and *v* is in *V-S*, or
* *v* is in *S* and *u* is in *V-S*

**Light edge** is an edge crossing the cut an has the minimum weight of any edge crossing the cut.

![1547120729521](images\1547120729521.png)

Given a cut **(S, V-S)** as a partition of G = (V, E).

Considering a set A of edges, we say the cut **respects** A if no edge in A crosses the cut.

![1547120811336](images\1547120811336.png)

 

```
MST(G)
01		A = Ø
02		while A does not form a spanning tree do
03.1		Make a cut (S, V-S) of G that respects A
03.2		Take the light edge (u,v) crossing S to V-S
04			A = A U {(u,v)}
05		return A

```

**3.1:**	

If an edge belongs to A, ie. a part of MST, it does not cross S to V-S, 
this makes sure edges in A are not safe edges.

**3.2:**

The light edge (u, v) is safe for A, satisfying:

* (u, v) crosses S to V-S: (u, v) does not belong to A
* (u, v) has the minimum weight of any edge crossing the cut: greedy.



**Essence:**

* Find a **possible** cut.
* Take a light edge.



### Example

From the AD (DAT/SW) Exam 2015

![1547122042544](images\1547122042544.png)

![1547122048348](images\1547122048348.png)

![1547122056127](images\1547122056127.png)





![1547121293675](images\1547121293675.png)



![1547122090337](images\1547122090337.png)



## Prim's vs Generic Algorithm

<u>See more in lecture-11 slide 48</u>

## Kruskals's vs Generic Algorithm

<u>See more in lecture-11 slide 49-51</u>

