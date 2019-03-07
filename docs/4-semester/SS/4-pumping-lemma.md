---
title: Pumping Lemma
course: SS
session: 4
date: 08-03-2019
---

# Pumping Lemma

DFA'er kan ikke tælle!

Hvordan beviser man at et sprog L ikke er regulært?

En mulig strategi: **Pumping Lemma**



## Primtal

Hvordan viser jeg at et naturligt tal **ikke** er et primtal?

**Sætning**:

Hvis *p* er et primtal og $p>2$ så er *p* et ulige tal.
$$
2174354654664
$$
Dette ender på 4, er dermed et lige tal, og er derfor ikke et primtal.



## Pumping Lemma for regulære sprog

Hvis *L* er et regulært sprog, så findes der et tal $p>0$ således at enhver $s\in L$ hvor $|s| \geq p$ kan splittes op som $s=xyz$ der opfylder:

1. $xy^iz \in L \space\text{for alle}\space i \geq0$
2. $|y|>0$           (y er ikke tom)
3. $|xy|\leq p$         (x og y findes blandt de *p* første tegn)



### Eksempel 1

[https://www.youtube.com/watch?v=FJq3NkqyYac&list=PLA8H0-CuqhGFb1yAl_z3XNCZXPrI21dal&index=4](https://www.youtube.com/watch?v=FJq3NkqyYac&list=PLA8H0-CuqhGFb1yAl_z3XNCZXPrI21dal&index=4)

!!! warning "Udvid"
    udvid noterne med eksemplet fra videoen.

### Eksempel 2

[https://www.youtube.com/watch?v=i8JPnM3rFrM&index=5&list=PLA8H0-CuqhGFb1yAl_z3XNCZXPrI21dal](https://www.youtube.com/watch?v=i8JPnM3rFrM&index=5&list=PLA8H0-CuqhGFb1yAl_z3XNCZXPrI21dal)

!!! warning "Udvid"
    udvid noterne med eksemplet fra videoen.

