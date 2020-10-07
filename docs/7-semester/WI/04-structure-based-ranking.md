# Structure-based Ranking



## The Value of Links

A tiny web:

![image-20201005143222935](images/04-structure-based-ranking/image-20201005143222935.png)

Two pages with the same content. *Which one is more relevant?*

* Number 1, since it has more pages referencing it.



## Centrality and Prestige

[Basic Graph-theory](../../3-semester/AD1/10a-graph-theory.md)

### **Degree of a node**

![image-20201005144409352](images/04-structure-based-ranking/image-20201005144409352.png)



### **Degree Centrality**

For undirected graphs:

![image-20201005144450850](images/04-structure-based-ranking/image-20201005144450850.png)

In a graph with $n$ nodes:

* $C_D(v)= {d(v) \over n-1}$
* Example:
    * $C_D(a)=C_D(b)= {6\over 27}$
    * $C_D(c)= {3 \over 27}$

$C_D$ is a **local** measure: only depends on local neighborhood of nodes



### Closeness Centrality

![image-20201005144450850](images/04-structure-based-ranking/image-20201005144450850.png)

* $d(v,u)$: distance (= number of links on shortest connection) between $v$ and $u$
* $C_C(v)= {n-1 \over \sum_{u\in v} d(v,u)}$
* Example:
    * $C_C(a)= {26 \over 54}$
    * $C_C(b) = {26\over 80}$



$C_C$ is a **global** measure: depends on the whole network

Case of **disconnected networks needs special treatment**

Caution: when large networks have a small diameter (*small world phenomenon*), then $C_C$ values will be very similar for almost all nodes

* Social network problem, everyone is connected to everyone in a relatively small path



### Degree Prestige (In-degree Centrality)

For directed graphs

![image-20201005145312421](images/04-structure-based-ranking/image-20201005145312421.png)

* $P_D(v) = {d_i(v) \over n-1}$
* Example
    * $P_D(a) = P_D(b) = {5 \over 23}$
* $P_D$ is another **local** measure



Local measures can easily manipulated by link spamming:

![image-20201005145608918](images/04-structure-based-ranking/image-20201005145608918.png)

* More difficult (but still possible) to manipulate global measures



## Page Rank

First reported in:
*Brin, S., & Page, L. (1998). The anatomy of a large-scale hypertextual web search engine.*

* PageRank originally defined for ranking we pages
* Inspired by earlier works in link analysis (web and citation analysis)
* The ideas/principles of PageRank have been adpoted to measure node centrality/importance in many contexts



![image-20201005150524701](images/04-structure-based-ranking/image-20201005150524701.png)

* $a$ and $b$ have the same degree prestige
* The pages linking to $a$ have a higher prestige than the pages linking to $b$



### Rank Prestige

$$
P_R(v)= \sum_{u:u\to v} P_R(u)
$$

* This does not directly define $P_R$
* Only defines mutual relationships between $P_R$ values
* Can we find and compute a $P_R$ measure that satisfies these relationships?



