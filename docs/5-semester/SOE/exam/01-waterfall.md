---
title: "1. Software process models: waterfall"
---

# Software process models: Waterfall

## Waterfall

Aktiviteter foregår i **sekvens**, overlevering af work products mellem faser, **milestones** og relateret **work** **products** bruges til at overvåge **progress**

![image-20200121104009627](../images/01-introduction/image-20200121104009627.png)

### Plan Drevet

Plan drevet, da process aktiviteterne er planlagt før start.

1.  **Requirements analysis and definition** 
    * **Services**, **constraints**, og **mål** etableres ved **konsultation** med system brugere.
    * Beskrives i **detajler** som **system specifikation**
2.  **System and software design** 
    * Allokerer **requirements** til **hardware** eller **software** systems.
        Etablerer en overall system **arkitektur**
    * **Identificering** og **beskrivesle** af fundamental software system **abstraktion og relationships**
3.  **Implementation and unit testing** 
    * Software design **udarbejdes** og **unit testing** verificerer at hver **unit** overholder dets specifikation
4.  **Integration and system testing** 
    * Program **units** eller programmer **integrerets** og testes som **helhed**.
    * **Udleveres** til kunden efter testing
5.  **Operation and maintenance** 
    * System installeres og tages i **brug**.
    * **Vedligeholdelse**
    * **Opdatering**



### Hvornår waterfall?

* **Embedded systems**
    * Infleksibilt hardware
* **Life critical systems**
    * **Specs** og **design** documents skal være **komplet**.
    * Ekstensiv **sikkerhedsanalyse**
* **Store software systemer**
    * Del af **bredere** ingeniør systemer
    * **Hardwaren** kan være udviklet med **lignende** model.
        * **Fælles** model for hardware og software