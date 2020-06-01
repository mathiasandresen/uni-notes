---
title: Lossless Decomposition and Dependency Preservation
---



# Lossless decomposition and Dependency preservation

## Check for Lossless

- Find all common attributes in the two (or more) relations
- For each common attribute check if it is a **[super key](../04-relational-database-theory.md#super-keys)** for one of the relations based on the given functional dependencies
    - **Super key** means it can infer all other attributes, in this case in one of the relations
- If a common attribute is a **super key** in one of the relations, the decomposition is lossless

## Check for Dependency Preservation

- For each functional dependency, check if they can be applied/is represented in/tested on any of the new relations
    - **Probably easiest way to check:** every attribute of a functional dependency, should be found in any single relation. This must be true for each functional dependency
        - For every functional dependency:
            - Check all attributes in the dependency, can be found in a single relation
    - If true, the decomposition is dependency preserving

