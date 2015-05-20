## HTTP

### Lesson Objectives

* Differentiate between internet and web
* Explain how the internet works, including what web server is and what a client is
* Explain what protocols are
* Explain what TCP/IP is
* IP Addresses
* Define DNS and identify its role in the client-server relationship
* Explain the difference between domains and subdomains
* Define HTTP and differentiate it from other protocols
* Explain request and response headers
* List some common HTTP response codes
* Explain what SSL is
* Describe the role of ports for incoming/outgoing data
* Explain what a REST API is
* List the HTTP verbs most relevant to REST API's
* Create a new object using POST
* Read an existing object using GET
* Update an existing object using PUT
* Delete an existing object using DELETE

### Opening Framing
#### What

HTTP is the foundation for data communication on the world wide web. It defines the set of rules used to send text, images, videos on the web.

#### Why

The rules provided by the HTTP protocol are important because they allow us to transmit web documents, images, videos in a standardized and reliable manner. 

### Differentiate between the internet and web

The internet is a network of networks that connect millions of computers together globally. It allows any computer to connect to any other computer as long as they are both connected to the internet. The world wide web is built on top of the internet, and it's one way of accessing information on the internet. Using HTTP, this is how we access web documents, images, and video on the web. Examples of accessing the internet without HTTP include email and instant messaging.

### How the internet works, including what a web server is and what a client is

### What are protocols?

Protocols define rules and a standard way of doing things. 

Example: 
Formal introduction to someone

- Handshake
- Less senior person says "Hi, #{others name}, nice to meet you!"
- More senior person responds in kind.
- Each party comments on the weather.
- General communication can begin.
- When someone says 'boy, howdy, look at the time', then it's time to stop communicating

Example: 
Meeting a famous actor 

- Act really surprised
- Tell them you're their biggest fan
- Say you've seen all their movies at least 20 times
- Get their autograph
- Tell your friends that you're best friends with them

List of network protocols:
http://en.wikipedia.org/wiki/List_of_network_protocols_(OSI_model)

Protocols have 3 defining characteristics. These are not specific to computer or networking protocols:
http://www.ansmachine.net/2013/08/protocol-syntax-semantics-timing.html

**Syntax** - structure and format of the data
 * Data Format - How do we encode and represent our messages?
 * Addressing - How do we indicate sender and receiver
 * Routing - How do we get our message from A -> B
 * Reliability - How do we make sure our message got there, and do we retry if not?

**Semantics** - The meaning of the things being said (equivalent to defining words in the
english language, and them having meaning in introductions).

**Synchronization** 
 - System wouldn't work if we didn't have a sense of an order.
 - Example: Nerdiest joke I know...
  * The barman says: “We don’t serve faster-than-light particles here.” A tachyon enters a bar.

### Why are protocols important? 

- Example of needing plans for building a house 
- Depending on who it is, you might get: 
 * Give you a text message
 * Write up a 20 page document
 * Get a blueprint 
 * Give you a drawing of a house

## CLASS EXERCISE - 20min
IP (Meet Ivan Pakkitz)

### What is TCP/IP?

Transmission Control Protocol/ Internet Protocol

TCP/IP defines how electronic devices (like computers) should connect over the internet, and how data should be transmitted. 

TCP is responsible for breaking data down into packets and assembling them back together again. 

IP is responsible for addressing, sending, and receiving of the data packets.

[GIST: Structure of a data packet]

### IP Addresses 

Just as someone needs your mailing address to send you a letter, computers need an IP address to locate other devices connected to the internet. IP Addresses allow for the identification of billions of devices connected to the internet. 

4 sets of numbers, ranging from 1 to 3 digits

[QUESTION: Why do we not want to visit websites with this IP addresses?]
- Easier to remember friendly url's
- IP Addresses change

**Ask students for websites**
[Demo looking up websites by IP Address]

### DNS and its role in the client/server relationship 

**Domain Name System**

DNS is really just a big map of domain names to IP addresses

### Domains vs Subdomains

### What is HTTP and how is it different from other protocols? 

**Hyper Text Transfer Protocol** - Sits on top of TCP/IP and handles the communication between web servers and clients. HTTP is used to send requests and receive responses. 

### Request and response headers

http://en.wikipedia.org/wiki/List_of_HTTP_header_fields

### SSL

HTTPS - Handles secure communication b/w client and server 
[QUESTION: When would we want to use SSL?]

### Describe ports for incoming/outgoing data

### REST API's

Respresentational State Transfer

REST is an architectural style for developing lightweight web services. Used by many popular websites and generally favored over other alternatives like SOAP. When web services use a REST architecture they are said to be RESTful. 

### HTTP response codes

http://www.restapitutorial.com/httpstatuscodes.html

### HTTP Verbs 

* POST
* GET
* PUT
* DELETE

##CLASS EXERCISE - 10min
Look up the documentation for the Facebook, Twitter, or Twillio API's. Then discuss in class some of the actions that you can do, and the verbs used for them. 

##CLASS EXERCISE - 20min 
Create, read, update, delete using HTTP Verbs 







