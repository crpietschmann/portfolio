---
layout: post
blogengineid: 00000000-0000-0000-0000-000000000000
title: "Basics of JavaScript Class Inheritance"
date: 2020-01-02 17:18:00 -0500
comments: true
published: true
categories: ["JavaScript"]
tags: ["js", "JavaScript", "Tips", "object", "inheritance", "class"]
---

The ECMAScript 2015 definition brought with it the introduction of `class` syntax within the JavaScript language. Previously the only way to do this was with TypeScript or some other language that would transpile down to JavaScript code. With ECMAScript 2015, you can now declare and use classes directly in the JavaScript language itself. Plus, this is a feature that is supported by all the modern web browsers too!

Previously the way to do Object Oriented Programming (OOP) in JavaScript was to use Prototypal Inheritance. This made use of the `object.prototype` property to do inheritance in a way that's different than most other object oriented languages; such as C# or Java. With the addition of being able to define and use Classes in JavaScript, you can now do object oriented programming in JavaScript using the method we've all become accustomed to with other OOP languages.

> **Browser Support**: JavaScript `class` inheritance is supported by all modern web browsers; like Chrome, FireFox, and Safari. However, be aware that older browser versions, and Internet Explorer do not support this.

## Define a `class` in JavaScript

A `class` definition in JavaScript is used to define a class with its `constructor`, as well as it's properties and methods. This is done in JavaScript very similarly to how it's done in other OOP languages; like C# and Java.

Here is a simple example definition of a `Person` Class:

```javascript
class Person {
    constructor(first, last) {
        this.firstName = first;
        this.lastName = last;
    }

    getFullName() {
        return this.firstName + ' ' + this.lastName;
    }
}
```

The `class` keyword is used to define the Class in JavaScript. Then within the `Person` class there is a `constructor` method defines, as well as any other features of the class.

Notice the `constructor` method within the `class` definition. This is a Constructor method that will be executed every time an instance of the class in instantiated. The Constructor can also be defined to accept anywhere from zero to many parameters so that the class can be passed initial state upon instantiation.

Notice the `getFullName()` method declaration within the `class` definition. This is showing an example of how to define a function on the class. This function will later be able to be called on any objects created from the class.

Within the `constructor` there are two properties on the class being set; the `firstName` and `lastName` properties. Notice these properties have no property definition within the `class` as would be done in other languages; like C# or Java. The reason there is no property definition is because JavaScript is a Dynamic language. This means that setting a property on the object will in turn create it if it doesn't exist. You are likely very familiar with this as it's a core piece of how the JavaScript language works, and you've likely seen / done this many times already.

## Instantiate an Object from a `class`

Now that you have a `class` defined within JavaScript, you can use the `new` keyword to easily create a new instance of it.

Here's an example of doing this:

```javascript
var p = new Person('Chris', 'Pietschmann')
```

Notice we are passing in values for the parameters defined on the `constructor` method of the class.

After the object has been instantiated from the `class`, you can work with it in the normal fashion you are familiar with other objects and libraries you've used in JavaScript:

Here's an example of setting a property and calling a method on the object instance:

```javascript
// set property
p.firstName = 'Christopher';

// call method
var fullName = p.getFullName();
```

## Class Inheritance in JavaScript

Once you have a `class` in JavaScript, you can easily create other classes that inherit from this class. Defining these 'subclasses' is done by using the `extends` keyword to tell JavaScript your new `class` is to inherit from a particular base class.

Here's an example of a `Teacher` subclass that inherits from `Person`:

```javascript
class Teacher extends Person {
    constructor(first, last, grade) {
        // call the base class constructor
        super(first, last);

        this.grade = grade;
    }
}
```

As you can see, the `extends` keyword is used to tell JavaScript that the `Teacher` class is to inherit from the `Person` class. This means that the constructor, properties and method of the "super" base class are available to the subclass.

Notice that the `Teacher` class implements its own `constructor` method. This is so you can instantiate an instance of this class and pass it any necessary parameters / state to start with. Within the subclass Constructor, it first calls the `super()` method. The `super()` method is going to refer to the base class `constructor` method. When instantiating a subclass, you need to call the `super()` method and pass it any necessary parameters the base class is expected. This will not only instantiate the object as you're expecting, but the `super()` method also must be used to properly initialize the `this` keyword for the newly-allocated object. By calling `super()` within the `constructor`, the `this` keyword will be setup as a reference to the newly created object. This is not something that is automatically initialized for the class by using the `extends` keyword.

> **Tip**: By calling `super()` within the `constructor`, the `this` keyword will be setup as a reference to the newly created object. This is not something that is automatically initialized for the class by using the `extends` keyword.

This `Teacher` class example is extending the `Person` base class with an additional `grade` property. You can call this property, or any other defined methods on the subclass, just as you would properties or methods of the base class.

Here's an example of instantiating the `Teacher` class and calling its properties and methods:

```javascript
// instantiate the object
var t = new Teacher('Chris', 'Pietschmann', 'Third Grade');

// set properties
t.firstName = 'Christopher';
t.grade = 'Fourth Grade';

// call method from base class
var fullName = t.getFullName();
```

## Override Base Class Methods within Subclass

With Object Oriented Programming (OOP) there are times when you need to override the functionality of a base class. You may need to extend, or even replace, the base class functionality. The `class` inheritance of JavaScript as defined by ECMAScript 2015 allows this to be done easily, and similarly to how it's done in other OOP languages; like C# or Java.

Here's an example of the above `Teacher` subclass that overrides the `getFullName` method of the `Person` base class:

```javascript
class Teacher extends Person {
    constructor(first, last, grade) {
        // call the base class constructor
        super(first, last);

        this.grade = grade;
    }

    getFullName() {
        return this.firstName + ' ' + this.lastName + ' (' + this.grade + ')';
    }
}
```

As you can see, this override example of the `getFullName` method, is completely replacing it with a new method definition. When the `getFullName` method is called on the `Teacher` objects, this definition will be executed, and the base class definition will no longer be executed.

## Extend Base Class Methods within Subclass

There are times when the base class method provide functionality that's close to what you need in the base class, or maybe it provides a useful function for the base class. At these times, it's useful to be able to call the base class method from the subclass while still overriding / replacing the base class method with the same name.

To do this you can call the base class method using the `super` keyword within the subclass method. Here's an example, similar to the previous one, that overrides the base class `getFullName` method while calling the base class method as well:

```javascript
class Teacher extends Person {
    constructor(first, last, grade) {
        // call the base class constructor
        super(first, last);

        this.grade = grade;
    }

    getFullName() {
        return super.getFullName() + ' (' + this.grade + ')';
    }
}
```

As you can see, by calling the base class method as made available through the `super` keyword within the subclass method, you can both override the base class method and utilize its functionality at the same time.

## Wrap Up

The Prototypal Inheritance of JavaScript was a little complex to get used to when coming from a greater familiarity with the Class Inheritance used in other popular Object Oriented Programming (OOP) languages; like C# or Java. The addition of Class Inheritance (via the `class` and `extends` keywords) in JavaScript brings with it a more familiar approach to instantiating objects and setting up subclass inheritance. Also, with this feature being supported by all of the modern browsers, there's no reason you couldn't start using `class` inheritance today within your JavaScript projects. Although, keep in mind that existing code bases likely will still use `prototype` inheritance for some time, so having a basic familiarity with Prototypal Inheritance may still be useful.

P.S. The basics of JavaScript class inheritance outlined in this article should get you going with these features nicely. But, keep in mind there are also additional features of JavaScript classes like Getters and Setters that can be used with `class` inheritance too.
