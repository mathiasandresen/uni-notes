---
title: Context Free Grammars
course: SPO
session: 5
date: 19-02-2019
---

# Context Free Grammar (CFG)

* A finite set of **terminal symbols**
* A finite set of **non-terminal symbols**
* A **start symbol**
* A finite set of **production rules**



## How to Design a Grammar

Lets write a CFG for C-style function prototypes.

**Examples**

- `void myf1(int x, double y);`
- `int myf2();`
- `int myf3(double z);`
- `double myf4(int, int w, int);`
- `void myf5(void);`



### One Possible Grammar

![1550585433199](images/1550585433199.png)

#### Examples

![1550585453498](images/1550585453498.png)

### Another Possible Grammar

![1550585471968](images/1550585471968.png)

#### Examples

![1550585482278](images/1550585482278.png)

## Definition

**Components: ** $G=(N,\Sigma,P,S)$

![1550585537334](images/1550585537334.png)

**Vocabulary** $V=N\cup \Sigma​$

* $N \cap \Sigma = \phi​$



![1550585682702](images/1550585682702.png)

![1550585689723](images/1550585689723.png)

## Derivation





### Leftmost Derivation

A derivation that always chooses the leftmost possible nonterminal at each step.

#### Example

![1550585751820](images/1550585751820.png)

##### Derivation

`f ( v + v )`

![1550585808730](images/1550585808730.png)

### Rightmost Derivation

The rightmost possible terminal is always expanded

![1550585853252](images/1550585853252.png)



### Parse Trees

A graphical representation of a derivation

* Root: start symbol S
* Each node: either grammar symbol or $\lambda$ or $\varepsilon​$ 
* Interior nodes: nonterminals
  * An interior node and its children: production



#### Example

![Figure 4.2 Fisher et al](images/1550586054863.png)

## BNF Form

Backus-Naur Form (BNF)

* Formal grammar for expressing CFG

Single Grammar rule format

* Non-terminal -> zero or more grammar symbols



### Extended BNF (EBNF)

![1550586178434](images/1550586178434.png)



EBNF can be rewritten to BNF

**Example:**

​	`expression -> term (+ term)*`

Rewritten to:

​	`expression -> term term_tmp`

​	`term_tmp -> + term term_tmp`

​			`| λ`



#### Algorithm to rewrite

![1550586389851](images/1550586389851.png)

## Properties of grammars

A non-terminal N is **left-recursive** if starting with at sentential form N, we can produce another sentential form starting with N

​	expression 	->	expression '+' factor | factor

Right-recursion also exists, is less important

​	expression 	->	term '+' expression

A non-terminal N is **nullable**, if starting with a sentential form N, we can produce an empty sentential form.

​	expression 	->	λ

A non-terminal is **useless**, if it can never produce a string of terminal symbols.

​	expression	->	+ expression
​				   |	  - expression		



## Grammar Transformations

We can rewrite the rules without changing the output of the rules.

This can create less readable code grammars.

### **Left factorization**

![1550586622277](images/1550586622277.png)

**Example:**

![1550586638216](images/1550586638216.png)



### Elimintaion of Left Recursion

![1550586747077](images/1550586747077.png)



**Example:**

![1550586758519](images/1550586758519.png)

### Substitution

![1550586806227](images/1550586806227.png)

![1550586824448](images/1550586824448.png)



## Dangling Else Problem

Slide 31-34

​	

# From tokens to parse trees

The process of finding the structure in the flat stream of tokens is called **parsing**, and the mudule that performs this task is called **parser**.

​	slide 38

Example parsing of Micro english

​	slide 39

* Topdown parsers
  * slide 40
  * correspond to a left derivation​
    * slide 41
* Right derivations
  * slide 43
  * corresponds to growing the tree from below
    * bottom up parsing -> rightmost derivation in reverse
    * slide 44

* Top-down vs bottom up
  * slide 45
  * 

## Hierachy

![1550588097454](images/1550588097454.png)

LL(1) formal defintion

* slide 47

Properties of the grammar that determines if it is LL(1) or not.



* First sets
  * slide 48
  * algorithm on slide 49
* Follow Sets
  * Slide 50-51
  * algorithm on slide 52

Provable facts about LL(1) grammars

* slide 53



LR Grammars

* slide 55
* No properties to detect if LR
  * it is LR if you can build an build an LR parser for it.

Other types of grammars

* slide 56
* Parsing expression grammars can not be ambigous
  * relatively new, (about 2003), not in the books.



What can you do in your project

* slide 57
* some tools



Designing CFGs

* slide 58

