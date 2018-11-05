# Client / Server

Software architects and systems often refer to their "clients". In its simplest form, a client is someone or something that requests information from something else (often referred to as the "server"). In fact, servers can also be clients, if they request information from an application on another server then they are themselves a client of that server / application.

Its worth bearing in mind that although we talk about clients / servers, the information requested and provided is always (for our purposes) from an application hosted at that location. In most cases in my experience (and for the future of the course), when we refer to clients we are talking about a user's device (ie their web browser / the mobile application they're using etc) and the "server" is the application hosted on a server.

<img alt="Client-Service Infographic" src="client-server-architecture.png" />

Courtesy of: http://toolsqa.com/client-server/client-server-architecture-and-http-protocol/

## Client - Server Interactions

How you expect your users to use your application changes how the application is built and the decisions on how you structure it. For instance, if you will only ever let users interact with your application via a web browser (Google Chrome, Firefox etc) then maybe it makes sense to build your application so that it serves up a frontend in [HTML](../../GLOSSARY.md#html). However - what happens now if you now wanted to also offer a mobile application? Sure, there are ways to run [HTML](../../GLOSSARY.md#html) / Javascript code as a native app on the phones but they might not offer the full range of possibilities building your app in the phone's native language offers (mobile app development isn't my forte so I might be wrong!).

## Client - Server Real World Scenario

So lets imagine you have an application that serves up a [HTML](../../GLOSSARY.md#html) frontend. This now leads to the problem that your functionality is now thinking in terms of a web browser - but native mobile apps aren't web browsers. For example, if your login page drops a browser cookie to track whether a user is logged in then when your users are using a web browser then great everything works but cookies aren't available in mobile apps (they might be now but thats besides the point, this is about principles) - they're a web browser technology.

So we need some way of handling what web browser users see, what mobile users see and the common functionality (the login process) between them. This is where (at least in my mind) a client-server model starts to shine. The last thing you want is to build a login process functionality for web users and then build the exact same functionality for mobile users!

So what we could possibly do is to have a `web-client` frontend that is the [HTML](../../GLOSSARY.md#html) for web browsers, a `mobile-client` frontend that contains the mobile application code and then a third application that validates user login attempts and returns the result in an `agnostic` way. This last part is important. In computing, `agnostic` refers to "hardware or software that is compatible with many types of platform". The previous example of using cookies to track login state is a prime example. If your login functionality revolves around cookies then its not platform agnostic - it is only going to work for web browser environments.

So moving forwards, we need to make our login functionality respond in a way that can be handled by both a mobile application and a web browser. Continuing to use logins as the example, all authentication processes work with some kind of token value (a useful read on token based authentication can be found here: https://scotch.io/tutorials/the-ins-and-outs-of-token-based-authentication).

In order to make our login process platform agnostic, we could stop making it return the token as a cookie and just return the token - leaving it up to the respective frontend applications to determine how they should save it. The `web-client` could continue to save it in a cookie but the mobile application could store it however the language / framework allowed.
