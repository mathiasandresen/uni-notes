# Question 6 - Big Data Processing

* Explain the Map Reduce paradigm and programming model
* Explain the system architecture
* Explain a concrete example application and how it is executed
* Explain how to optimize the performance and how worker failures can be handled
* Describe Spark and Pregel, as difference from Hadoop



## Explain the Map Reduce paradigm and programming model

Map Reduce consists of 2 phases -- functions defined by user

* Map
    * given key-value pairs, produce intermediate key-value pairs
    * Combine values of the same key and send it to reducer
* Reduce
    * further compress the value set of the same key

Created for processing of large data sets.

Inspired by functional programming



## Explain the system architecture

The system consists of 1 master and several mappers and reducers.

![image-20210109162955727](../images/11-big-data-analytics/image-20210109162955727.png)

The master

* assigns map and reduce jobs to other workers
* stores the state of each job
* stores the location of output files of the jobs





![image-20210109163033255](../images/11-big-data-analytics/image-20210109163033255.png)

* First we split the input into pieces
* Master assigns mappers and reducers
* Reducers get path of map output from master 





## Explain a concrete example application and how it is executed

### Google Music Example

![image-20210109192651311](images/6-big-data-processing/image-20210109192651311.png)

* Chunkservers contains analytics for music played
* We want to find the most played songs



The master tells each chunkserver to count how many times each song has been played (map-phase)

![image-20210109192724391](images/6-big-data-processing/image-20210109192724391.png)



![image-20210109192828632](images/6-big-data-processing/image-20210109192828632.png)



![image-20210109192915197](images/6-big-data-processing/image-20210109192915197.png)

![image-20210109192939463](images/6-big-data-processing/image-20210109192939463.png)



## Explain how to optimize the performance and how worker failures can be handled

### Performance

![image-20210109163350567](../images/11-big-data-analytics/image-20210109163350567.png)

* **Locality**
    * Worker should be close to the GFS replica storing the data

* **Stragglers**
    * slow workers -- nearly always **some** worker is slow
    * when program near finished
        * in progress tasks are rescheduled at backup worker
        * done when either backup or original is done
* **Barrier synchronization / pipelining**
    * whether we can start reducing while mapping



### Fault Tolerance

* The master sends pings to workers
* If one is idle
    * if its running **map** task, task is marked **idle** and rescheduled
    * if its running **reduce** task two things can happen
        * if task task is in progress, its rescheduled
        * if task is done -- output written to global storage -- done





## Describe Spark and Pregel, as difference from Hadoop

### Spark

**Map Reduce** is **inefficient** for applications which **reuse intermediate** results across multiple computations

Spark uses **resilient distributed datasets** (**RDDs**)

* Immutable, partitioned collections of records (normally in RAM)
* fault-tolerant, parallel data structures,
* efficient data reuse

let users

* explicitly persist intermediate results in memory



RDD does not have to be materialized all the time: 

* store the „lineage“, information about how it was derived from other datasets (operations on RDDs).
    * re-computable

![image-20201119135326225](../images/11-big-data-analytics/image-20201119135326225.png)

![image-20210109205635597](images/6-big-data-processing/image-20210109205635597.png)



### Pregel

Pregel is  **tailored to graph computations**

* scale to billions of vertices, trillions of edges

Keeps **intermediate** results **like** **spark**



Algorithm termination is based on every vertex voting to halt

* In super-step 0, every vertex is in the active state
* A vertex deactivates itself by voting to halt
* A message may re-activate a vertex

![image-20201119135530229](../images/11-big-data-analytics/image-20201119135530229.png)



**Master - worker** architecture

* Master monitors workers and partitions vertices to workers
* Workers execute at each super-step
    * report number of active vertices to master at end of step

Uses GFS or BigTable for persistent data



#### Example

![image-20201119135557068](../images/11-big-data-analytics/image-20201119135557068.png)