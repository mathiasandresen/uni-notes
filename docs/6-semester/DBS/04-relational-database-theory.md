---
title: Relational Database Design Theory
---

# Relational Database Design Theory

## Armstrong Axioms

**Reflexivity**

If $\beta \subseteq \alpha$ then $\alpha \to \beta$ 	in particular: $\alpha \to \alpha$

**Augmentation**

If $\alpha \to \beta$ then $\alpha \gamma \to \alpha\gamma$

**Transitivity**

If $\alpha \to \beta$ and $\beta \to \gamma$ then $\alpha \to \gamma$

### Additional Rules

**Union**

If $\alpha\to\beta$ and $\alpha\to\gamma$ then $\alpha\to\beta\gamma$

**Decomposition**

If $\alpha\to\beta\gamma$ then $\alpha\to\beta$ and $\alpha\to\gamma$

**Pseudotransitivity**

If $\alpha\to\beta$ and $\gamma\beta\to\delta$ then $\alpha\gamma\to\delta$