# Introduction

* Goal of C++:
    * *Programs almost as efficient as assembler/machine code, but as elegantly abstract as one wishes*
    * *Stroustrup: “C++ is a language for developing and using elegant and efficient abstractions”*

* C++ is **core C++** plus **standard library** developed in C++

* Defining a new type is the most **fundamental** programming activity in C++
    * A well-designed new type differs from a build in type only in the way it is defined, not in the way it is used!
    * Library – a collection of user defined types



### Types of Memory

Three fundamental types of memory:

* **Static memory**
    * Pre-allocated when program is loaded
        * In global scope ore given with `static` keyword
* **Stack** - in local or statement scope
    * small/cheap
    * deallocated when goes out of scope
* **Dynamic memory (free store)**
    * large/more expensive
    * Allocated and deallocated with `new` and `delete` operators



```c++
int c_arr[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
int main()
{
    vector<int> vec = {1, 2, 3, 4, 5, 6, 7, 8, 9};
    vector<int>* vecd = new vector<int>{1, 2, 3, 4, 5, 6, 7, 8};
    ...
      for (auto i : c_arr) cout << i << " ";
    …
      delete vecd;
    return 0;
}
```

```c++
int main()
{
    static int c_arr[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    vector<int> vec = {1, 2, 3, 4, 5, 6, 7, 8, 9};
    vector<int>* vecd = new vector<int>{1, 2, 3, 4, 5, 6, 7, 8};
    ...
      for (auto i : c_arr) cout << i << " ";
    …
      delete vecd;
    return 0;
}
```



### Pointers and References

* A **pointer** `*`  can point to any object in memory or have a special value `nullptr`
    * Typed or `void*`
    * If typed, defines pointer arithmetic and can be dereferenced
* In C, function parameters are passed **by value**, but pointers can be used
* C++ **reference** `&`
    * A different name for an object, must be initialized



### C Arrays

* Indexed from 0 to *n*-1
* A name of the array is a (constant) pointer to the first element
    * `a[j]==*(&a[0] + j) == *(a + j)`

