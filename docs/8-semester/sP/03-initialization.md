# Initialization

```c++
T v1 = v; 	// C style initialization.
T v2 = {v}; // C style List initialization.
T v3(v); 		// Constructor style initialization.
T v4{v}; 		// Universal initialization, without narrowing. Preferred.
T v5(); 		// C++’s most vexing parse: A function declaration, not a variable definition!
T v6{}; 		// Default initialization. For user-defined types, use parameterless constructor.
int i{10}; 	// OK.
char ch{i}; // Warning: narrowing
```



**Assignment style:**

* Confusion with assignment (can be different for user defined types)

```c++
T v1 = v; // T’s copy constructor is called
 	v1 = w; // T’s assignment operator is called 
```

**Constructor-call style ()**

* Confusion with function declaration
* Not possible for class members in the definition of a class

**Universal initialization** - with `{}`

* Can bee used (almost) everywhere

* Warns about narrowing

* Generalizes the notation used for initialization of arrays and structs in C

* Can aso be used for passing parameters to constructors

  * Although sometimes with some abiguities, forcing the use of old-style initialization!

  * ```c++
    std::vector<int> v(10, 2); // Create a vector with 10 elements all initialized to 2.
    std::vector<int> v{10, 2}; // Create a vector with two elements: 10 and 2.
    ```

  * This happens when there is a constructor of a class with a parameter of a special STL type `std::initializer_list<T>`. When writing your classes, consider avoiding such constructors.

* `{}` results in default initialization, also fo the built-in types



## Auto

* `auto` - the compiler infers the type&&)

  * Can be decorated with `const`and `&(&&)` or `*`

  * Good idea to use if often (AAA rule = Almost Always Auto)

    1. Forces to initialize
    2. Makes code more general and easier to refactor
    3. Avoids subtle errors and perfomance penalties (unexpected temporaries)
    4. Helps when the type is known only to the compiler (e.g. lambdas)

    * Have to be careful to avoid pitfalls (related to type inference or assuming too much about the type)

```c++
auto i = 10;
auto l = 10l;
auto s = "Hello"s; // std::string object! User-defined suffixes for user-defined types are possible.
const auto& ii = i;
auto a {10}; // Creates an integer, starting from C++17
auto b = {10}; // But: creates an std::initializer_list object with one member!!

if (i == b) // Does not compile!
	cout << "Equal" << endl;
else cout << "Oops" << endl;
```



## Lambdas

```c++
int m{5}, n{6};

auto f1 = [](int x)->int{return x + 1;}; 	// a function that returns x + 1.
auto f2 = [m](int x){return x + m;}; 			// can read m from local scope.
auto f3 = [=](int x){return x + m + n;}; 	// can read all local variables.
auto f4 = [&m](){++m;}; 									// access to m by reference - can write.
auto f5 = [&](){++m; n--;}; 							// access to all local variables by reference.
auto f6 = [&]{++m;}; 											// empty parameter list implicit.
```

Consists of

* Capture list `[...]` - the lambda introducer
  * `[]`: captures nothing (as for regular functions)
  * `[&]`: all local names can be used (accessed by reference)
  * `[=]`: all local names can be used (their **const** copies are available)
  * `[capture-list]` specific captured names are given

* Formal parameter list (optional) `(parameters)`
* Return type declaration (optional) `-> Type`
  * If not given, deduced the same way as for auto
* Body as for any other function `{...}`

Lambdas are often used as arguments of STL (or your...) generic algorithms

```c++
int c{10};
vector<int> v{1, 3, 20, 6, 4};

// multiplies all numbers by a constant
for_each(begin(v), end(v), [c](int& i){ i *= c; });

// checks some condition for all numbers
if (find_if(cbegin(v), cend(v), [](const auto& i){ return i < 0 || i > 100; }) != cend(v))
 cout << "There is a value outside the range [0, 100]" << endl;

// prints all numbers: 10, 30, 200, 60, 40,
for_each(cbegin(v), cend(v), [](const auto& i){ cout << i << ", "; });
```



## Class Basics

* In C++, class design can be emphasized by seperating *class definition* (in .h) from *member definition* (in .cpp)
  * But not neccesarily for all member functions (and not at all for template classes)

Class definition

* Public part:
  * Constructors
  * Copy/Move constructors
  * Member functions (including operator overloads)
  * Destructor
* Private part:
  * Data members
  * Helper functions

**Examples**

