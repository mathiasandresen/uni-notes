---
title: Graphs
---



## Adjacency matrix

- Represents the original graph, when related to a graph created by the Floyd-Warshll algorithm
    - Is also equivalent to the $D^0$ graph



## Predecessor matrix

- Describes the previous visited node to get the specified cost in the distance matrix.
- When used together with a distance matrix, it describes the cheapest path from $i$ to $j$. The distance matrix provides the cheapest cost and the predecessor provides how to get the cheapest cost.
- Each entry $P[i][j]$ represents the last node visited before j when taking the cheapest path from $i$ to $j$
- $k$ describes what number of row the algorithm has processed





## Distance matrix based on Floyd-Warshall algorithm

[**Based on the 2015 exam set**](../extra/exam-sets/2015-aalg-exam.pdf)



- The overall idea is to create a matrix that describes what the shortest distance between each vertex is

1. Create a matrix of size $n*n$, where $n$ is the number of vertices
2. Fill out the matrix with the weights between each set of vertices
    * Read numbers along the x-axis as "from x" and numbers from the y-axis as "to y"
        * From $x$ to $y$
    * A row of $0$'s will always run down across, since the distance from a vertex to ifself is always $0$
    * If it is not possible to go from one vertex to another, write the distance as $\infin$
    * If the exercise only asks for a single row, i.e the 4th, only fill out the numbers for that row

3. Update each distance between all vertices by using $1 + k$ number of edges, if the new distance is shorter

    * You can <u>only</u> use vertices $\leq k$
        * If $k=2$ we only check shortcuts that go through $1$ or $2$

    * Step 2 uses only a single edge, that is $k = 0$
    * If the exercise only asks for a single row, only update numbers for that row
    * Check each field in the matrix and look at the graph to see if there is a faster way than the last path
    * Repeat this step as many times as required by the exercise, specified through $k$


