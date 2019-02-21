title: Lexical Analysis
course: SPO
session: 6
date: 21-02-2019

# Lexical Analysis

We are looking at the scanner

![1550757725638](images/6-lexical-analysis/1550757725638.png)

**Lexemes** are "words" in the input, for example keywords, operators, identifiers, literals, etc.

**Tokens:** a data structure for lexemes and additional information. 



Example ac source program:

```
f b
i a
a = 5
b = a + 3.2
p b
```

![1550757910361](images/6-lexical-analysis/1550757910361.png)

Turned into tokens by the scanner.

We may choose to contain different amount and types of operation of different types of lexemes.

![1550757974788](images/6-lexical-analysis/1550757974788.png)

This can be done to reduce the amount of memory used.

## Lexical Elements

You need to decide what to use

!!! warning

​	slide 8



## Lexems

The Lexem structure can be more detailed and subtle than one might expext.

!!! tip "Rule of thumb"

​	If the lexem structure is complex then examine the language for design flaws!!



### Simple Grammar for Identifiers

![1550758537843](images/6-lexical-analysis/1550758537843.png)

Can be transformed to a regular expression:

```regex
[a-z]([a-z]|[0-9])*
```

### Regular Expressions

!!! warning

​	slide 13



### Regular Grammars

!!! warning

​	slide 15



## The ac Language

[Remember the ac language](3-the-ac-language-and-compiler.md)



!!! warning

​	slide 17-19



## Implement Scanner Based on RE by Hand

!!! warning

​	slide 25

## Developing a Scanner

Lexical grammar of Mini-Triangle

!!! warning

​	slide 26-

### Developing a Scanner by Hand

*  Hard and error prone.
* Can be automated
* Programming scanner generator is an example of declarative programming
  * What to scan, not how to scan
* Most compilers are developed using a generated scanner



Slide 35 - Finite Automata and implementation of Scanners



### Generating Scanners

Based on:

* Regular Expressions
  * To describe the tokens to be recognized
* Finite State Machines
  * An execution model to which RE's are "compiled"



Regular Expressions can be recognized by a finite state machine (FA)

[Finite State Automaton](../SS/1b-endelige-automater.md)

#### Converting a RE Into an NDFA-epsilon

![1550760692727](images/6-lexical-analysis/1550760692727.png)

![1550760707526](images/6-lexical-analysis/1550760707526.png)



### Implementing a DFA

Slide 46-47

Algorithm on slide 48

### Implementing a Scanner as a DFA

Slide 49



### JLex Lexical Analyzer Generator for Java

Slide 51-52

#### JLex Regular Expressions

Slide 53-55-



...
