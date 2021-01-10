# Exam

**Question 1: Distributed Mutual Exclusion** :heavy_check_mark:

* What is DME and what are the requirements to a DME algorithm?
* What are the criteria to evaluate DME algorithms?
* Explain the centralized, token ring, and Ricart and Agrawala’s algorithms, and compare them. What are their advantages/disadvantages?



**Question 2: Multicast** :x:

* Why do you need multicast?
* Explain basic multicast assuming reliable 1:1 communication
* What are the requirements to reliable multicast and how do you implement it over basic multicast and IP-multicast?
* Explain the difference between FIFO, Total and Causal ordering? When is it important?
* Briefly explain the two ideas to implement TO-multicast. What can you say about reliability?



**Question 3: Replication and Consistency**​ :grey_exclamation:

* Why do you need replication?
* Explain the challenges resulting from replication
* What consistency models exist?
* Explain the consistency model and compare them
* Present an execution which is sequentially consistent but not linearizable



**Question 4: Consensus** :heavy_check_mark:

* Explain the consensus problem
* Solution in synchronous system

* Explain what the Byzantine generals problem is.
* Present impossibility result for 3 Byzantine generals, 1 faulty (argue carefully!)
* Present the solution for 4 Byzantine generals, 1 faulty.
* Present clearly your assumptions on system model, failures, and message signing. 
* Discuss impossibility in asynchronous systems and practical workarounds



**Question 5: Clustered Storage (GFS, Chubby, BigTable)** (:heavy_check_mark:)

* What are the design principles behind the Google Infrastructure?
* Go into depth with GFS: Explain the architecture, consistency model, replication, fault tolerance. What are its advantages and disadvantages?
* Chubby: goals, architecture.
* BigTable: goals and architecture, as difference from GFS and Chubby



**Question 6: Big Data Processing (MapReduce/Hadoop, Spark, Pregel)** ​(:heavy_check_mark:)​

* Explain the Map Reduce paradigm and programming model
* Explain the system architecture
* Explain a concrete example application and how it is executed
* Explain how to optimize the performance and how worker failures can be handled
* Describe Spark and Pregel, as difference from Hadoop



**Question 7: Internet of Things Routing (Directed Diffusion, Tree Routing in ZigBee, AODV, DSR)**  :heavy_check_mark:

* Explain the characteristics and limitation of IoT
* Describe goals of IoT platforms
* Describe Directed Diffusion
* Explain the basics of 802.15.4 (ZigBee's lower layers)
* Describe Tree Routing in ZigBee
* Describe AODV and DSR as difference from the other routing approaches



**Question 8: Peer to Peer (Gnutella, Chord)** :x:

* Explain the characteristics of peer-to-peer networks
* Describe the initial architecture of Gnutella
* Describe the novel architecture of Gnutella (with super-peers)
* Describe Chord routing approach
* Discuss Pastry/Tapestry, as differences from Chord



**Question 9: Blockchain (Tamper-free linked lists, Nakamoto Consensus, proof of work, transactions in Merkle trees)** :x:

* Explain the characteristics of the blocks in a blockchain (e.g.: immutability, linear growth)
* Explain how the crypto tools used in blockchain work (hash function, signature, merkle tree, hash pointer) and how they are used in the blockchain
* Explain why Paxos consensus is not enough for a blockchain, e.g.: to protect against the double spending conundrum
* Bitcoin: explain the structure of the transaction and how they are verified by the miner