---
title: Tombstone Diagrams
course: SPO
session: 2
date: 07-02-2019
---

# Tombstone Diagrams

![1549551059965](images/1549551059965.png)



* Diagrams consisting out of a set of "puzzle pieces", we use to reason about language processores and programs
* Differnt kinds of pieces
* Combination rules (not all diagrams are well formed)

![1549551130225](images/1549551130225.png)

## Combination Rules

![1549551194500](images/1549551194500.png)

## Example

![1549551250092](images/1549551250092.png)



## Cross Compilation

A **cross compiler** is a compiler that runs on one machine (**host machine**), but emits code for another machine (**target machine**).

![1549551311826](images/1549551311826.png)

This is what happens when compiling an app for android on a x86 machine for example.



## Two Stage Compilation

**Two-stage translator**: a composition of two translators. The output of the first translator is provided as input for the second translator.

![1549551435757](images/1549551435757.png)

Generate C code from Java, compile the C code with C-compiler.

![1549551492001](images/1549551492001.png)



## Interpreters

**Interpreter**: A language processor implemented in software.

**Terminology:** **abstract (virtual) machine** versus **real machine**.

**Example**: The Java Virtual Machine

![1549551691582](images/1549551691582.png)



## Compiler vs Interpreter

**Compilers** offer advantages when:

* Programs are deployed in a production setting
* Programs are repetative
* The instructions of the programming language are complex

**Interpreters** are better choice when:

* In development/testing/debugging stage
* Programs are run once and then discarded
* The instructions of the language are simple
* The execution speed is overshadowed by other factors.



## Portable Compilers

Example:

![1549552040331](images/1549552040331.png)

It is easier to port Kit 2.