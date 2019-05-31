---
title: 3 - Memory Management
---

# 1 - Memory Management

*Keywords*: Memory hierarchy, goals for memory management (transparency, efficiency, isolation), address space, challenges for memory management, features (relocation, protection, and sharing), virtual addresses vs. physical addresses, address translation, base and bound registers, simple allocation, static allocation (nonuniform), dynamic allocation, virtual memory, segmentation.

## Litterature

OSTEP Chapter 12, 13, (14), 15, 16, 17

Kapitler med parenteser skimmes: (x)

## Learning Goals

After Lecture 5 you:

* :heavy_check_mark: ... will know and can discuss the **three goals** of memory management:
  * :heavy_check_mark: Transparency 
  * :heavy_check_mark: Efficiency 
  * :heavy_check_mark: Protection (isolation)
* :heavy_check_mark: ... can explain what an **address space** is 
* :heavy_check_mark: ... define and explain the notion of **virtual memory** 
* :heavy_check_mark: ... perform simple **address translation** from virtual to physical 
* :heavy_check_mark: ... can explain the need for and use of **base/bound registers** 
* ... define and explain the use of **segmentation**



## Noter

### Adress Space

![1559288966769](images/3-memory-management/1559288966769.png)

**Addres space** er en abstraktion af den fysiske hukommelse. Så ser det ud fra hver process' synspunkt at de har det plads.

![1559289102517](images/3-memory-management/1559289102517.png)

Dette kaldes **virtualizing memory**.

Hvis eksempelvis process A vil læse fra adresse 0 (**virtual address**), så vil OS i samarbejde med hardware oversætte til den fysiske (virkelige) adresse.

### Mål med Memory Management

**Transparency**:

OS skal implementere virtuel memory så det er usynligt for det kørende program. (Programmet skal ikke vide at det er virtuel hukommelse)

**Efficiency:**

Virtualizeringen skal være så effektiv som muligt.

* Tid og plads

Udnytter hardware support som TLB'er

**Protection:**

Beskyt processer fra hinanden, og OS fra processer.

* De skal ikke kunne skrive og læse uden for deres egen adress space.
* **Isolation** processer er isoleret fra hinanden



### Adress Translation

AKA **hardware-based address translation**

Hardware oversætter hver memory adresse, **virtuel** $\rightarrow$ **physical**.

OS **manages memory**.

#### Antagelser

* Sammenhængende allokation (Contiguous allocation)
* Lille address space (mindre end fysisk hukommelse)
* Fixed størrelse address space

#### Eksempel

![1559307451538](images/3-memory-management/1559307451538.png)



#### Base and Bounds

AKA **dynamic relocation**

2 Hardware registre: **base**- og **bounds**- (også kaldt **limit**) register.

* Lader os placere adress space hvor vi vil i fysisk.

Memory referancer oversættes nu med:
$$
Address_{physical}=Address_{virtual}+base\\
\textbf{address translation}
$$
Teknikken kaldes ofte **dynamic relocation**.

**Bounds** bruges til **protection**. Undgå at process læser uden for address space.

Delen af CPU der hjælper med adress translation kaldes **memory management unit (MMU)**.

**Eksempler:**

![1559307937409](images/3-memory-management/1559307937409.png)

**Hardware Requirements**

![1559308302962](images/3-memory-management/1559308302962.png)

##### OS Problemer

* OS har en **free list**, en liste over ledigt hukommelse.

* Under **context-switch** skal base og bounds registre gemmes og læses.

![1559308440725](images/3-memory-management/1559308440725.png)



### Segmentation

Base og bounds par pr **segment** address space.

Et segment er et sammenhængende portion address space.

Logisk: code, stack og heap.

Segmentation lader os placere dem forskellige steder i fysisk.

![1559312466549](images/3-memory-management/1559312466549.png)

