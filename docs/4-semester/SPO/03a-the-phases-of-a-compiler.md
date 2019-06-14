---
title: The Phases of a Compiler
course: SPO
session: 3
date: 12-02-2019
---

# The "Phases" of a Compiler

![1549980240707](images/1549980240707.png)

## Syntax Analysis

Syntax

- Lexical analysis
    - Regular expressions
- Parsing
    - Context Free Grammar

## Contextual analysis

Contextual constraints

- Scope checking
    - Scope rules (static semantics)
- Type checking
    - Type rules (static semantics)

## Code Generations

Semantics (dynamic semantics)





## Organization of a Compiler

![1549980548507](images/1549980548507.png)

Scanner

- Source program -> tokens
    - Part of Syntax analysis

Parser

- tokens -> abstract syntax tree (AST)
    - Part of Syntax analysis

Symbol table

- Created from AST
    - Part of Contextual analysis

Semantic analysis: AST decoration

- Part of code generation