# Basic Concepts

## Variables

Most programming languages will have some form of declaring variables. Variables are just named values. For instance, if your name is Sam, you could create a variable called "name" and "declare" it equal to "Sam". In Javascript, this would look like the following:

```javascript
const name = "Sam";
const age = 25;
```

The above code has a few things to notice. Firstly, Javascript is a "loosely typed" language. This means that you don't need to declare what kind of data up front will hold, Javascript will work it out for you. In other languages, such as Java (although the name is similar its a vastly different programming language), you would need to declare your variables like:

```java
String name = "Sam";
Integer age = 25;
```

This course will primarily focus on Javascript as thats where the majority of my experience lies and within the current market theres a substantial demand of developers with a strong understanding of it.

The second thing to notice is the `const` keyword. There are three possible keywords you can use to declare variables in Javascript. They are: `var`, `let` and `const`. The way they differ ties into another very important concept of Javascript which is referred to as the `scope`. It's a more complicated topic than is required for this section so for now, my advice is to use `const` when the value won't be reassigned or updated and `let` at all other times. For instance, the below code will break as you are attempting to redeclare a `const` variable:

```javascript
// WRONG - this will cause your code to throw an error (an Exception)
// You can not reassign a value to a declared const variable
const name = "Sam";
name = "Alex";
```

## Types of Variables

In Javascript, there are a few important variable types (known as `primitive` types). You've seen two, `String` (text) and `Number` but there are more.

*	Boolean
	*	Either `true` or `false`.
	*	No quotes needed.
	*	For example `const learningCurveIsAwesome = true`.
*	Null
	* Only one possible value: `null`.
	*	Null essentially means you're stating that the variable is "nothing".
	*	Its worth understanding how this differs from `undefined`. `null` to me means that the variable is defined but there is no result.
	*	For instance: `const spellingMistakes = null` means that the `spellingMistakes` variable has been defined but has "no value" ie `null`.
*	Undefined
	*	Only one possible value: `undefined`.
	*	This is another interesting quirk, `undefined` means that something has NOT been defined.
	*	Ironically, you can declare a variable and assign it to `undefined`. This does sound counterintuitive and in reality it is - how can something be defined as undefined? Surely defining it means its not undefined?
	*	<img src="mind-blown.gif" alt="mind-blown" />

### A Real World Example

To try to explain the different types, take a look at the following object:

```javascript
const person = {
	name: "Sam",
	age: 25,
	jobTitle: "Supreme Overlord",
	lineManager: null,
	nextPerformanceReview: undefined
};
```

From looking at this we can extract meaning from the data, both from the names of the properties but also the type of each property. You can see that both the `name` and `jobTitle` property are a `String` as they are quoted. The `age` property is a `Number` and finally we can see that `lineManager` is null and `nextPerformanceReview` is undefined.

This builds on what I was trying to explain before about them being similar but subtly different. If we assume that the `Supreme Overlord` job is the highest job that can be achieved, there wouldn't be a line manager for the person at the top. Therefore, setting the `lineManager` property to null makes sense - its defined but theres nothing to set it to.

However, `nextPerformanceReview` is undefined. From this we could assume that it CAN have a value but just hasn't been set yet and as such maybe makes more semantic sense being declared as `undefined`. I hope that makes sense!

## Non-Primitives

As per the real world, you can't model everything you'd want to just using primitives. How would you model a register? How would you model a person? A table?

Javascript has other types to handle these use cases. A list in the real world is called an `Array` in Javascript. The previous example of the different variable types used an `Object` to show how you could model a user record / a person. As Javascript is `loosely-typed` as mentioned previously, arrays can contain any kind of value even within the same array.

As an example, we could model a staff register as follows:

```javascript

const register = [
	{
		name: "Alex",
		role: "Software engineer"
	},
	{
		name: "Sam",
		role: "Software engineer"
	},
	{
		name: "Richard",
		role: "Janitor"
	}
];

```

This example combines all the previously mentioned types, it has an `Array` to model the list of staff members, it has an `Object` per staff member and each `Object` has two `String` properties of `name` and `role`. Using these variables you could effectively build up any representation of data.
