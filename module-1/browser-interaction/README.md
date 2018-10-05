# How does your browser show things to you?

The browser works with "documents". You request a domain or IP, it is resolved to a location, that location handles the request and returns a "response". If the response data is in a format that the browser recognises, it performs the necessary actions in order to display it to you. For our use case, I'm going to assume that the response is a HTML file.

Imagine that the web server that is handling your request responds with the following:

```html
<html>
	<head>
		<title>Your First Webpage</title>
		<link rel="stylesheet" type="text/css" href="styles.css">
		<script src="important_stuff.js"></script>
	</head>
	<body>
		<main id="container" >
			<h1>Hello World!</h1>
		</main>
		<script src="this_can_happen_later.js"></script>
	</body>
</html>
```

Firstly, it will "parse" the document. Parsing is just a technical word for "reading and breaking it down". Parsing will start at the top and will "traverse" over the contents. With the above example, it will read the `<html>` element, step down to the next line, read the `<head>` element, then the `<title>` element and so on.

There are some important performance considerations to be aware of here. When building a website, one of the most important things to try and achieve is getting the content of your site displayed and usable in the user's browser as fast as possible. Your website could be the most incredible site in the world, with ground breaking news or content but if it takes too long to load and display - the user is not going to stick around. There is a famous study by Amazon that discovered that if Amazon's website took just ONE second longer to respond, it cost Amazon $1.6 BILLION in lost sales - [article here](https://www.fastcompany.com/1825005/how-one-second-could-cost-amazon-16-billion-sales).

With the way the example HTML page is structured, the browser will see that within the `<head>` element, there is a `<link>` element pointing to an external CSS file and a `<script>` element pointing to a separate javascript file. The way the browser works is once its found those elements, it attempts to fetch those resources and DOES NOT continue on (technical term - `blocks` as in "it blocks the page rendering") until they have been retrieved.

So the process can be broken down to something similar to:

1)	Fetch document
1)	Wait
1)	Parse document
	1) Parse head element
	1)	Retrieve `styles.css` file
	1)	Wait
	1)	Parse `styles.css` file
	1)	Wait
	1)	Retrieve `important_stuff.js` file
	1)	Wait
	1)	Parse `important_stuff.js` file
	1)	Parse body
	1)	Render the "container" element and the `<h1>`
	1)	Retrieve `this_can_happen_later.js` file
	1)	Wait
	1)	Parse `this_can_happen_later.js` file

Now, you can see that with how the page is structured it could be a while (in web terms) before your user even gets to see any of the content (depending on how large your CSS / JS files are and how speedily they're served up)! There are ways to solve this, for example if the amount of CSS is pretty small we could just embed it directly in the HTML file. This would be quicker as the browser can skip the `Retrieve styles.css file` step and the following wait BUT it does add to the size of the HTML file. You could instruct the browser to load the resources in a way that doesn't block the rendering (add an `async` property to the respective resource elements). This is something you'll have to play with and experience yourself, there isn't an always right answer to this.

If you look carefully, you can see another Javascript file is referenced at the end of the `<body>`. This is a very common pattern as it allows everything critical (such as page content) to be parsed and rendered before attempting to fetch this resource. Imagine the scenario that this file contains some javascript to show flashy tooltips - its not a central feature, its a nice to have, meaning the last thing we want is to have to wait for this before showing the user any content! By placing it at the end of the body after any content, we're telling the browser to load it afterwards.

## The DOM Tree

As the HTML document is parsed, the browser builds whats called the "DOM Tree" - referenced to as the [DOM](../../GLOSSARY.md#dom). If you imagine the HTML document as a family tree, each element is inspected for elements inside it which become child "nodes" which in turn are inspected for any children. In this way the browser can follow the tree to quickly know where an element lives and what its parent / descendant elements are.

The DOM tree is central to performance and development within the browser, it allows developers to interface with the document easily and quickly. For instance, the following Javascript code will use the DOM to find specific elements by their class:

```
const myHeadings = document.querySelectorAll('.my-heading-class')
```

Now imagine if there wasn't such a thing as the DOM tree, in order to find an element you'd have to look at the HTML code and then try to detect where a class was referenced and then attempt to find the enclosing HTML tags... it'd be a nightmare to perform even the simplest operations. Any time you're interacting with the document, either via Javascript or CSS - you're working with the DOM.