Web surfer: [slides 13-](https://www.moodle.aau.dk/pluginfile.php/2131622/mod_resource/content/1/wi_20_04.pdf#page=16)

Example: 10.000 random web surfers:

![image-20201005151305201](images/04-structure-based-ranking/image-20201005151305201.png)

![image-20201005151324734](images/04-structure-based-ranking/image-20201005151324734.png)

PageRank idea: the rank (prestige) of a web-page is proportional to

* the proportion of random web-surfers that will be visiting the page at a given point in time
* = the probability that a random web-surfer is at this page at any point in time



### Markov Chain Model

The random surfer is described by

* a probability distribution

    * $\bold q^{(0)}=(q_1^{(0)}, \dots, q_n^{(0)})$

    over all web-pages. $q_i^{(0)}$ : probability of starting to surf on page $i$

* a transition probability matrix![image-20201005151648890](images/04-structure-based-ranking/image-20201005151648890.png)

    $P_{i,j}$ : probability of moving to page $j$ given we are currently on page $i$: $=0$ if there is no link from $i$ to $j$, otherwise 

$$
P_{i,j}= {1 \over d_O(i)}
$$

​	compactly:

$$
\bold P = D_O^{-1}A
$$

​	with $D_O$: diagonal out-degree matrix, $A$: adjacency matrix



#### Example

![image-20201005152047427](images/04-structure-based-ranking/image-20201005152047427.png)

For a random surfer starting at page 1:

![image-20201005152108070](images/04-structure-based-ranking/image-20201005152108070.png)

* $\bold q^{(t)} = (q_1^{(t)}, \dots, q_n^{(t)})$ probability distribution over web pages at time $t$

![image-20201005152229860](images/04-structure-based-ranking/image-20201005152229860.png)

Collected for all j, in matrix notation:

![image-20201005152241260](images/04-structure-based-ranking/image-20201005152241260.png)



![image-20201005152303928](images/04-structure-based-ranking/image-20201005152303928.png)

![image-20201005152321424](images/04-structure-based-ranking/image-20201005152321424.png)

![image-20201005152334371](images/04-structure-based-ranking/image-20201005152334371.png)



#### Stationary Distribution

* $\bold q$ is **stationary** if 
    * $\bold q = \bold q \bold P$
    * I.e.: $\bold q$ is eigenvector of $\bold P$ with eigenvalue 1

Under *some conditions*\* 

* a Markov chain has a unique stationary distribution $\bold q ^*$
* for any $\bold q^{(0)}$

![image-20201005152548115](images/04-structure-based-ranking/image-20201005152548115.png)



##### Example

![image-20201005152727161](images/04-structure-based-ranking/image-20201005152727161.png)

* We get the same vector back again



#### Irreducibility

\*First condition.

Not irreducible:

![image-20201005152925383](images/04-structure-based-ranking/image-20201005152925383.png)

* the limiting distribution depends on the initial distribution (starting point)

A Markov chain is **irreducible** if every state is reachable from every other state



#### Aperiodicity

\*Second condition

Not aperiodic:

![image-20201005153305121](images/04-structure-based-ranking/image-20201005153305121.png)

* A state $i$ in a Markov chain is **periodic** if starting from one $i$ one can only return to $i$ in 
    $$
    k,2k,3k,\dots,nk, (n+1)k,\dots
    $$
    many steps, where $k>1$

* Above: all states periodic with $k=3$

* A Markov chain is **aperiodic** if it has no periodic states



#### Summary

If a Markov chain is irreducible and aperiodic, then it

* has a unique stationary distribution $\bold q^*$
* for any $\bold q^{(0)}$:
    * $\lim_{t\to \infty} \bold q(t)=\bold q^*$



### Problems

A small web:

![image-20201005154334536](images/04-structure-based-ranking/image-20201005154334536.png)

Transition matrix:

![image-20201005154345052](images/04-structure-based-ranking/image-20201005154345052.png)

**Problem 1**

* No proper transition matrix, because **dangling pages** (ex: page 5) have no defined transitions

**Solution 1**

* Add transitions from dangling pages to all other pages:

![image-20201005154447591](images/04-structure-based-ranking/image-20201005154447591.png)

* "random restart" of the web searching if ending up at dangling edge

* Transition matrix

    ![image-20201005154518429](images/04-structure-based-ranking/image-20201005154518429.png)

**Problem 2**

* Markov chain not irreducible (and maybe not aperiodic)

**Solution 2**

* Add additional transitions from all states to all other states, so that total probability of these extra transitions is $1- d$

* New transition matrix:

    * $\bold P_{PR}=$

        ![image-20201005154712026](images/04-structure-based-ranking/image-20201005154712026.png)

        

### PageRank Defined

The page rank of webpage $i$ is 

$$
n \cdot q_i^*,
$$

where $\bold q^*$ is the limit distribution of the Markov chain defined by $\bold P_{PR}$

It is computed (approximately) by iterating

![image-20201005155024161](images/04-structure-based-ranking/image-20201005155024161.png)

until $\bold q^{(t)}$ does not change very much



### The Undirected Case

Let

![image-20201005155130637](images/04-structure-based-ranking/image-20201005155130637.png)

Then

![image-20201005155149969](images/04-structure-based-ranking/image-20201005155149969.png)

**Proof**

![image-20201005155236252](images/04-structure-based-ranking/image-20201005155236252.png)

![image-20201005155242665](images/04-structure-based-ranking/image-20201005155242665.png)



## HITS Algorithm

*J. Kleinberg: Authoritative Sources in a Hyperlinked Environment. J. of the ACM, 1999*

Alternative to PageRank

![image-20201005155618298](images/04-structure-based-ranking/image-20201005155618298.png)

2 different types of important nodes

* **Hubs** (red): Web pages pointing to many (relevant) pages
    * Example: Business listings (yellow pages)
* **Authorities** (blue): Web pages linked to by many other pages
    * Example: Important company homepages



### Algorithm

**Step 1**

Retrieve top $t$ of webpages for query (mostly content-based):

![image-20201005155806981](images/04-structure-based-ranking/image-20201005155806981.png)

* Result: the **root** set



**Step 2**

Add all neighbors (up to a maximum number) of the pages in the root set:

![image-20201005155836863](images/04-structure-based-ranking/image-20201005155836863.png)

* Result: the **base** set



**Step 3**

Compute the **hub** and **authority scores** for all pages $v$ in the base set, implicitly defined by:

![image-20201005155931164](images/04-structure-based-ranking/image-20201005155931164.png)

In matrix notation:

![image-20201005155943820](images/04-structure-based-ranking/image-20201005155943820.png)

where $\bold L$: link matrix.

Alternatively (separating $\bold a$ and $\bold h$):

![image-20201005160026871](images/04-structure-based-ranking/image-20201005160026871.png)

* Solutions  $\bold a$, $\bold h$ are found by the same iterative approximation as used for q ∗ computation ([slide 26](https://www.moodle.aau.dk/pluginfile.php/2131622/mod_resource/content/1/wi_20_04.pdf#page=64))

* Since $\bold L^T \bold L$ and $\bold {LL}^T$ are not irreducible, aperiodic Markov chains, solutions  $\bold a$, $\bold h$ need not be unique

