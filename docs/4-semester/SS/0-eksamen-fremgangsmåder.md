---
title: Eksamen - Fremgangsmåder
---

# Eksamen Fremgangsmåde



## Konvertering af NFA til DFA

* Husk at $\varepsilon$ transitioner er "gratis"
    * De må dog ikke tages "alene", de skal læses sammen med et andet symbol. Dette symbol kan godt gå til samme tilstand, og så kan  $\varepsilon$ gå videre.



## Pushdown Automater

* Brug epsilon-transitioner til at komme videre ($\varepsilon, \varepsilon \to \varepsilon$)

### Eksempel

$$
L_1=\{a^ib^jc^k\mid i,j,k \geq 0;\ k=i+j\}
$$

![1560248934304](images/0-eksamen-fremgangsmåder/1560248934304.png)



## Pumping Lemma for Regulære Sprog

* Antag at $L$ er et regulært sprog, så ville [Pumping Lemma](../SS/04-pumping-lemma.md#pumping-lemma-for-regulære-sprog) være overholdt. (Se formelsamling s. 5)

* Vælg en streng $s\in L$ der er defineret ud fra $p$ og kan "pumpes op" så $s\notin L$
* Skriv:

"
Jeg vælger $s=$ "valgte streng" og viser at ingen opsplitninger af $s$ vil kunne overholde alle tre betingelser i pumping lemma for regulære sprog samtidigt. 

Hvis (3) skal gælde så, må $xy$ bestå af "..." og dermed $y=x^k$ for $k\geq 0$.

Hvis (2) også skal gælde må $y$ ikke være den tomme streng.

Men så overtrædes (1), for vi har at $xy^iz \notin L$ hvis $i=$ "...", da "...".
"

## Semantik

* Husk at numeraler skal gøres til tal ved $\mathcal{N}[\![n]\!]$
    * Eksempel: $\langle \text{cutoff}(x, n), s \rangle → s[x \mapsto v] \quad \text{hvor } v = \mathcal{N}[\![n]\!] \quad \text{hvis } s(x) > \mathcal{N}[\![n]\!]$
* Slå op i tilstand s med $s(x)$
* Husk at stregen over ikke altid bruges



### Se Fejl

* Tjek at start og sluttilstande er korrekte
* Tjek efter $s \vdash$



### Small-Step Semantik

* Brug de predefinerede kommandoer (s. 7 i formelsamling)



### Variabelbindinger

Hvis du slår op i $Env_p$ og får variabelenvironment med, er der tale om statisk variabelbinding.

Det samme gælder for procedurebindinger.

> Hvis du slår op, får du en gammel krop - Mads-Bo, 2019