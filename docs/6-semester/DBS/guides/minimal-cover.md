---
title: Calculate Minimal Cover (Canonical Cover)
---

# Calculate Minimal Cover (Canonical Cover)

![image-20200528110326881](../images/04-relational-database-theory/image-20200528110326881.png)

- Page 325 in book (PDF page 354)
- [Example in DBS4 slides p 69](https://www.moodle.aau.dk/pluginfile.php/1979144/mod_resource/content/0/DBS-norm-csj-2.pdf#page=69)





### Left Reduction

- If A is on the **left** side, let $NL =LeftSide - A$ and check if $NL \to RightSide$
  - $NL$: New Left
  - **Remember**: only check pairs, as singletons would become empty and meaningless
    - This explanation is probably not correct, but makes sense
  - To do so, compute the closure of **NL** under the set of functional dependencies and check if all attributes in the closure is also in the **right side**
    - To compute closure under a functional dependency:
      - Check which attributes can be inferred from the current attribute(s).
      - This is recursive, so if $A \to B$, then $A$ can continue inferring what $B$ infers.
      - **Remember**: An attribute can always infer itself
      - **Remember**: The set of functional dependencies temporarily has $A$ removed from the chosen functional dependency

### Right Reduction

- If $A$ is on the **right** side, let  $F^*$ be the set of functional dependencies without $A$ in its place
  - Alternative explanation: Remove $A$ from it place in the current chosen functional dependency
- Check if the chosen dependency/the dependency $A$ was in still can infer to $A$
  - Do this by computing the closure of the chosen dependency under **F**