[Point definition](http://people.cs.aau.dk/~simas/sp2021/lecture3/point1.h.html)

[Point implementation](http://people.cs.aau.dk/~simas/sp2021/lecture3/point1.cpp.html)



### Constructors

* Constructors in C++ are in many ways similar to constructors in C# and Java

```c++
classname(formal parameters): member1{init1}, member2{init2}, member3{init3}
{
	body
};
```

* Initialization of class data members with member initializers
  * Special syntax for initialization of data members and bases (super class parts)
  * Emphasizing uniform use of `{}` notation
  * Place between the constructor header and body
  * Initializes the data members from the formal parameters of the constructor
  * If constructor(s) with parameters are given, no default constructor is generated!
  * *Constructor chaining* (example [rectangle class](http://people.cs.aau.dk/~simas/sp2021/lecture3/rectangle.h.html))



### Destructors

* Destructors are essential for resource management
* Usually called implicitly:
  * When an automatic (local) variable of class type goes out of scope
    * Because of normal termination
    * Because of exceptional termination: *stack unwinding*
  * When a dynamically allocated object is *explicitly deleted* from the free store (the heap)
    * With `delete` or `delete[]`
* Example: [Alternative Point Class](http://people.cs.aau.dk/~simas/sp2021/lecture3/point2.h.html)



### Move Semantics

#### Rvalues

* An **rvalue** is an expression that is not an *lvalue* - an expression whose value does not have an *identifiable (with a name!)* position in memory, such as a temporary object
  * Expressions that can appear at the right side of the assignment
  * It does not make sense to take the address of an rvalue expression

```c++
double e 	= 3.14;
double d 	= f(5, e);
int i 		= 5, k = i + 8;
bool b 		= Point{1,2} == Point{3,4};

double *pe 	= &3.14; 			// error: Cannot take the address of a 3.14
double *pd 	= &f(5, e); 	// error: Cannot take the address of a f(5, e)
int *pi 		= &(i + 8); 	// error: Cannot take the address of (i + 8)

int& fun();
fun() 	= 42; 						// ok, fun() is an lvalue
int* p1 = &fun(); 				// ok, fun() is an lvalue
```



#### References

* An **rvalue** reference is a reference to a tepmporary object (soon to dissapear) from which we can steal som constituents in order to avoid an expensive copy operation
  * *Binds* to an rvalue, such as the returned value of many functions
  * Used for "destructive read" that would otherwise have required a copy
  * We want to overload some functions on Rvalue references in order to avoid expensive copy operations
  * Intimately connected to move constructors

```c++
Shape& Shape::operator=(Shape&& from) { … return *this; }

Shape a;
a = compute_shape();
```



#### Copying vs Moving Constructors

* Moving
  * Giving away details of an object instead of copying the dtails - "destructive read"
    * object is left in undefined (but valid!) state
    * For example, it should be possible to assign to it (if the `operator=` is defined)
  * A move constructor `C(C&& a)` moves `a` into the current object
  * A move constructor does not allocate resources - and should not throw any exception
    * In contrast to a copy constructor
  * If moving should take place, and if no move constructor exist, use the copy constructor (and pay the price)



#### A Class with Everything

```c++
class MyClass
{
  MyClass(); 										// default constructor
  MyClass(somearguments); 			// constructor from arguments (type conversion, if one argument)
  MyClass(const MyClass& a); 		// copy constructor
  MyClass(MyClass&& a); 				// move constructor
  MyClass& operator=(const MyClass& a); // copy assignment: clean up target and copy
  MyClass& operator=(MyClass&& a); 			// move assignment: clean up target and move
  ~MyClass(); 									// destructor: clean up
  // ...
};
```



#### Forcing the Move Semantics

* A "function" `std::move` can be used to convert into an rvalue type, thus causing the move semantics

```c++
template <class T>
void swap (T& a, T& b) {
  T c{std::move(a)};
  a = std::move(b);
  b = std::move(c);
}
```



#### Passing Arguments: Summary

* Ignoring pointers, the possible agreements between the caller and the function regarding an argumentz
* *"Get a copy and do whatever you want with it"*
  * Pass by value: `void fun(MyClass x);`
* *"Work on it and give me back"*
  * Pass by lvalue reference: `void fun(MyClass& x);`
* *"Just look at it, no touching"*
  * Pass by const lvalue reference: `void fun(const MyClass& x);`
  * *Note: the function may end up working on a temporary copy (if some type conversion had to be done)!*

* *"Use it, but give me back a box"*
  * Pass by rvalue reference: `void fun(MyClass&& x);`