---
title: 2 - Scheduler
---

# 2 - Scheduler

*Keywords*: Metrics for scheduling (turnaround time, response time), simple process model, scheduling policies (FIFO, SJF, STCF, Round Robin, MLFQ, lottery scheduler).

## Litterature

OSTEP Chapters 6, 7, 8, 9

## Learning Goals

After lecture 2 you:

* :heavy_check_mark: Can explain the notion of **limited direct execution** and how it relates to scheduling
* :heavy_check_mark: Will know the **simplified process model**
* Will know and can explain important **metrics** for measuring a scheduling policy:
  * Fairness
  * :heavy_check_mark: Turnaround time
  * :heavy_check_mark: Response time
* Can explain important **scheduling policies** and their pros and cons:
  * :heavy_check_mark: FIFO (First In First Out)
  * :heavy_check_mark: SJF (Shortest Job First)
  * :heavy_check_mark: STCF (Shortest Time-to-Completion First)
  * :heavy_check_mark: Round Robin
  * MLFQ
  * Lottery scheduling

## Noter 

### Limited Direct Execution (LDE)

The direct execution part: Run the program directly on the CPU

![1559151779305](images/2-scheduler/1559151779305.png)

Direct execution is fast, running directly on the CPU. 

How do allow a process to perform restricted operations without giving complete control?

For at undgå malicious processer, findes 2 modes. **User**- og **kernel-mode**.

Restriktede operationer, kan kun laves i kernel mode. **System kald**, er kald som user-processer kan eksekvere, der kan eksekvere kode i kernel mode.

For at eksekvere system kald, eksekvere programmer en **trap** instruktion.

Når systemet er færdig, eksekveres en **return-from-trap** instruktion, der returnerer til det kaldende bruger-program.

#### Trap

Når et trap eksekveres, gemmes kalderens registrer, så den kan returnere igen. x86 pusher PC, flags og andre registre til en **kernel stack**. Som så bliver popped igen når return-from-trap eksekveres.

#### Trap Table

For at kernel ved hvad der må eksekveres under et trap, opsættes et **trap-table** under boot. 

Trap table fortæller hardware hvilket kode der skal eksekveres under hvilke events (**trap handlers**).

Et **system-call number** er assigned til hvert system kald. User programmet placerer dette nummer i et bestemt register, eller bestemt sted i stakken.

OS tjekker dette nummers validitet og kører det tilsvarende kode. Denne indirekthed fungerer som besykttelse.

!!! snippet "xv6"
	System call numbers i xv6 kan ses i ``syscall.h``. De gemmes i %eax. Og kaldes ved at eksekvere trap med ``T_SYSCALL``. 

#### Switching Process (Scheduling)

2 method: **cooperative approach** og **non-cooperative**. 

##### Cooperative Approach

Processer står selv for at overgive kontrollen til OS. Eksempelvis gennem system kald eller **yield** kald.
Overgiver også kontrollen ved fejl, ex divide-by-zero. Generer trap.

##### Non-Cooperative

**Timer-interrupts**: en timer kører i hardware og interrupter. Under interrupt, pauses den kørende process, og OS's **interrupt-handler** kører. 

Hvilket kode der skal køre (interrupt-handler) meddeles til hardware under boot. Timer startes under boot.



##### Context Switch

**Scheduler** bestemmer om der skal skiftes process. Hvis der skiftes process udføres **context switch**.

Registre **gemmes** fra kørende process (til **kernel stack**), og registre **genoprettes** fra soon-to-be-running process (fra **kernel stack**).

Når return-from-trap udføres, returneres til process B.



### Simplified Process Model

1. Each job runs for the same amount of time
2. All jobs arrive at the same time
3. Once started each job runs to completion
4. All jobs only use the CPU (no I/O)
5. The run-time of each job is known

Terminologi: $job==process\ |\ job == thread$



### Scheduling Metrics

**Turnaround time**: Tid fra arrival til færdiggørrelse
$$
T_{turnaround}=T_{complition}-T_{arrival}
$$
Dette er en **performance** metric.

**Response time:** Tid fra arrival til første schedule
$$
T_{response}=T_{firstrun}-T_{arrival}
$$


### First In, First Out (FIFO)

AKA **First Come, First Served (FCFS)**

* Nem at implementere

![1559199685412](images/2-scheduler/1559199685412.png)

Average turnaround time:

​	$\frac{10+20+30}{3}=20$

Men hvis vi relaxer assumtion 1:

![1559199510822](images/2-scheduler/1559199510822.png)

**Convoy effect**: Korte jobs bliver sat i kø bag store jobs.

Average turnaround time høj:

​	$\frac{100+110+120}{3}=110$

Dårlig response time

### Shortest Job First (SJF)

![1559199807956](images/2-scheduler/1559199807956.png)

Average turnaround time:

​	$\frac{10+20+120}{3}=50$

Givet vores assumptions om at alle jobs ankommer på samme tid, kan SJF bevises til at være **optimal** scheduling algoritme.

Men hvis vi relaxer assumption 2.

Hvis A ankommer før B og C vil den få høj turnaround time igen. 

​	($103.33$)

Skidt for response time

### Shortest Time-to-Completion First (STCF)

AKA Preemptive Shortest Job First (PSJF)

Vi relaxer assumption 3. 

![1559200319934](images/2-scheduler/1559200319934.png)

Giver os bedre average turnaround time: $50$

Givet vores nuværende assumptions er STCF beviseligt optimal.

Skidt for response time

### Round Robin (RR)

RR kører jobs for en **time slice** (også kaldt **scheduling quantum**)

Time slices skal være dividerbar med timer-interrupt perioden.

![1559200841721](images/2-scheduler/1559200841721.png)

Jo kortere time slice, jo bedre response time.

MEN: Hvis time slice bliver så kort, at kosten ved context switching dominerer overall performance.

**Armortization**: hvis noget har en fixed cost, så kald denne operation så få gange som muligt. 

Average turnaround time: 14, rimelig skidt.

* RR er en af de værste policies set fra Turnaround time

Generalt, policies, som RR, som er **fair** (deler cpu ligeligt bland aktive processer i lille tidsscala) performer dålrigt på metrics som turnaround time.

