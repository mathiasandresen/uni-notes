# Scheme

## Delayed Evaluation and Streams

Two new primitives

* `(delay expr) => promise`
* `(force promise) => value`



### Stream Functions

* `(cons-stream a b)` ~ `(cons a (delay b))`

* `(define head car)`
    * Gets head of stream
* `(tail stream)`
    * Get tail of the stream

* `(stream-section n stream)`
    * Gives the n first elements of the stream
* `(add-streams s1 s2)`
    * Pairwise addition of the two streams

**Example - Fibonacci Stream**

```scheme
(define fibs
  (cons-stream 0
  	(cons-stream 1
    	(add-streams (tail fibs) fibs))))
```



## Rewrite Rules

### Alpha Rule

Formal parameters of a lambda expression can be substituted by other names, which are not used as free names in the body

**Legal Conversion**
```scheme
(lambda (x y) (f x y))  =>  (lambda (a b) (f a b))
```

**Illegal Conversion**
```scheme
(lambda (x y) (f x y))  =/> (lambda (a f) (f a f))
```

### Beta Rule

An application of a function can be substituted by the function body, in which formal parameters are substituted by the corresponding actual parameters

**Legal Conversion**
```scheme
((lambda(x) (f x)) a)                    =>  (f a)
((lambda(x y) (* x (+ x y))) (+ 3 4) 5)  =>  (* 7 (+ 7 5))
((lambda(x y) (* x (+ x y))) (+ 3 4) 5)  =>  (* (+ 3 4) (+ (+ 3 4) 5))
```

### Eta Rule

A function `f`, which only passes its parameters on to another function `e`, can be substituted by `e`

```scheme
(lambda(x) (e x)) <=> e provided that x is not free in the expression e
```

**Legal Conversion**

```scheme
(lambda (x) (square x))               => square
(lambda (x) ((lambda(y) (* y y)) x))  => (lambda(y) (* y y))
```

**Illegal Conversion**

```scheme
(lambda(x) ((lambda(y) (f x y)) x))  => (lambda(y) (f x y))
```

