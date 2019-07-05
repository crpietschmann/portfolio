---
layout: post
blogengineid: 24c0d0bb-d83d-4c36-a75d-1cfe1405f9e6
title: "Basic Comparison of Functions in C# and Apple Swift Programming Language"
date: 2014-06-07 13:01:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["C#", "Swift"]
redirect_from: 
  - /post/2014/06/07/Basic-Comparison-of-Functions-in-C-and-Apple-Swift-Programming-Language
  - /post/2014/06/07/basic-comparison-of-functions-in-c-and-apple-swift-programming-language
  - /post.aspx?id=24c0d0bb-d83d-4c36-a75d-1cfe1405f9e6
---
<!-- more -->

Previously I wrote a <a href="/post/2014/06/07/Basic-Comparison-of-C-and-Apple-Swift-Programming-Language-Syntax">basic comparison of the C# and Apple Swift programming language syntax</a>. In this article we'll dive a little deeper into a comparison in to how defining and calling Functions work in both. Functions are first class citizens in both C# and Apple Swift, so lets see how they compare against each other!
<h3>Define Basic Parameterless Function</h3>

At the most basic level there really aren't many differences between the 2 languages as you can see below. Even the way you return a value from a Function uses the "return" keyword in both languages.

```csharp
// Parameterless Without Return Value
// C#
void sayHello() {
    // do something
}

// Swift
func sayHello() {
    // do something
}


// Parameterless With Return Value
// C#
string sayHello() {
    return "Hello!";
}

// Swift
func sayHello() -> String {
    return "Hello!"
}


// Calling Parameterless with Return Value
// C#
var message = sayHello();

// Swift
var message = sayHello()
```

One key difference above is where the return value gets specified in Swift (after the function name) and in C# (before the function name.)

## Define Function with Parameters

Now let's get a little more complex with adding some parameters to the above example.

```csharp
// Single Parameter
// C#
string sayHello(string name) {
    // do something
}

// Swift
func sayHello(name: String) -> String {
    // do something
}


// Multiple Parameters
// C#
string sayHello(string name, int age) {
    // do something
}

// Swift
func sayHello(name: String, age: Int) -> String {
    // do something
}
```

As you can see the key difference in specifying parameters is that in Swift the Type is specified after the parameter name, and in C# it's before.

## Multiple Return Values

