---
title: Binary Search Trees
course: AD1
session: 8
---

# Binary Search Tree

Binary tree T satisfiyng **binary-search-tree** property. (Like max-heap property).

* Let x be a node in a binary search tree.

* If y is a node in the **left** subtree of x, then
$$
y.key\leq x.key
$$

* If y is a node in the **right** subtree of x, then

$$
y.key\geq x.key
$$

**Example:**

![1547036339419](images/1547036339419.png)

![1547036310926](images/1547036310926.png)

![1547036318130](images/1547036318130.png)

**Note:** more balanced, the better!

## Represent with Linked List

Each node has 3 pointers.

* "P" points to parent.
* "Left" points to left child.
* "Right" points to right child.

The tree has pointer "Root" pointing to the root of the tree.

![1547036556422](images/1547036556422.png)

<div style="page-break-after: always;"></div>

## Tree walks

Process of visiting each node in a tree data structure exactly once.

Keys in the BST can be printed using "tree walks".

### Inorder tree walk

The key of each node is visited (printed) between the keys in the left and right subtrees.

```pseudocode
InorderTreeWalk(x)
01	if (x != NIL) then
02		InorderTreeWalk(x.left())
03		print x.key()
04		InorderTreeWalk(x.right())
```

DaC algorith.

#### Example

![1547037005683](images/1547037005683.png)

![1547036999115](images/1547036999115.png)

### Preorder tree walk

Visits each node **before** visiting its children.

### Postorder tree walk

Visits each node **after** visiting its children.

### Example

![1547037139978](images/1547037139978.png)

