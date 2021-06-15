# Generic Programming

## Type Aliasing

```c++
typedef vector<int>::iterator vi_t; 	// old way
using vi_t = vector<int>::iterator; 	// new, broader way

typedef void (*FP) (int, string&); 		// old way
using FP = void (*) (int, string&); 	// new, broader way
```

* `typedef` is not supported in templatization, use `using`
* Alias avoid `::type` sufix workaround:

```c++
template <typename t>
struct MyAllocList {
	typedef list<T, MyAlloc<T>> list_type;
}
auto lw = MyAllocList<Widget>::list_type();
```

* C++14 offers aliased types for C++11 type traits

```c++
template <class T> // rich library of type manipulation
using remove_const_t = typename remove_const<T>::type
```



### Function vs Class Templates

| Function templates                                        | Class templates                                  |
| --------------------------------------------------------- | ------------------------------------------------ |
| Function overloading                                      | "Forward declaration"                            |
| Argument type deduction,<br />*no partial specialization* | Type deduction<br />via *Partial specialization* |
| Complete specialization                                   | Complete specialization                          |
| SFINAE                                                    | Argument substitution                            |



## Function Overload Resolution

### Narrow Overloading: static_assert

* Suppose we want to handle both lvalue and rvalue at once:

```c++
void dump(std::ostream& os); 	// dump(cerr);
void dump(std::ostream&& os); // dump(ofstream("err.txt"));
```

```c++
void dump(auto&& os) {...} 		// binds to both & anything (GNU extension)
```

```c++
template <typename StreamRef> 						// binds to anything (C++ standard)
void dump(StreamRef&& os) { os << blah; } // no checks ⇒ may break, may err a lot
```

* User `static_assert` to produce error **if assumptions are not met**

```c++
template <typename StreamRef>
void dump(StreamRef&& os) { 													// still binds to anything,
	using Stream = std::remove_reference_t<StreamRef>; 	// Compute type
  static_assert(std::is_base_of_v<ostream, Stream, "expecting ostream interface");
  os << blah; // Implementation details
}
```

* `static_assert()` - breaks at compile time (**fail-fast** $\Rightarrow$ robust code)
* `assert()` - breaks debug build at run time (**fail-late** $\Rightarrow$ fragile code)
* `REQUIRE(), ASSERT()` - fail the unit test (one assertion stops)
* `CHECK()` - fail the unit test but continue (checks many assertions)



## Substitution Failure Is Not An Error (SFINAE)

* Based on function **overloading**:
    * Find and consider **all available overloads.**
    * If type substitution **fails**, just drop it and do not complain, consider another
    * (fail hard if multiple overloads match)
* Function template parameters are substituted twice:
    * explicitly specified template arguments are substituted before template argument deduction
    * deduced arguments and the arguments obtained from the defaults are substituted after template argument deduction.

**Example**

```c++
template <typename C, typename Op, typename V = C::value_type> 	// default-computed
void algorithm(C&& c, Op&& fun = std::plus<V>{}) { // default-computed
	auto sum = V{0};
	auto i = std::begin(c), e = std::end(c);
	while (i!=e) sum = fun(sum, *i++);
}
auto vi = std::vector<int>{1,2,3,4};

algorithm<std::vector, std::plus<int>>(vi); // explicit

algorithm(vi, std::plus<int>{}); // deduced
```



### Narrow Overloading: SFINAE

* Enable through **return type**

```c++
template <typename StreamRef, typename Stream=std::remove_reference_t<StreamRef>>
enable_if_t<std::is_base_of_v<ostream, Stream>, void> dump(StreamRef&& os) {...}// only ostream derivatives
```

* Enable through (**anonymous**) **default typename**

```c++
template <typename StreamRef, 
					typename Stream=std::remove_reference_t<StreamRef>, 
					typename = std::enable_if_t<std::is_base_of_v<ostream, Stream>> // argument

void dump(StreamRef&& os) {...} // only derivatives
```



### SFINAE - Where

```c++
// In all types of the function signature:
template <typename T>
typename enable_if<cond, retType>::type fun();

// In all types of the template parameters:
template <typename C, typename V = typename C::value_type>
retType fun(C ..., V ...);

// In all expressions of the function signature:
template <typename T, int X>
RetType fun(T t, char(*)[X%2]=0);

// In all expressions of the template parameters:
template <typename C, typename = typename C::value_type>
retType fun();
```

* Only the failures in the *types* and *expressions* in the immediate context of the *function type* or *template parameter types* are SFINAE **errors**.
* Failures in side-effects such as instantiation of some template specialization, implicitly-defined member function generation, etc., are treated as **hard errors**.



### SFINAE Fails Softly When

* Instantiate a pack expansion containing multiple packs of different lengths
* Create array of: void, reference, function, abstract class types, negative or zero size
* Use a type that is not a class or enumeration on the left of a scope resolution operator `::`
* Use a member of a type, where:
    * the type **does not contain** the specified member
    * the specified member is **not a type** where a type is required
    * the specified member is **not a template** where a template is required
    * the specified member is **not a non-type** where a non-type is required
* Create a **pointer** to **reference**
* Create a **reference** to **void**
* Create pointer to member of T, where T is not a class type
* Give an invalid type to a non-type template parameter

For more see: <https://en.cppreference.com/w/cpp/language/sfinae>



## Template Specialization

* **Primary** template must be (at least) declared first

```c++
template <typename T>
class Vector; // class template declaration
//  Implementation can be omitted if never instantiated
```

* **Specializations** come after:

```c++
template <typename T>
class Vector<T*> { ... }; // specialized for any ptr
// Specialization must be defined before any usage.
```

* **More specialized** must come even later

```c++
template <>
class Vector<void*> { ... }; // complete specialization
```

* The **most specialized** is **preferred** over the others
* Functions cannot be **partially specialized**



### Complete Specialization

Customize implementation for concrete cases, e.g.:

```c++
template <typename T>
class Vector { ... }; 		// primary declaration

template <> 							// template with zero arguments
class Vector<bool> { 			// complete specialization
public: 									// implement compact storage of bits:
	struct ref { 						// nested inner class
		operator bool(); 			// read bit via conversion op
		ref& operator=(bool); // writing by via assign
	};
	ref operator[](int i) { return ref{i}; } // proxy
};

```

The result is a dependent template with zero arguments

### Partial Specialization

Uses deduction

```c++
template <> 					// template with zero arguments
class Vector<void*> { // complete specialization for void*
	void** data; ...
	void*& operator[](int i);
};

template <typename T> 											// template with arg T
class Vector<T*>: private Vector<void*> { 	// partial ⇒ deduction
	using Base = Vector<void*>; 							// type aliasing
	T*& operator[](int i) { 									// reuse Base:
		return reinterpret_cast<T*&>(Base::operator[](i));
	}
};
Vector<Widget*> vw; 		// uses partial spec. with T=Widget
```

Functions cannot be partially specialized

### Specialization and Overloading

```c++
template <typename T> 							// primary declaration
bool less(T a, T b) { return a<b; } // can be specialized

template <typename T>
void sort(Vector<T>& v) { // fn-template depends on less
	for (...) for (...)
		if (less(v[i], v[j]) 	// customizable
			swap(v[i], v[j]); 	// customizable
}
```

```c++
template <>
bool less<const char*>(const char* a, const char* b);

template <>
bool less(const char* a, const char* b); // T=const char*

// Overloaded function (does not depend on primary template):
bool less(const char* a, const char* b); // plain function
```



## Combine Class and Function Templates

