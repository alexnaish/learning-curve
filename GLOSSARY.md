# Glossary

### API

Application programming interface. Depending on the context of how its used, it can either reference the exposed functionality of a library / module or it can refer to an external application / service. In the first case, if a module exposes an object with one function then its "public API" is that - an object with one function exposed for use. It may however use several other functions but since its not exposed its not part of the "API".

People often refer to "the API" - in this case it refers to another service that an application can interact with via that service's exposed functionality. For instance, Youtube may have a service that allows other developers to search for results on youtube without exposing anything about how Youtube's systems work internally.

### CD

Continuous delivery. The practice of releasing your code to the world (production) in short cycles, often soon after pushing to source control and running your tests. It is automated and doesn't need any human interaction (after the initial trigger).

### CI

Continuous integration. The practice of integrating code into a shared repository as often as possible (often several times a day). Each code check-in will automatically trigger the relevant checks and tests allowing issues to be caught earlier.

### CSS

Cascading Style Sheets. Describes how the HTML in a webpage should be presented.

### DOM

Document Object Model. Represents a document (such as a web page or XML file) as nodes and objects. Often used when referring to the "DOM Tree". A simple webpage would start at the document level, then the "tree" would branch into "head" and "body" then each of those would branch into the HTML elements inside of each and they would then split based on the elements inside them until the element in question doesn't have any more elements inside it. This allows the browser to "walk the tree" and understand how a document is structured.

### DNS

Domain Name Server. Holds the addresses of site domain names. An example would be asking for the location of www.google.co.uk and receiving some kind of IP address.

### GUI

Graphical User Interface. A program that allows point and click interactivity. When you're browsing the internet, you're using a GUI. When you're looking through folders on your computer, unless you're using your terminal - you're using a GUI.

### HTML

Hypertext Markup Language. The most commonly used programming language for creating web pages and web applications.

### HTTP

Hypertext Transfer Protocol. Defines a set of rules that allows clients and servers to communicate. Your web browser will use HTTP to request the contents of a website.

### HTTPS

Hypertext Transfer Protocol Secure. The encrypted version of HTTP.

### IoT

The "Internet of Things". A general buzzword for internet connected devices such as thermostats etc.

### IP

Internet Protocol. Defines how data should be transmitted across a network.

### REST

Representational State Transfer. Don't worry about the full definition, it's really only ever referred to as "rest". REST is a style of designing and application so that the HTTP verbs match up against actions of your application objects. For instance, a HTTP "GET" request will be a "fetch" operation in your application whereas a "POST" will be a "create" operation.

### SSH

Secure shell. A network protocol allowing networking services over a (often unsecure) network. The most common example of this is to remotely login to a server. Since you don't have physical access to sit down next to most servers, you need some way of accessing it if you need to perform operations on it. This is where you'll use SSH to connect.

Example command: `ssh alex@example.server.com`. This would allow the user `alex` to attempt to connect to the server at `example.server.com`.

### URL

Uniform Resource Locator. Formed of a protocol (`HTTP` for example), the domain name and a file path. For example: `http://my.example.com/home.html` contains the protocol prefix of `http://`, the `subdomain` of `my`, the parent domain (or Top-Level-Domain - TLD) of `example.com` and then finally the path of `home.html`.
