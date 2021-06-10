# Fundamentals



## Fundamental Types

* `void`
* `bool`
* Character types, most important `char`
* Integer types: `short`, `int`,`long`,`long long`
    * `signed` and `unsigned` variants
* Floating point types: `float`, `double`, `long double`
* *Enumeration* types
* Pointer types
    * Including function pointers
* Array types
* Reference types
* `struct`, `union`, and `class`



### Bool

* `true` and `false` are keywords
* Relation to other fundamental types:
    * Boolean values are converted implicitly to integers in arithmetic and logical expressions: `false` to 0 and `true` to 1.
    * Integers can be converted implicitly to booleans: 0 to `false`, other values to `true`.



### Structs

* The same as struct in C, but: 
    * In C++ it is possible to refer to `struct S {...}` by just `S`, not necessarily `struct S`. 
* C++ structs in relation to classes:
    * A struct is a class where all members are public by default
    * A struct is typcically used for aggregating public data 
    * Both structs and classes can make use of inheritance
    * Are usually used, when no member functions are defined.



### Enums

* There are plain old C **enums**:
    * `enum Color {red, green, blue};`
    * Problem: `red, green` and `blue` pollutes the whole scope
    * Potential problem: automatically converts to **int**
* New **enum class**:
    * No implicit conversion to **int**
    * It is scoped
    * Implementation type (as well as individual type) can be suggested

```c++
enum class Color:char {red = 1, green = 2, blue = 3};

Color c = red; 					// Error !! no “red” in scope
Color cc = 1;						// Error !! no conversion from int or char
char ch = Color::red;		// Error !! no conversion to char or int
Color ccc = Color::red; // OK
```



## Declarations and Definitions

* **Declaration**
    * Introduces names – for the benefit of the compiler.
    * Several declarations of the same name are allowed – must agree on the types involved.
    * `extern` keyword may be used to distinguish from definition.
* **Definition**
    * A declaration that also defines *an entity*
        * A location in memory
        * A function with a body
        * A *fully-specified* type
    * *An initialization or a function body signifies a definition*
    * ***There must be precisely one definition of a named entity.***
        * This is a bit relaxed for the benefit of multiple includes:
            * A **class**, **inline** functions and variables, or **templates** may be defined more than once (if they appear in different translation units and if they are token-fortoken identical)



```c++
/* ↓ DEFINITIONS  */
string s;
int i = 5;

struct Date {
  int d, m, y;
};

int f(int i) {
 return i + 1;
}
/* ↑ DEFINITIONS */

/* ↓ DECLARATIONS  */
extern string t;
extern int j;
struct DateWithWeekday;
int g(int i);

DateWithWeekday h(Date, int);
/* ↑ DECLARATIONS */

/* ↓ DEFINITIONS  */
struct DateWithWeekday {
  Date wd;
  int weekday;
};
/* ↑ DEFINITIONS */
```

```c++
string s;
string s = “ququ”; 		// Error!! Double definition
int f(int i) {
	return i + 1;
}

int f(int j) { 				// Error!! Double definition
	return j + 1;
}

double f(double j) { 	// OK. Overload
	return j – 1;
}

int g(int i); 				// Declarations
struct Date;

int f() { 						// Another overload
	Date d; 						// Error!! Incomplete type
	f(1);
	g(2); 							// OK. Enough info for compiler
}

```



### The Structure of a Declaration

* A declaration of a single entity consists of a four parts:
    * Base type including **const** and **volatile** qualifiers
    * **Declarator**
        * The name being declared
        * Optional *declarator* operators (`*, &, &&, []`)– often mimics their use as operators in expressions
    * **[Specifier]** (prefix and suffix):
        * `auto, extern`
        * Storage class: `mutable, static, virtual`
    * [**Initializer**]
        * Different styles are possible

```c++
unsigned int i = 7;
const double d = 5.7;
char* str[] = {"This", "is", "a", "c-string", "array"};
extern short int ei;
bool is_even(int a);
Point p1(1,2);
Pair q1 = {3,4};
```



### Declaring Several Names Together

* Several *comma*-separated declarators, with associated initializers, may share the same base-type and specifier..
    * May lead to confusions, better avoided:

