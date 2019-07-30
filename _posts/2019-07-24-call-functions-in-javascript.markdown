---
layout: post
blogengineid: 00000000-0000-0000-0000-000000000000
title: "Call Functions in JavaScript"
date: 2019-07-24 10:21:00 -0500
comments: true
published: true
categories: ["JavaScript"]
tags: ["Tips", "JavaScript", "js", "functions"]
---

One of the fundamental tasks with JavaScript is how to write and call functions in your code. This may seem like a simple thing, and it essentially is, however there are a few tips and tricks you can use to help making your use of JavaScript Functions easier and more intuitive. This article takes you through the basics of calling functions in your code, and some more advanced tips and tricks to writing better JavaScript functions that can help take your JavaScript coding to the next level.

## How to call a function in JavaScript

Calling a function (aka method) in JavaScript is similar to any other programming language that uses a C-like syntax. Simply call the function by name, then pass in any required parameters in a comma delimited list enclosed in parenthesis.

To put this in a great example that can be easily visualized, let's take the following `sayHello` function that accepts a parameter named `name` of type string:

```javascript
function sayHello(name) {
    // implementation code here
}
```

To call this function, you simply call it directly by name, then pass in the parameter value:

```javascript
sayHello("Chris");
```

Now, if you have a function you need to call that doesn't have any parameters, you can call it similarly. A function without any parameters can be called by omitting any parameters, and call it the same way:

```javascript
sayHello();
```

If the function accepts multiple parameters, then you can call it similarly with all the parameter values as a comma delimited list:

```javascript
sayHello("Chris", "Pietschmann", 42);
```

This previous example accepts three parameters. The first two are string values, while the third parameter accepts a number.

{% include embedad.html %}

## Call a JavaScript function with return value

While parameters are used to pass one or more values into a JavaScript function, you can use a return value to pass a value out of the function as well. The function can use the `return` statement to exit and pass some value back to the caller when it's completed execution.

Here's an example of a JavaScript function with a return value:

```javascript
function multiply(a, b) {
    // simple example that multiplies two numbers
    var c = a * b;
    return c;
}
```

This function can be called using the same method as any other function. By just calling it the same way, you will simply ignore the return value, and move on.

```javascript
// call function and ignore return value
multiply(6, 7);
```

If you need to capture the return value from the function, then you can assign it's result to a variable. The variable will then contain the value returned from the function after execution.

```javascript
var c = multiply(6, 7);
```

Once the return value has been captured into a variable, that variable can then be used like any other variable. You can consume it's value directly in this code for something, or even pass it as a parameter to another function.

If the return value of a function is only going to be used as an input parameter of another function, you can pass the return value directly to the function parameter. This is done by putting the function call in the parameters list of the other function call, just like you would a variable.

Here's an example of passing a variable as a parameter to a function call, and another that passes the return value of a function directly to the parameters of another function:

```javascript
// pass return value as parameter to another function call
var c = multiply(6, 7);
var d = multiply(c, 8);

// pass return value directly as parameter to another function call
var d = multiply(multiply(6, 7), 8);
// here's the same broken out to multiple lines for readability
var d = multiply(
    multiply(6, 7),
    9
);
```

## Passing Functions as Parameters

JavaScript is a functional programming language. This means that functions are variables too. As a result, you can pass functions around as parameters to other functions too. This offers some great flexibility benefits for code reuse, recursion, and other functional programming benefits.

Here's an example of passing a function as a parameter to another function that builds on the above `multiply(a,b)` function examples:

```javascript
// function that accepts a function as an input parameter
function doMath(operation, a, b) {
    // call the parameter function
    // and return the result
    return operation(a, b);
}

// let's call this function
var c = doMath(multiply, 6, 7);
```

## JavaScript Object Methods

Getting a little more object oriented (full JavaScript OOP is discussion for another article), you can have a JavaScript object with it's own properties and methods. These methods are functions too. The reside on the object, and when called directly have access to the object using the `this` keyword. The `this` keyword can be used to reference the object and it's properties.

Here's an example of defining a JavaScript object that has some properties and methods:

```javascript
// object definition
var author = {
    firstName: "Chris",
    lastName: "Pietschmann",
    favoriteNumber: 2063,

    getFullName: function () {
        return this.firstName + " " + this.lastName;
    }
};

// call the getFullName method on the object
var fullName = author.getFullName();
// return value is "Chris Pietschmann"
```

## Invoke JavaScript Functions using the `call()` method

If you have a JavaScript object that has it's own properties and methods, you can call also call those methods using the `call()` method. The `call()` method enables you to call a function by passing in the context for the `this` keyword within the function, and any required parameters. This enables you to scope the `this` keyword for the method to reference the object.

Here's an example of using the `call()` method to call the `getFullName` method of the above `author` object:

```javascript
var fullName = author.getFullName.call(author);
```

Here's an example of defining a new function that doesn't exist as a method of the object, then calling it with the context of the `this` keyword to the object.

```javascript
function doubleFavoriteNumber() {
    return this.favoriteNumber * 2;
}

var a = doubleFavoriteNumber.call(author);
```

The `call()` method accepts the `this` context to call the method with, in addition to any parameters needed for that function. You can pass these parameters to the function by appending these parameter values to the parameters list sent to the `call()` method.

Here's another example that accepts a parameter value:

```javascript
function doubleFavoriteNumber(n) {
    return this.favoriteNumber * n;
}

var a = doubleFavoriteNumber.call(author, 2);
```

## Function as Return Value of Function

This may sound confusing at first. A JavaScript function can be passed as a return value from another function. This can lead to some more advanced scenarios, and is useful to know is possible. Especially if you're consuming a JavaScript library or NPM package that has methods / functions that return functions as a result to be consumed later.

Here's an example of a function definition that returns a function as the return value from the function itself:

```javascript
function getFullName(fName, lName) {
    return function () {
        return fName + " " + lName;
    }
}

// call the function
var func = getFullName("Chris", "Pietschmann");
```

Now calling this function will return a function, not any other type of value. The previous example doesn't return `"Chris Pietschmann"`, but rather a function can when called will return that. You can then call this function when needed to generate that value;

Now, let's call the function that was returned from the other function to get the final result returned:

```javascript
var fullname = func();
```

## Conclusion

Calling JavaScript functions is simple at first, but you can see there are a number of functional programming techniques that can be used. When you better understand that a JavaScript Function is an object, similar to strings and numbers, then you have the knowledge to write better JavaScript code.

Obviously these techniques help if you're writing a new JavaScript libarary, framework, or NPM package. However, knowing these techniques will also help you to better consume other libraries, frameworks, and NPM packages in your own code.

Happy scripting!
