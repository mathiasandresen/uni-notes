# Question 3: Replication and Consistency

* Why do you need replication?
* Explain the challenges resulting from replication
* What consistency models exist?
* Explain the consistency model and compare them
* Present an execution which is sequentially consistent but not linearizable



## Why do you need replication?

The goals of replication is **Fault tolerance**, **high availability ** and **performance**

We want to tolerate node and network failures

We want the service to be available as much as possible

We want to be able to scale the service, as well as overcome geographic- and network limits



![](images/3-consensus/image-20201015123638146.png)





## Explain the challenges resulting from replication

In a distributed system, it is **impossible** to simultaneously provide **Consistency**, **Availability** and **Partition tolerance**

We can only satisfy **any two** of them at the same time but **not all three**

This is called the **CAP Theorem**

![image-20201015124750628](../images/06-replication/image-20201015124750628.png)

We also want to make it **transparent for the user**

* They should not worry about which server to contact

**Ideally** we would have it **indistinguishable** from **single copy** behavior



## What consistency models exist?



## Explain the consistency model and compare them



## Present an execution which is sequentially consistent but not linearizable