Multiple return values is a feature in Swift that is rather interesting (as compared to C#) since C# only support single return values; unless you use a Struct or Class to encapsulate multiple into a single return value.

```csharp
// Multiple Return Values
// C# - using a Struct
struct Person {
    public string firstName;
    public string lastName;
}

Person getPerson() {
    return new Person {
        firstName = "Bill",
        lastName = "Gates"
    };
}


// Swift
func getPerson() -> (firstName: String, lastName: String) {
    return ("Steve", "Jobs")
}


// Calling the above functions
// C#
var p = getPerson();
var fName = p.firstName;
var lName = p.lastName;

// Swift
let p = getPerson()
var fname = p.firstName
var lname = p.lastName
```

Easily seen in the above example is that Swift is much simpler to return complex results from a Function that require multiple return values without the need to declare a special Struct or Class to faciliate it.

## Function Parameter Name Alias

Swift provides a mechanism for defining different parameter names for use within the function than by the calling function. This is something that C# does not support.

```csharp
// External Parameter Names
// C#
// no equivalent exists

// Swift
func combineName(firstName first: String, lastName last: String) {
    // accessing the parameters can be done by referencing
    // "first" and "last" respectively
    return first + " " + last;
}

// Calling With External Parameter Names
// Swift
var fullName = combineName(firstName: "Steve", lastName: "Wozniak")
```

## Defining Default Parameter Values

Both languages provide methods of defining default parameter values and allowing what's referred to in C# as Optional Parameters.

```csharp
// Default Parameter Value
// C#
string combineName(string firstName, string lastName, string separator = " ") {
    return firstName + separator + lastName;
}

// Swift
func combineName(firstName: String, lastName: String, separator: String = " ") {
    return firstName + separator + lastName
}

// Call the above Function
// C#
var fullName = combineName("Leo", "Laporte");
// returns "Leo Laporte"

var fullName = combineName("Leo", "Laporte", "-");
// returns "Leo-Laporte"

// Swift
var fullName = combineName("Leo", "Laporte")
// returns "Leo Laporte"

var fullName = combineName("Leo", "Laporte", separator: "-")
// returns "Leo-Laporte"

// Specify All Parameters By Name
// C#
var fullName = combineName(
    firstName: "Leo",
    lastName: "Laporte",
    parameter: "-"
);

// Swift
var fullName = combineName(
    firstName: "Leo",
    lastName: "Laporte",
    parameter: "-"
)
```

## Variadic Parameters

Or, commonly referred to in C# as "variable number of parameters." This essentially allows you to (as the developer) pass in multiple values to a Function without needing to create an Array to contain them as using this method will trigger the compiler to do that for you.

```csharp
// Variadic Parameters
// C#
int add(params int[] numbers) {
    var total = 0;
    foreach(var i in numbers) {
        total += i;
    }
    return total;
}

// Swift
func add(numbers: Int...) -> Int {
    var total = 0
    for i in numbers {
        total += i
    }
    return total
}

// Calling the Above Function
// C#
var total = add(20, 22);
// returns 42

// Swift
var total = add(10, 13, 6, 3, 5, 2, 3)
// returns 42
```

## In-Out Parameters

Both languages provide methods of telling the compiler that a Function can modify the variable passed in as a parameter. This may remind you of Output Parameters in C#, but that is only 1 way; output. What the In-Out Parameter feature of Swift does is allow you to pass in a value and modify it; while passing the value through the Function back to the variable that it originated in. In C# this can be performed by passing parameter values in by reference.

```csharp
// In-Out Parameters
// C#
void swap(ref int a, ref int b) {
    var c = a;
    a = b;
    b = c;
}

// Swift
func swap(inout a: Int, inout b: Int) {
    let c = a
    a = b
    b = c
}


// Calling the Above Function
// C#
var a = 1;
var b = 2;
swap(ref a, ref b);

// Swift
var a = 1
var b = 2
swap(&a, &b)
```

It is worth noting that in neither language allows for In-Out parameters to have default values.

## Function Types

Here comes the Functional aspects of the languages! They both allow for Functions to be variables and for those variables to be passed in other Functions as parameters.

```csharp
// Declare Functions
// C#
// no return value
void doSomething(string name) {
    // do something
}

// with return value
int add(int a, int b) {
    return a + b;
}

// Swift
// no return value
func doSomething(name: String) {
    // do something
}

// with return value
func add(a: Int, b: Int) -> Int {
    return a + b
}


// Using Function Type
// C#
// no return value
Action<string> process = doSomething;
process("Alan");

// with return value
Func<int, int, int> doMath = add;
var total = add(19, 23);

// Swift
// no return value
var process: (String) = doSomething
process("Alan")

// with return value
var doMath: (Int, Int) -> Int = add
var total = doMath(19, 23)
```

Declaring function types in Swift is a little more like the standard Function definition; as apposed to the C# style of utilizing the `Func<>` and `Action<>` generic types.
## Passing a Function as a Parameter

Since a Function is just another Type in both languages it can then be passed in to another Function as a parameter.

```csharp
// Declare Functions
// C#
int doMath(int a, int b, Func<int, int, int> operation) {
    return operation(a, b);
}

// Swift
func doMath(a: Int, b: Int, operation: (Int, Int) -> Int) {
    return operation(a, b)
}


// Functions as Parameters
// using the "add" function from the previous example
// C#
var total = doMath(1, 2, add);

// Swift
var total = doMath(1, 2, add)
```

This is probably the most obvious feature of C# that allows for LINQ and all it's niceties to work. Now let's look at how C# Lambda Expressions can be used as parameters and how it compares to Swift.

```csharp
// Functions as Parameters
// using "Lambda Expressions"
// C#
var total = doMath(2, 21, (a, b) => a * b);

// Swift
func multiply (a: Int, a: Int) -> Int {
    return a * b
}
var toal = doMath(21, 2, multiply)
```

## Nested Functions

Functions can be nested within other Functions, as eluded to in the previous example about Function Parameters, in both languages.

```csharp
// Nested Functions
// C#
int doSomething(int a, int b) {
    var add = new Func<int, int, int>(
        (first, second) => {
            return first + second;
        }
    );
    return add(a, b);
}

// Swift
func doSomething(a: Int, b: Int) -> Int {
    func add(first: Int, second: Int) -> Int {
        return first + second
    }
    return add(a, b)
}
```

## Function As Return Type

Since Functions can be passed around as variables and parameters, then the obvious next step is that Functions can also be passed out of Functions as their return value.

```csharp
// Function as Return Type
// C#
void positiveAction(int i) {
    // do something
}
void negativeAction(int i) {
    // do something
}
Action<int> chooseAction(int i) {
    if (i > 0) {
        return positiveAction;
    }
    return negativeAction;
}

// Swift
func positiveAction(i: Int) {
    // do something
}
func negativeAction(i: Int) {
    // do something
}
func chooseAction(i: Int) -> (Int) {
    if (i > 0) {
        return positiveAction
    }
    return negativeAction
}

// Function Return Type Usage
// C#
var number = 5;
var action = chooseAction(number);
action(number);

// Swift
var number = 5
var action = chooseAction(number)
action(number)
```

## Access Modifiers

It's worth mentioning that the current beta release of the Apple Swift programming language does not include support for Access Modifiers. Access Modifiers are what allow you to declare Functions, Properties and Members as being Private, Public, etc. Currently all things defined in Swift are accessible relative to their scoping; although different than C# it is exactly how things work in JavaScript. This may change in a future release of the language; perhaps that was a compiler feature that wasn't quite stable enough for this first release of the language. Or, perhaps they want the functional constructs and protocols (Swift's version of Interfaces) to be used to "hide" things as necessary instead of implementing these. This may perhaps remain a fundamental difference between the paradigms that govern the use of the two languages.

## Conclusion

As we've seen thus far, the basic syntax of the languages are really similar, and both are Functional languages. However what is apparent from the syntax differences, when it comes to Functions, it's clear that Swift was meant to be functional from the start, where C# had Functional constructs added on top after its creation.

**Previous Post in Series: <a href="/post/2014/06/07/Basic-Comparison-of-C-and-Apple-Swift-Programming-Language-Syntax">Basic Comparison of C# and Swift Language Syntax</a>**
