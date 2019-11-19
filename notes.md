
## Syntax

### Should we switch to the Sean Barret syntax?

```
a : int = 0;
b := 0;

Value :: struct { ... }

factorial :: (n: int) -> int { ... }
```

**Pro:**

* It requires no keywords
* Allows for consistent syntax for all declarations

**Cons:**

* If we want patterns the grammar is no longer LL(1), but LL(\*)?
* It foreign and different.

### Methods

Do we want implicit receiver functions?

```
some_function(a, 12);
//vs
a.some_function(12);
```

**Pro:**

* It allows for implicit specification of the namespace (i.e. less typing)

**Cons:**

* Might encourage an inappropriate OOP style

It is important that types remain open for extension and it should
be possible to add new methods to a struct from another module.
How exactly to handle this with regards to namespacing is an open issue.

## Type system

### Which type conversions should coerced?

**C-style:**
* Integers coerce upwards and to floats
* Both integers and pointers coerce to bools


**Rust-style:**
* Only allows weakening and other small conversions
* Specifically no coercing between primitive types

We probably want something in between these?

## Module system

We might want to simplify the current Rust inspired module system to
something more akin to D or Go, i.e. not internal modules.

## Backend

* [SSA LIR Construction](https://pp.ipd.kit.edu/uploads/publikationen/braun13cc.pdf)
* [X86_64 Instruction selection](https://arxiv.org/pdf/1306.4898.pdf)
* [Register allocation](http://www.christianwimmer.at/Publications/Wimmer10a/Wimmer10a.pdf)
* [Linker](https://www.cs.cmu.edu/afs/cs/academic/class/15213-s13/www/lectures/12-linking.pdf)


# Todo lists

## 0.1 Milestone

* Module search path
* Struct initializers
* Generics
* Method calls
* Lexical order independence
* Operator overloading
* Interface/protocol/trait
* Type inference
* Iterators
* Multi-line comments
* stdlib
  * Arrays
  * HashMap
  * Any
  * Strings


## Future milestones

* Defer
* Match
* Tuples
* Closures
* Dynamic compilation
* RTTI / reflection
* Query based driver
* stdlib
  * Fibers
  * Build system