```c++
unsigned int i = 7, j[3], *k = &i;

char ch0;
char* ch1, ch2; // Misleading notation but OK. Only ch1 is a char pointer!
char *ch3, ch4; // A little bit better, but better avoided all together!

const double d = 5.7, pi = 3.14159, &dr = d;
char *str[4], ch = 'a';
bool 	is_even(int a),
			is_odd(int a);

Point p1(1,2), p2;

Pair 	q1 = {3,4},
			q2 = {5,6};
```



## Objects and lvalues

* An **object** is a contiguous region of storage - "something in memory"
    * A more general concept than an OOP (object)
* An **lvalue** is an **expression** that refers to an object.
    * Named after expressions that can occur at the left-hand side of an assignment, but is more general than that
    * Usually they are *modifiable* but can also be declared constant.
    * They have **identity**.
        * Not some temporary result of computation.

```c++
var = 7;
tab1[3] = 8;
*(tab2 + 4) = 9
tab3[0].x = 2.0;
```



## Rvalues

* An **rvalue** e is an expression that is not an lvalue – an expression whose value does not have an identifiable position in memory, such as a temporary object
    * Expressions that can appear at the right side of the assignment
    * It does not make sense to take the address of an rvalue expression

```c++
double e 	= 3.14;
double d 	= f(5, e);
int i 		= 5, k = i + 8;
bool b 		= Point{1,2} == Point{3,4};

double *pe	= &3.14; 		// error: Cannot take the address of a 3.14
double *pd 	= &f(5, e); 	// error: Cannot take the address of a f(5, e)
int *pi 		= &(i + 8); 		// error: Cannot take the address of (i + 8)
```



## References

* Best way to think about a reference is that it is an ***alias***, an ***alternative name***.
    *  Used with the same syntax as the original name
* Why references in C++?
    * An implementation of call-by-reference parameters - instead of relying on pointers passed by value
    * An optimization of large call-by-value parameters - by means of **const** references (read: “references to constants”)
        * Name binding to temporary objects
    * Essential for programming parameters of copy constructors and assignment operator overloads



### Rules for References

* A reference must be initialized when declared
* A reference is constant by nature
    * Once established the reference can never be set to reference something else
* No operator operates on a reference as such - only the object referenced
* There is no null reference (in the sense that there is a **nullptr**)
* Pointers to references and arrays of references do not exist
    * But references to pointers and references to arrays can exist

