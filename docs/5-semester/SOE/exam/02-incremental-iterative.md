---
title: "2. Software process model: incremental and iterative"
---

# Software process models: Incremental and Iterative

## Software Engineering

Pga. ingen **fysiske constraints**, kan software systemer **hurtigt** blive ekstrem **komplekse**, **svære** at forstå, og **dyre** at ændre i.

Mange fejl i software projekter skyldes 2 faktorer

1. **Increasing System Complexity**
    * **Demands change,** systemr skal leveres **hurtigere**; **større**, endnu mere **komplekse**.
2. **Failure to use software engineering methods**
    * Det er **nemt** at skrive computer programmer **uden** at bruge **SE** metoder og teknikker.
    * Mange selskaber er blevet **software udviklere med tiden**
        * De bruger **ikke SE** metoder i deres hverdagsarbejde
        * Derfor bliver deres software ofte **dyrere** og **mindre reliable** end det burde.



### SE Process Activities

1. **Software specification** 

    * The functionality of the software and constraints on its operation must be defined.

2. **Software development** 

    * The software to meet the specification must be produced.

3. **Software validation** 

    * The software must be validated to ensure that it does what the customer wants.

4. **Software evolution** 

    * The software must evolve to meet changing customer needs.

        

## Incremental and Iterative

Her udvikles systemet i **iterationer**. Som en serie af "**versioner**"

* Hver version tilføjer funktionalitet til tidligere version
* **Specifikation**, **Udvikling/development**, og **Validation** sker i hver **iteration**.

Planen deles op i flere bidder

![image-20200121104029784](images/02-incremental-iterative/image-20200121104029784.png)

Der laves en **initial** implementering, hvorfra man får **feedback** fra brugerer, herefter udvikles softwaren i flere **iterationer** indtil **færdigt**.

* Det er **godt** hvis der er høj sandsynlighed for at **requirements ændres** undervejs
* Det er **billigere** og **nemmere** at lave **ændringer** **undervejs** end waterfall



**Mest** software bliver udviklet med **incremental** and iterative model.

**Waterfall** fungerer **bedst** til **safety-critical** software.

* Massere af **analyse** og **dokumentation** før implementering



### Plandrevet eller Agilt?

Kan være både plandrevet og agilt.

Eksempelvis er det **plandrevet** hvis en **waterfall** model **deles** op i **planlagte** iterationer fra start.

Ved **agilt** ville man **kun** planlægge **ét** inkrement af gangen



### Fordele og Ulemper

**Fordele**

* Billigere at implementere ændringer undervejs
* Nemmere at få feedback på det der er lavet
* Kan leveres hurtigere til kunden selvom det ikke er færdigt endnu

**Ulemper**

* Usynlig process.
    * Managers skal have regulær delivery af produktet for at måle progress
* Struktur foringes med antallet af inkrements
    * Rodet kode