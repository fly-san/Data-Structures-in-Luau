# Data structures in luau

> Small compilation of data structures written in Luau

Ever wanted to use [structures](https://en.wikipedia.org/wiki/Data_structure) other than arrays or dictionaries in lua? Me neither. But often, using predefined data structures is faster to implement and ultimately saves precious time for programmers.

This module contains [object oriented](https://en.wikipedia.org/wiki/Object-oriented_programming) structures 

---

A proper documentation may be created at some point in the future.

- Data structures can be created by requiring its module, then calling it with the structure initialization arguments.

Example:
```lua
  local Queue = require(path/to/location)
  local q = Queue(5) -- Create queue with max size 5
  q:Enqueue("Hello, world!")
  q:Dequeue()
```

- Methods use PascalCase, e.g. `stack:Push(1)`
- Class functions use camelCase, as in `Stack.tostring(stack)`


Currently implemented:

### Stack

### Linked list

### Queue

### Circular queue (circular buffer, ring)

### Binary Heap

## License
This repository is available under the MIT license.