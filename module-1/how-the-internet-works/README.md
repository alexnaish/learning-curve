# How does the internet work?

The capabilities of the internet are almost limitless, as we're often shown by developers around the world. However at its simplest, its machines talking to machines via machines.

## Your machine and back again

I could write out the steps but there are thousands of great guides and images that will do a much better job then I can.

One such example:

<img alt="Internet Works Infographic" src="internetworks.jpg" />

Courtesy of: http://www.amazinginfographics.com/how-the-internet-works/

### IP Addresses

In a nut shell, everything has an [IP](../../GLOSSARY.md#ip) address that allows it to be located. However, [IP](../../GLOSSARY.md#ip) addresses aren't human friendly - nobody is going to remember that your website is hosted at `81.132.12.204`. It gets even worse if you want to use an IPv6 address (`2001:0db8:85a3:0000:0000:8a2e:0370:7334` anyone?). To help get around this, the internet uses `Domain Names`.

There are two versions of IP addresses, IPv4 and IPv6 (IP version 4 and IP version 6). IPv6 was introduced fairly recently and became an "internet standard" on 14 July 2017. IPv4 addresses are in the format `XXX.XXX.XXX.XXX` where XXX is any number between 0 and 255. Due to the growth of the internet, the range of IP addresses has had to be expanded to prevent every IP being used up (even though theres 2^32 / 4.3 billion addresses available using the v4 protocol) and this lead to the development of IPv6. As of writing this, IPv4 is still much more in use than IPv6 (to my eyes).

### Domain Names

A domain name in its simplest form is just a website name. The domain name is used as part of a [URL](../../GLOSSARY.md#url) to help locate a website. When you type in `www.google.com` into your browser, you are typing a domain name. The browser automatically adds a protocol to that to form the URL and then your request is sent off. The domain name is looked up against a domain name server ([DNS](../../GLOSSARY.md#dns)) where it finds the IP address of your website.

I don't think its mandatory reading but if you're interested in how setting up a domain name works then I would give the [Wikipedia - CNAMEs](https://en.wikipedia.org/wiki/CNAME_record) page a read. The first paragraph is enough to get the basic gist of it but feel free to read more if you're interested!
