# Haskell

## Functions

### Picking function based on type
Given the type
```haskell
data Branching a = Element a | Branch ( Branching a) ( Branching a)
```
We can design a recursive count function
```haskell
count (Branch l r) = count l + count r 
count (Element e)  = 1
```
See the miniproject for more examples

## Types

In
```haskell
(Eq a, Num b) => (a,a) -> b
```
we say that
* `a` and `b` are **type variables**
    * *"unknown types that we must find on the way"*
* `Eq` and `Num` are **type classes**
    * defines that every type `a` from this class has some functions defined on it
        * e.g. `Eq a` -- `a` has a function `==` with type `a -> a -> Bool`


### Type and Term Constructor

Example

```haskell
data BTree a = BLeaf a | BBranch (a,Tree a,Tree a)
```
* `BTree` is a **type constructor**, since it is used to construct a type
* `BLeaf` and `BBranch` are **term constructors**, since they are used to build a term









## Polymorphism

* **Ad hoc-polymorphism** 
    * In ad hoc-polymorphism, a polymorphic function
really stands for a collection of *different implementations* corresponding
to different uses. 
    * This is sometimes called overloading.
* **Parametric polymorphism**
    * In parametric polymorphism, a polymorphic function is a *general implementation* with a general type.

## Pattern Matching

* `(x:xs)` (**list pattern**) matches a non-empty list where the first element is bound to `x` and the rest bound to `xs`


## List Comprehension

[Video about list comprehension](https://www.youtube.com/watch?list=PLA8H0-CuqhGGRNPgehORC3AzR9k0fGmTL&v=3AA6GJnwrQw&feature=emb_title)

We can generate all even numbers with:
```haskell
evens = [2 * i | i <- [1..]]
```
* The right side is called the generator (`i <- [1..]`)

List comprehensions can be nested such as:

```haskell
pairs = [[(i,j) | i <- [1,2]] | j <- [1..]]
```
* This will give the pairs `[[(1,1), (2,1)], [(1,2), (2,2)], ...]`

* List comprehension = 
    * ranges  (generators) +
    * filters (guards)