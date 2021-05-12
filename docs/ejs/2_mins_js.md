# JavaScript in 2 minutes

**Value vs reference**

- In JavaScript:
	- All primitive values are passed by value
		- `undefined`, `Boolean`, `String` etc.
	- All non-primitive types are passed by reference
		- `Object`, `Function` etc.

**Higher order functions**

- HOF function return other function
- HOF function accepts a function as its parameter

**Static vs dynamic typing**

- JavaScript - dynamically typed language
	- All type checks are performed in a runtime
	- You can assign anything you want to a variable and it will work
- TypeScript - statically typed language
	- All type checks are performed during compile/build process before we actually execute our program

**Object-oriented programming**

- OOP is an agreement describing how you can write programs
- Classes - boilerplate for objects
- Objects - actual containers for the data
- Methods - operators over data in these objects

**Inheritance**

- A way to modify or extend parent class in child class

**Polymorphism**

- Ability to use objects of different types, providing them the same interface

**Encapsulation**

1. Mechanism used to restrict access to some of an object's properties
	- Creating private properties
	- There are no private properties in JavaScript (there is a proposal tho)
2. Mechanism that allows data access only via related methods or functions
	- Setters and getters

**this**

- `this` keyword is referencing the current execution context
- `this` in a global context: `window` (Browser) / Global objects (Node.js)
- Arrow functions are different - they always refer to enclosing `this`
- As for the class context, `this` refers object itself

**Promises**

- `Promise` is an object which represents the current state and the value of the operation
- There are 3 states for Promises: *pending*, *success*, *failure*

**Source:** [Dev.to](https://dev.to/)