[references1.cpp](http://people.cs.aau.dk/~simas/sp2021/lecture2/references1.cpp.html) : operations on references vs. operations on pointers
[references3.cpp](http://people.cs.aau.dk/~simas/sp2021/lecture2/references3.cpp.html) : references to local variables



### Constant References

* The use of `const` in a declaration of a reference (argument) means that we do not want to change the referenced object
    * ...and we ask the compiler to enforce that
* Replaces passing-by-value of large arguments 
* “An initializer for `const T&` does not need to be an lvalue, or even of type `T`”
    * `const T& var = expression;`
    * Initialization of var - a reference to T:
        * Implicit *conversation* from the type of *expression* to `T` is performed
        * The result is placed in a *temporary variable* of type `T`
        * `var` is bound to the teporary variable, which cannot be mutated

[references2.cpp](http://people.cs.aau.dk/~simas/sp2021/lecture2/references2.cpp.html) : **const** references and references for output parameters



### Lvalue References vs Pointers

* The notational overhead (use of `&` and `*`) is less for use of references than for pointers
    * The reason is that it is not possible to manipulate the reference as such
* The mental models are different
    * Pointers: Establish a pointer to an object, follow the pointer to the object for lhs/rhs access.
        * The pointer itself may be changed.
    * References: Establish an alternative name to an existing object (an alias).
    * Once established the reference can never be changed.
* *Pointer is lower-level (closer to hardware) concept, reference is a higher level, language concept.*
    * *But: **new** returns a pointer! Then use smart pointers from STL (more later…)*



### Three Kinds of References

* Lvalue references
    * Refers to values we want to change
    * Useful alternatives for C-style 'call-by-reference' parameters (using pointers)
* **const** Lvalue references
    * Refers to constants - values that we do not want to change
    * Useful alternative for 'call-by-value' parameters in many contexts
* Rvalue references  (we will return to them later)
    * Refer values that we do not want to preserve after we have used it
    * Useful in the context of value return from a function
        * Values that we intend to 'move from'



## Reading/Writing Complex Types

* Unary operators are right-associative
    * It helps reading complex type constructs from right to left
    * `[]` and `()` take precedence over `*` and `&`

```c++
const double* a[]; 				// an array of pointers to const doubles
const double (*a)[]; 			// a pointer to an array of const doubles
const double* const a; 		// a const pointer to a const double
const double* const *a; 	// a pointer to a const pointer to a const double
```

* Terminology sometimes can be ambiguous
    * What do “const reference” and “const pointer” mean?
* Type aliases – synonyms for complex types:

```c++
using cpdouble 	= const double* const;
using pf 				= int (*)(double);
```



## Function/Operator Overloading

* The same name, but different formal parameters
    * Overloading is resolved at *compile time*
        * Finds the *best match*, or reports ambiguity
    * The function return types do not take part in overload resolution
* Complex rules for what is the best match. 
    * For each pair of actual and formal parameters:
        * Exact match
        * Match using promotions:
            * **bool** to **int**, **char** to **int**, **short** to **int**, **float** to **double**, …
        * Match using standard conversions
            * **int** to **double**, **double** to **int**, ...
        * Match using user defined conversions
            * Conversion operators and constructors
        * Match using the ellipsis (…)
            * Unspecified number of parameters

[overloading1.cpp](http://people.cs.aau.dk/~simas/sp2021/lecture2/overloading1.cpp.html) : ambiguous overloading
[overloading2.cpp](http://people.cs.aau.dk/~simas/sp2021/lecture2/overloading2.cpp.html) : overloading with two parameters



## Physical Program Organization

* Source files with `#include` directives
* A *translation unit* is the result of preprocessing a *source file*.
* *preprocessing* $\to$ *compilation* $\to$ *(archiving)* $\to$ *linking*
* *source files* $\to$ *object files* $\to$ *(libraries)* $\to$ *executables*
* `.h` file
    * Includes an interface – adds some definitions of types and declarations of static data and some functions to some namespace 
* `.cpp` file
    * Includes definitions (implementations) of functions/methods and definitions of static data: 
        * implement an interface defined in a header... 
        * ...or are internal to the compilation unit
* External linkage:
    * A name that can be used in other translation units than the one where it is defined
* Internal linkage:
    * A name that only can be used in the translation unit where it is defined
    * Declared as **static** in C programs and older C++ programs
    * Use an unnamed **namespace** for internal linkage in C++ programs



### Examples

* [point.h](http://people.cs.aau.dk/~simas/sp2021/lecture2/point.h.html)
* [point.cpp](http://people.cs.aau.dk/~simas/sp2021/lecture2/point.cpp.html)
* [tripple.h](http://people.cs.aau.dk/~simas/sp2021/lecture2/tripple.h.html)
* [tripple.cpp](http://people.cs.aau.dk/~simas/sp2021/lecture2/tripple.cpp.html)
* [main.cpp](http://people.cs.aau.dk/~simas/sp2021/lecture2/main.cpp.html)



## Logical Program Organization

* **Namespace** is a *named scope*
* Use of names requires namespace qualification, with use of the *scope resolution operator* `::`
    * `namespace::name_in_it`
* A `using` *declaration* can be used to add a name (an alias) to a local scope (such as a function) from a namespace:
    * `using N::name;`
    * *name* is declared as a local synonym to `N::name`
* A `using` *directive* allows convinient access to names from a given namespace:
    * `using  namespace N;`
    * Preferably used locally, in a function for instance



### Namespaces

* A namespace is *open*:
    * A single namespace N can span several source files
    * For instance namespace `N {...}` forms in two or more header files
* Namespaces can be nested
* There is a *global* namespace
    * Access to *name* in the global namespace: `::name`
* *Unnamed namespaces*
    * Used in C++ to make names local to a compilation unit (internal linkage)

