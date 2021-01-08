# Consensus

What is consensus?

* The ability for a **group of processes** to **agree on one, and only one** value



**Examples**

* **We have already seen**

    * Mutex
    * Leader election
    * Multicast (ordering)
    * Bank-accounts

* **Practical Applications**
    * Redundancy
        * Space and aeronautics
        * Industrial systems
    * Replication
        * Distributed file systems
        * Ledger technology (e.g. blockchain)

    

**Big questions**

* When do we agree on what we agree on?
* What do we agree on?



**Why**

* Generalized consensus
* If we have consensus, everything is easy
* Feasibility depends on system model



## Impossibility

### Multicast

**No Failures, Easy**

1. B-multicast to everyone
2. Wait till N messages are received
3. Decide (e.g. minimum, majority, ...)

**Failures?**

Wee need:

* Mechanism for failure detection
    * Difficult/impossible for async systems
        * Impossible to detect if dead or slow
* Mechanism for failure handling



### The Two Army Problem

![image-20201008123907849](images/05-consensus/image-20201008123907849.png)

Both read armies has to attack at the same time

* They can send a message, but the blue army can intercept

Can we design a protocol to make sure that both armies attack at 6.

If left army sends a message to right, they would not know if the message has been received.



### Impossibility of Consensus in Async Systems

**Informally**

* Communication can be "blocked" indefinitely
    * (which is not forever)

**Reliable TO (Totally Ordered) Multicast is also impossible in async systems**

* Same problem

**Quiz**

* Assume we have a magic, reliable TO Multicast, can we derive a consensus algorithm?
    * Everyone takes the first message delivered.
        * Since its totally ordered everyone gets messages in the same order



## System Model

* Synchronous Systems
* Reliable Communication
* Fault models
    * Crashes
    * Byzantine
        * Arbitrary
        * Evil
* No signed messages!
    * There can be "Identity theft"



### Requirements

Given $p_i \in \{p_0,\dots,p_n\}$ and a corresponding decision-variable $d_i\in D \cup \{⊥\}$

* $⊥ \not \in D$

* **Termination**
    * Eventually a correct process sets its decision variable $d_i$
* **Agreement**
    * The decision values of all correct processes are the same
* **Integrity**
    * If all correct processes propose the same value, then any correct process in the decided state decide on that value
* **Weak Integrity**
    * The agreed value must be one proposed by a correct process



**Decided State**

We say that $p_i$ is decided if $d_i \not = ⊥$



* Some systems work in rounds,
* Most things are not truly async
    * "Indefinitely" rarely happens



**Goal**

* f-crash-resilient synchronous consensus algorithm

**f-resilient**

* The algorithm is f-resilient if f processes may fail



### Algorithm

![image-20201008125454467](images/05-consensus/image-20201008125454467.png)



**Theorem**

*Any optimal f-resilient consensus-algorithm requires f+1 rounds*

* Proof by pigeon hole principle
    * At least one correct round
    * Remember R-multicast

* Unclear when correct round is

* Weak consensus
    * We can agree on a value that was not proposed on a correct process
        * Not weak integrity

![image-20201008130059950](images/05-consensus/image-20201008130059950.png)



## Byzantine Error

What is processes do not crash-fail but interact unpredictably?

The term *arbitrary* or **Byzantine failure** is used to describe the worst possible failure semantics, in which any type of error may occur. For example, a process may set wrong values in its data items, or it may return a wrong value in response to an invocation.

Byzantine failures in processes cannot be detected by seeing whether the process responds to invocations, because it might arbitrarily omit to reply.

### Examples

* Single Event Upset: A flipped bit
* Single Event Latchup: Hardware error

![image-20201008130826662](images/05-consensus/image-20201008130826662.png)

They use 4 different computes running the same software on the space shuttle, and then voting on consensus.

![image-20201008130853622](images/05-consensus/image-20201008130853622.png)



**Not only a space issue**

* "Error-Correcting code memory" (ECC)
* Bitflips on planes
* Nuclear power plants
* ...



