# Lambda Expressions



## Map of STL Algorithms

# Lambda Expressions



## Map of STL Algorithms

[The World Map of C++ STL Algorithms](https://www.fluentcpp.com/getthemap/)

![world map C++ STL algorithms](images/10-lambda/world_map_800.jpg)



[List of algorithms](https://people.cs.aau.dk/~marius/Teaching/SP2021/lambdas.pdf#page=23)



## Lambda

Lambda expression creates anonymous function object

```
[capture-list] (parameter-list) {statement-list}
```

Minimal lambda: `[] {}`

With return type:

```
[capture-list] (parameter-list) -> return-type {statement-list}
```



Lambdas without capture (stateless) are compatible with plain C functions

```c++
auto lambda = [](int i) -> int { return 42*i; } // precise type

using func_t = int(*)(int); 		// type of function-pointer
typedef int (*func_t)(int); 		// C version using typedef
func_t p_lambda = lambda; 			// type decay from lambda to function pointer
```



* Default capture by reference may lead to dangling references to destroyed scope.
* Default capture by values may lead to dangling pointers to destroyed scope (through **this**).
* Default capture by values does **not** capture **static variables**, but uses them by reference instead.
* Default capture is safe when used **locally**, but even then someone may copy-paste them into unsafe environment
* $\Rightarrow$ explicit capture forces to think, hence safer 



### Lambda Init

* Capture ownership (unique_ptr, future, thread)
  * `[ var = initExpr ] (...) {...}`
* Left of `=` is inner scope, right of `=` is outer scope

```c++
class Widget {
 bool isValidated() const;
 bool isArchived() const;
};
auto pw 	= std::make_unique<Widget>();
auto test = [pw = std::move(pw)] // reuse the "pw" name
 { return pw->isValidated() && pw->isArchived(); }
```

