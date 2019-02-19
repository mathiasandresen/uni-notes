---
title: Elementary graph algorithms (B)
course: AD1
session: 10
date: 08-11-2018
---

# Searching a graph

Systematically  following its edges so as to visit its vertices.

* Can discover the structure of a graph.
* Many algorithms begin by searching their input graph to obtain the structure information.
* Searching a graph lies at the heart of the field of graph algorithms.



## Breadth-first search (BFS)

Discovers all vertices at a distance k from s before discovering any vertices at distance k+1.

​	"Breadth First"

**Input**:

* A graph G=(V,E) and a source vertex s

**Aim**:

* Systematically discovers **every** vertex that is **reachable** from s.

**Output**:

* The distance from s to each reachable vertex.
  * Distance = the smallest number of edges (unweighted graph)
* A Breadth-first tree with root s that contains all reachable vertices.



Vertex **attributes**:

* **Color**:
  * **White**: unexplored
  * **Gray**: explored, but not all adjacent vertices has been explored.
  * **Black**: explored + all adjacent explored.
* **Distance**:
  * Distance to source s.
* **Parent**:
  * Its parent in the breadth-first tree.

<div style="page-break-after: always;"></div>

### Algorithm

![1547053018450](images\1547053018450.png)

<div style="page-break-after: always;"></div>

### Running Example

![1547053162862](images\1547053162862.png)

<div style="page-break-after: always;"></div>

#### Breadt-first tree

![1547053288192](images\1547053288192.png)



### Running Time

​	<u>See analisys in lecture-10 slides, slide 26</u>

Running time:
$$
O(|V|+|E|)
$$

<div style="page-break-after: always;"></div>

## Depth-first search (DFS)

It searches "deeper" in the graph whenever possible.

**Input:**

* A graph G=(V,E)

**Aim:**

* Systematically visit **every** vertex in V.

**Output:**

* A depth-first forest that is composed of several depth-first trees.



Vertex **attributes**:

- **Color** (same as BFS):
  - **White**: unexplored
  - **Gray**: explored, but not all adjacent vertices has been explored.
  - **Black**: explored + all adjacent explored.
- **Timestamp**:
  - v.d: **discovery** time, ie. when v is first explored.
  - v.f: **finishing** time, ie. when v finishes examining v's adjacency list.
- **Parent**:
  - Its parent in the depth-first tree.

<div style="page-break-after: always;"></div>

### Algorithm

![1547053848727](images\1547053848727.png)

<div style="page-break-after: always;"></div>

### Running Example

![1547053883827](images\1547053883827.png)

<div style="page-break-after: always;"></div>

#### Depth-first forest

![1547053911194](images\1547053911194.png)

### Running Time

Initializes all vertices (DFS: line 1-4): 

​	$\Theta(|V|)$

DFS-Visit is called **exactly once** for each vertex, when its white (DFS: line 5-6):

​	$\Theta(|V|)$

For each vertex u, the loop executes |u.adjacent()|​ times (DFS-Visit: line 4-7).

​	$\Sigma_{u\in V}(|u.adjacent()|=|E|)$

Thus:
$$
\Theta(|V|+|E|)
$$

<div style="page-break-after: always;"></div>

## BFS vs. DFS

**BFS**

* Search from one **source**
* **Only** visits vertices that are **reachable** from source.
* BFS tree.
* Often serves to find shortest paths and shortests path distances.
* $O(|V|+|E|)$

**DFS**

* May search from multiple sources.
* Visit every vertex.
* DFS forest.
* Often as a subroutine in another algorithm, eg.:
  * Classifying edges.
  * Topological sort.
  * Strongly connected components
* $\Theta(|V|+|E|)$



<div style="page-break-after: always;"></div>

## Edge Classification based on DFS

**Tree edges:**

* Edges that are in the DFS forest
* From the example (u,v), (v,y), (y,x), (w,z)

**Non Tree edges**:

* Back edges
  * From descendant to ancestor in DFS tree
    * (x,v)
  * Self loops
    * (z,z)
* Forward edges
  * From ancestor to descendant in a DFS tree
    * (u,x)
* Cross edges
  * Remaining edges, between trees or subtrees
    * (w,y)

![1547111144355](images\1547111144355.png)

When exploring an edge (x,y), y's color tells something:

* If y is **white** - visit x, then y, edge (x, y) is a tree edge.
* If y is **gray** - visit y, later x, then y again, edge (x, y) is a back edge.
* If y is **black**, edge (x, y) is a forward or cross edge.

![1547111642298](images\1547111642298.png)