Systems can "fall asleep" and later continue from where they left off

![image-20201008131153510](images/05-consensus/image-20201008131153510.png)



### Byzantine Consensus

**Requirements**

* ...
* **Byzantine integrity**
    * If all non-faulty processes start with the same value, then all non-faulty processes decide on that value



**Goal**

* f-byzantine-resilient synchronous consensus algorithm

**Bad news**

* Impossible for $f \geq {n \over 3}$

**Good news**

* Possible otherwise



### The Byzantine Generals Problem



![image-20201008131421164](images/05-consensus/image-20201008131421164.png)

* If B is evil and gives different orders to A and C
* If C is evil and lies about order from B
* A cannot detect the traitor

$\uparrow \downarrow$ Proof that if 1/3 is faulty you cannot arrive at consensus

![image-20201008131654680](images/05-consensus/image-20201008131654680.png)



### Byzantine Consensus Algorithm

$f = 1$

![image-20201008131806701](images/05-consensus/image-20201008131806701.png)

* Works only for $f=1$
    * Can be generalized
    * $O(n^{f+1})$ messages
        * $O(n^2)$ messages, growing exponentially in size
* Integrity is violated!



### Kings Algorithm

![image-20201008133350257](images/05-consensus/image-20201008133350257.png)

We introduces a "leader"/tiebreaker



* Works only for any $n > 3 \times f$
* Small messages, $O(n^2)$
* $(f+1) \times 3$ rounds
* Integrity is respected



### Notes on Byzantine Algorithms

* General case:
    * Requires $f+1$ rounds
    * Sends $O(n^{f+1})$ messages
    * Number of rounds can be exchanged for messages
        * Queen algorithm $(f+1) \times 2$ rounds $+ f < {n \over 4}$-robust
        * King algorithm $(f+1) \times 3$ rounds
* Using digital signiture
    * Still $f+1$ rounds
    * $O(n^2)$ messages

**Note**

* Costly in general form
* Often specialized solutions are cheaper



### Fixing the Async Problem



#### Random Solution

If we allow randomness in our algorithm we can have a solution to Byzantine Generals Problem in async setting



## Paxos

A family of algorithms by L. Lamport

* No coordinator
* Async system
* Nodes may crash and recover
    * OK with up to $n/2$ failures
* Once a single process decides, all will (eventually) decide the same

**Inconceivable**!

* No guaranteed termination
* ... but terminates in "reasonable environments"



[The Paxos Algorithm](https://www.youtube.com/watch?v=d7nAGI_NZPk&feature=youtu.be)



### Reaching Consensus with Paxos

![image-20210108141904159](images/05-consensus/image-20210108141904159.png)

* Consensus is agreeing on **one** result
* Once a **majority** agrees on a proposal, that is the consensus
* The reached consensus can be **eventually** known by anyone
* The involved parties want to agree on **any** result, not on their proposal
* Communication channels may be **faulty**, that is, messages can get lost



### Basics

* Paxos defines three roles:
    * **Proposers**
    * **Acceptors**
    * **Learners**
* Paxos nodes can take multiple roles, even all of them
* Paxos nodes must know how many **acceptors** a majority is
    * Two majorities will always overlap in at least one node
* Paxos nodes must be persistent: they cant forget what they accepts
* A **Paxos run** aims at reaching **a single consensus**
    * Once consensus is reached, it **cannot progress** to another consensus
    * In order to reach **another consensus**, a different **Paxos run** must happen



### The Paxos Algorithm

![image-20210108143127909](images/05-consensus/image-20210108143127909.png)



### Majority of Promises

![image-20210108143245077](images/05-consensus/image-20210108143245077.png)



### Contention

![image-20210108143345457](images/05-consensus/image-20210108143345457.png)

### Majority of Accepts

![image-20210108143524237](images/05-consensus/image-20210108143524237.png)



### Practical Example - Simple Distributed Storage System

![image-20210108143813131](images/05-consensus/image-20210108143813131.png)