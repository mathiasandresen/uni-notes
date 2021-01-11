# Question 2 - Multicast

* Why do you need multicast?
* Explain basic multicast assuming reliable 1:1 communication
* What are the requirements to reliable multicast and how do you implement it over basic multicast and IP-multicast?
* Explain the difference between FIFO, Total and Causal ordering? When is it important?
* Briefly explain the two ideas to implement TO-multicast. What can you say about reliability?



## Why do you need multicast?

* Multicast is **one-to-many** communication
* Want to guarantee that all processes get same information
* With hardware support
    * send only one message to router
    * router then takes care of sending messages to members







## Explain basic multicast assuming reliable 1:1 communication

* Each process is member of a group
* when message from application
    * send message to every member of group -- including self
* when receiving message
    * send message to application







## What are the requirements to reliable multicast and how do you implement it over basic multicast and IP-multicast?

### Reliable Multicast

To have **reliable multicast** we must satisfy **3 properties**

* **Integrity**
    * a correct **process** delivers message **at most once.**
    * no "identity theft"
* **Validity**
    * If correct **process** **multicasts** a message, it **eventually** **delivers** it
    * "a process delivers to itself or crashes"
* **Agreement**
    * If **correct** process **delivers**, **all** correct **processes** in group **deliver**
    * "all deliver or none deliver"



### Reliable over Basic

* First we b-multicast to group
* When we receive message
    * If we have not already delivered message
        * if message is not from self -- b-multicast message
        * and deliver message



**Integrity** -- yes

* message is only delivered once

**Validity** -- yes

* message is delivered to self

**Agreement** -- yes

* message is sent to all devices 
* if process crashes after sending one -- message is sent from receiving process



### Reliable over IP



:warning: TODO



To implement Reliable Multicast over IP-Multicast we steal some ideas from TCP

* Sequence number
    * detect duplicates and lost messages
* hold-back-queue
    * wait for re-transmission
    * replicate messages
* track others sequence numbers
* gossip sequence numbers

#### Implementation

* IP multicast message to group
* when message received
    * add to hold-back queue
    * try_deliver it
    * try_deliver: check if sequence number is one more than stored sequence number from sender
        * deliver message
        * update sequence number for sender
            * check if we have next message in hold-back queue and try_deliver 
    * send negative ack for all sequence numbers below
        * 





## Explain the difference between FIFO, Total and Causal ordering? When is it important?

### FIFO Ordering

Messages from $p_n$ are received at $p_k$ in the order sent by $p_n$

* like speaking
* <u>Reliable IP-Multicast is FIFO</u>

### Total Ordering

All messages are received in same order at $p_n$ and $p_k$

### Casual Ordering

if $p_n$ receives $m_1$ before $m_2$, then $m1$ **happened before** $m_2$



### Why

Lets say we have a bank

* if messages are not received ordered -- it can lead to wrong state

![image-20201001132310064](../images/04-multicast/image-20201001132310064.png)

* if we use **FIFO** order problem is inherently fixed

![image-20201001132350368](../images/04-multicast/image-20201001132350368.png)

* If we introduce another sending process -- we have problem again

![image-20201001132425590](../images/04-multicast/image-20201001132425590.png)

* If we use **total order** problem fixed again

![image-20201001132514231](../images/04-multicast/image-20201001132514231.png)



* Can however still go wrong

![image-20201001132636501](../images/04-multicast/image-20201001132636501.png)



## Briefly explain the two ideas to implement TO-multicast. What can you say about reliability?