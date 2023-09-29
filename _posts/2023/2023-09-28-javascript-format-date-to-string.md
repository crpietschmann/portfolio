---
layout: post
blogengineid: 00000000-0000-0000-0000-000000000000
title: "JavaScript: Format Date to String"
date: 2023-09-28 18:00:00 -0500
comments: true
published: true
ai-generated: true
categories: ["JavaScript"]
tags: ["JavaScript", "js"]
---

JavaScript provides a versatile Date object that allows you to work with dates and times. One common task you might encounter is formatting a JavaScript Date object as a string. This can be especially useful when you want to display a date in a specific format or when interacting with date-based APIs that require a particular date format.

In this article, we will explore how to format a JavaScript Date object into a custom string format. We'll cover different aspects of date formatting and provide practical code examples to help you achieve this.

## The Problem

The problem is clear: you have a JavaScript Date object, and you want to convert it into a string using a custom date format, similar to what you might do in other programming languages like C# or .NET.

For example, you might want to format a date like this:

From: `Sat Sep 28 2023 14:30:00 GMT-0700 (Pacific Daylight Time)`

To: `2023-09-28`

## The Solution

JavaScript doesn't provide a built-in method to directly format a Date object with a custom string format like `yyyy-MM-dd` as in C#.

However, you can achieve this by following these steps:

1. Create a Date object: First, create a JavaScript Date object representing the date you want to format.
1. Define a formatting function: Create a function that takes the Date object and formats it according to your desired format. You can do this manually or use a library like date-fns or moment.js for more advanced formatting options.
1. Use the formatting function: Call the formatting function with your Date object as the argument to get the formatted date string.

Now, let's see how you can do this with practical examples.

### Example 1: A Formatting Function

To format a JavaScript `Date` to a string, you can write a custom function that does it so the code is reusable. Or, you can write a reusable function such as the one below that takes the `Date` object and a format string (like `yyyy/MM/dd` similar to that supported by C# / .NET date to string conversion) as inputs for how to format the Date as a string.

Here's an example Date to String conversion function that takes such an input:

```javascript
function formatDate (inputDate, format)  {
    if (!inputDate) return '';

    const padZero = (value) => (value < 10 ? `0${value}` : `${value}`);
    const parts = {
        yyyy: inputDate.getFullYear(),
        MM: padZero(inputDate.getMonth() + 1),
        dd: padZero(inputDate.getDate()),
        HH: padZero(inputDate.getHours()),
        mm: padZero(inputDate.getMinutes()),
        ss: padZero(inputDate.getSeconds()),
        tt: inputDate.getHours() < 12 ? 'AM' : 'PM'
    };

    return format.replace(/yyyy|MM|dd|HH|mm|ss|tt/g, (match) => parts[match]);
}
```

Then the usage of this function would be as follows:

```javascript
// output similar to "2023/09/28"
var dateString = formatDate(dateObject, 'yyyy/MM/dd');

// output similar to "2023/09/28 08:35:22 AM"
var dateString2 = formatDate(dateObject, 'yyyy/MM/dd HH:mm:ss tt');
```

### Example 2: Using date-fns Library

```javascript
const { format } = require('date-fns');

const myDate = new Date('2023-09-28');
const formattedDate = format(myDate, 'yyyy-MM-dd');

// Output: 2023-09-28
console.log(formattedDate); 
```

Here, we use the date-fns library to format the Date object according to the specified format string ('yyyy-MM-dd').

### Example 3: Using Intl.DateTimeFormat

```javascript
const options = { year: 'numeric', month: '2-digit', day: '2-digit' };
const myDate = new Date('2023-09-28');
const formatter = new Intl.DateTimeFormat('en-US', options);
const { format } = formatter.formatToParts(myDate);

// Output: 09/28/2023
console.log(format); 
```

In this example, we use `Intl.DateTimeFormat` to format the `Date` object based on locale-specific rules and options.

## Conclusion

Formatting a JavaScript Date object as a custom string is a common task in web development. While JavaScript doesn't provide a built-in method for this, you can achieve it easily by creating a formatting function or using libraries like `date-fns` or `Intl.DateTimeFormat`. Choose the method that best suits your project's requirements, and you'll be able to format dates in JavaScript with ease.
