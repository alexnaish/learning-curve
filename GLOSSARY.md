# Glossary

### API

Application programming interface. Depending on the context of how its used, it can either reference the exposed functionality of a library / module or it can refer to an external application / service. In the first case, if a module exposes an object with one function then its "public API" is that - an object with one function exposed for use. It may however use several other functions but since its not exposed its not part of the "API".

People often refer to "the API" - in this case it refers to another service that an application can interact with via that service's exposed functionality. For instance, Youtube may have a service that allows other developers to search for results on youtube without exposing anything about how Youtube's systems work internally.

### CSS

Cascading Style Sheets. Describes how the HTML in a webpage should be presented.

### DNS

Domain Name Server. Holds the addresses of site domain names. An example would be asking for the location of www.google.co.uk and receiving some kind of IP address.

### HTML

Hypertext Markup Language. The most commonly used programming language for creating web pages and web applications.

### HTTP

Hypertext Transfer Protocol. Defines a set of rules that allows clients and servers to communicate. Your web browser will use HTTP to request the contents of a website.

### IP

Internet Protocol. Defines how data should be transmitted across a network.

### REST

Representational State Transfer. Don't worry about the full definition, it's really only ever referred to as "rest". REST is a style of designing and application so that the HTTP verbs match up against actions of your application objects. For instance, a HTTP "GET" request will be a "fetch" operation in your application whereas a "POST" will be a "create" operation.

### SSH

Secure shell. A network protocol allowing networking services over a (often unsecure) network. The most common example of this is to remotely login to a server. Since you don't have physical access to sit down next to most servers, you need some way of accessing it if you need to perform operations on it. This is where you'll use SSH to connect.

Example command: `ssh alex@example.server.com`. This would allow the user `alex` to attempt to connect to the server at `example.server.com`.
