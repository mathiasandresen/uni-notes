---
title: 6 - Concurrency Problems
---

# 6 - Concurrency Problems

*Keywords*: Definition of deadlock, mutual exclusion, resource allocation graph, Coffman’s conditions, solution strategies (prevention, avoidance, detection and recovery), how to achieve deadlock prevention (breaking Coffman’s conditions), safe states and deadlock avoidance, deadlock detection and recovery, livelock, priority inversion.

## Litterature

OSTEP Chapter 25, 26, (27), 28, (29), (30), 31, 32, (33), 34

Kapitler med parenteser skimmes: (x)

## Learning Goals

After today’s lecture, you:

* ... can define and explain the concept of **deadlock**
* ... can define and explain **Coffman’s conditions** for deadlock
* ... can explain and use **deadlock prevention strategies**:
    * **prevention**
    * **avoidance**
    * **detect-and-recover**
* ... can define and explain the following concepts
    * **livelock**
    * **priority inversion**
* ... can use the **Dining Philosophers** example to explain concurrency
    issues

## Noter

Concurrency bugs in modern applications

![1559563806683](images/6-concurrency-problems/1559563806683.png)



### Non-Deadlock Bugs

97 % af non-deadlock bugs er en af følgende:

* **Atomicity Violation**
* **Order Violation**

#### Atomicity Violation

Eksempel fra MySQL:

```c
Thread 1::
if (thd->proc_info) {
	fputs(thd->proc_info, ... );
}

Thread 2::
thd->proc_info = NULL
```

Koden i thread 1, har en *atomicity assumption*, den tror at kode line 2-3 sker i et hug.
Men hvis den laver null-check først, og så tråd 2 sætter den til null før linje 3 køres, så er der fejl

**Løsning:** Locks rundt om lines 2-4 + line 7



#### Order-Violation

```c
float T;
```

![1559564496283](images/6-concurrency-problems/1559564496283.png)

Koden i thread 2, tror at `T` er initialiseret.

**Løsning**:

Kan løses med en semaphore

![1559564533044](images/6-concurrency-problems/1559564533044.png)



### Deadlock

Se [The Dining Philosphers Eksempel](#the-dining-philosophers)





### The Dining Philosophers

* 5 filosoffer
* Mellem hver er en enkelt gaffel.
* En filosof kan enten tænke eller spise
    * Tænke: ingen gaffel
    * Spise: Kræver 2 gafler

![1559480046648](images/6-concurrency-problems/1559480046648.png)

Her er basic loop for hver philospher, hvor hver filosof har en thread idientifier `p` fra 0 til 4

```
while (1) { 
    think();
    get_forks(p); 
    eat(); 
    put_forks(p);
}
```

Udfordringen er at skrive routinerne `get_forks()` og `put_forks()` sådan at:

* Der er ingen deadlock
* Ingen filosof starves
* Høj concurrency (så mange filosoffer som muligt spiser på samme tid)

Vi bruger følgende helper funktioner:

```c
int left(int p) 	{ return p; }
int right(int p)	{ return (p + 1) % 5; }
```

Når en filisof vil have gaflen til venstre kaldes `left(p)` og samme for højre `right(p)`.

Vi har også nogle semaphores, lad os sige vi har 5, en for hver fork: `sem_t forks[5]`

#### Umiddelbare Løsning (FORKERT)

```c
void get_forks(int p) {
	sem_wait(&forks[left(p)]);
	sem_wait(&forks[right(p)]);
}

void put_forks(int p) {
	sem_post(&forks[left(p)]); 
	sem_post(&forks[right(p)]);
}
```

==DETTE ER FORKERT==

Det fører til **deadlock**.

Hvis hver filosof tager deres gaffel til venstre før nogen når at tage deres gaffel til højre, vil de alle sammen være stuck ventende på at deres højre gaffel bliver ledig.



#### Løsning: Breaking The Dependency

Vi ændre på hvordan gafler bliver taget hos mindst en af filosofferne.

```c
void get_forks(int p) { 
	if (p == 4) {
		sem_wait(&forks[right(p)]); 
		sem_wait(&forks[left(p)]);
	} else {
		sem_wait(&forks[left(p)]); 
		sem_wait(&forks[right(p)]);
    } 
}
```



