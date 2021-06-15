# Classes Continued



## Rule of Five/Three/Zero

**Rule of Three**

* If a class requires user-defined **destructor**, a user-defined **copy constructor**, or a user-defined **copy assignment operator**, it almost certainly requires all three.
    * **Corollary**: if you **delete** one them, you most likely want to delete all three

**Rule of Five**

* If you want move semantics, you have to provide all five special functions.
* If you forget **move constructor** and **move assignment operator** - missed optimization opportunity 

**Rule of Zero**

* If you build things out of standard library components to manage your resources, you don’t have to provide any of the special functions.
    * The same bare-bones graph, but with `std::vector`: [rule0.cpp](http://people.cs.aau.dk/~simas/sp2021/lecture4/rule0.cpp.html)



### More About Special Methods

* Deleting with `= delete`
    * It is possible to delete a constructor (or any other function) that has been generated automatically
    * For instance deleting a copy constructor, such that an object cannot be copied
* Defaulting with `= default`
    * It is possible to emphasize that we actually want to have an automatically generated function, for instance, to document that the automatically generated move constructor/assignment operator exists 
* Rule of five still applies...



## RAII Principle

* [Video about RAII](https://www.youtube.com/watch?v=uT3wL9K0DoQ)

* **R**esources **A**cquisition **i**s **I**nitialization Principle
    * There is no automatic memory management in C++
    * Therefore it is attractive to attach *resource management* to construction and destruction of **stack-allocated objects**
    * The resource is encapsulated in a class together with allocation and release member functions



### Smart Pointers

* `std::unique_ptr` – for unique ownership
* `std::shared_ptr` – for shared ownership
* `std::weak_ptr` – for temporary ownership (with possibility for safely dangling) 



The first two:

* provides overloads for `operator*` and `operator->`
* can be null
* custom deleters are possible (but handle differently...)
* [smart_pointers.cpp](http://people.cs.aau.dk/~simas/sp2021/lecture4/smart_pointers.cpp.html)





## Type Conversion



### Explicit Type Conversion

Explicit conversions to type `T` (casts):

* `static_cast<T>(expr)` from a related type
    * Can activate built-in or user-defined type conversion, conversion operators, and implicit/explicit constructors.
* `reinterpret_cast<T>(expr)` from an unrelated type - "*dangerous*"
    * Can cast between pointer types, and between integer and pointer types
    * Provides a value of new type that has the same bit pattern as its argument.
* `dynamic_cast<T*>(expr)` from a related polymorphic type (pointer or reference types only)
* `const_cast<T>(expr)` from a closely related type (add or remove const qualifier)
* C-style type casts: `(T)expr` or `T(expr)` using early C++ notation

[Stackoverflow: About casting](http://stackoverflow.com/questions/332030/when-should-static-cast-dynamic-cast-const-cast-and-reinterpret-cast-be-used)



*"If you are doing a lot of explicit conversions, you are doing something wrong..."*





## Const Member Functions

* A constant member function is not allowed to change the state of the object.
    * *On a constant object, only constant member functions can be called.*
    * A const member function cannot call other member functions which are not constant!
    * [Point class](http://people.cs.aau.dk/~simas/ap2017/lecture4/point2.h.html)

* Difference between *logical constness* and *physical constness*
    * For example, for efficiency, I may cash results of some expensive computations.
    * **mutable** data members can always be updated, even if they belong to a **const** object





## Inline Member Functions

* Given by the `inline` keyword and member functions defined inside class definitions are implicitly marked as inlined
* An efficiency concern - eliminates a call
    * A plea to the compiler - not a requirement
    * Inline functions must be defined in every translation unit where they are used, thus they are usually defined in *header files*
    * Some functions cannot easily be inlined
        * recursive functions
* Two ways to specify them
    * Write a body in the class definition (only if it is very brief)
    * Provide the definition of the member function in *the same header file*

```c++
class Counter {
private:
	int what;
	int& counter;
public:
	Counter(int value, int& cnt): what{value}, counter{cnt} {}
	void operator() (int item);
};

inline void Counter::operator() (int item) {
	if (item == what) counter++;
}
```





## Friendship

* Friendship is provided by the class that encapsulates members with access limitations
    * Friendship cannot be taken by a class or function that wants access!
* Friendship can be granted to:
    * an ordinary function, or to an overloaded operator
        * ​	`f(x,y)` versus `x.f(y)` call syntax
    * a member function in another class
    * all members of another class
* Friendship is not transitive, and it is not inherited

Example: operators `<<` and `>>` : [header](http://people.cs.aau.dk/~simas/ap2017/lecture4/textprocessor.h.html), [cpp](http://people.cs.aau.dk/~simas/ap2016/examples/lecture4/textprocessor.cpp.html)



## Operator Overloading

Restrictions:

* It is not possible to invent new operator symbols.
* The associativity and precedence of the predefined rules of predefined operators apply.
* Cannot be overloaded: `::`, `.` , `.*` , `?:` , `sizeof` , `typeid`
* At least one operand must be of a user-defined type.
* If the **left operand** is of **user-defined type**, the operator may be defined as a *member function*
* If the **left operand** is of **predefined type**, the operator must be a *non-member function*

Example: [point3.h](http://people.cs.aau.dk/~simas/ap2017/lecture5/point3.h.html), [point3.cpp](http://people.cs.aau.dk/~simas/ap2017/lecture5/point3.cpp.html)

Example of `operator(), operator int()`: [functor.cpp](http://people.cs.aau.dk/~simas/ap2017/lecture5/functor.cpp.html)

* Implementing lambda through function objects



## STL: string

* `string` is an alias for a `basic_string` parameterized by `char`
* As everything in STL, strings have *value semantics*
    * Copied in and out of functions - or passed by reference
* Characters in strings can be accessed in checked mode and unchecked mode
    * **Checked mode**: `s.at(i)`
    * **Unchecked mode:** `s[i]`
* A string is **mutable**
* Strings can be *copy constructed* based on a C-style string
    * `string s{"Peter"};`
    * `string s("Peter");`
    * `string s = "Peter";`
* Short string optimization
    * Short strings are allocated in the string object itself (not on the free store)



## STL: vector

* A template class - type parameterized
* Not of fixed size like an array – the number of elements may be adjusted dynamically
* Size and capacity:
    * **Size**: the actual number of elements in the vector
    * **Capacity**: the maximum number of elements before resizing is needed.
* With or without range checking.
* Obeys value semantics and stores values 
    * It wraps a pointer to a heap storage
* Traversed with use of *iterators*. Iterators can be used in a similar way as pointers, via overloading of operators
    * `*iterator`, `iterator++`, `iterator + n`, `iterator1 - iterator2`



## std::ostream and std::istream

Considerations about IO in C++:

* IO functions must apply uniformly to pre-defined types and user-defined types
    * The C-style `printf` and `scanf` are not easy to generalize to user-defined functions
    * In addition, `printf` and `scanf` are not type safe
* Use of *overloaded operators* seems attractive
    * Shorter, and easier to spot: `s << d1 << d2 << d3`
    * The relative low priority of `<<` is practical when values of expressions must be printed.
        * `cout << x + y * z` and not `cout << (x + y * z)`



### Standard Streams and Files

* `cin`:  Standard character input – typically defaulted to a keyboard
* `cout`: Standard character output – typically defaulted to a screen
* `cerr`: Standard character error output – unbuffered
* `clog`: Standard character error output – buffered 

Manipulators:

```c++
cout 	<< 17 	<< endl << showbase
			<< hex	<< 17		<< endl
      << oct	<< 17		<< endl;
```

