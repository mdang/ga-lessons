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
Meeting a famous actor 

- Act really surprised
- Tell them you're their biggest fan
- Say you've seen all their movies at least 20 times
- Get their autograph
- Tell your friends that you're best friends with them

List of network protocols:
http://en.wikipedia.org/wiki/List_of_network_protocols_(OSI_model)

- Protocols have 3 defining characteristics. These are not specific to computer or networking protocols:
  - Syntax
    * Data Format - How do we encode and represent our messages?
    * Addressing - How do we indicate sender and receiver
    * Routing - How do we get our message from A -> B
    * Reliability - How do we make sure our message got there, and do we retry if
      not?
    * Synchronization - How we do make sure messages are interpreted in the correct
      order?
  - Semantics
    - The meaning of the things being said (equivalent to defining words in the
english language, and them having meaning in introductions).
  - Synchronization (of communication)
    - System wouldn't work if we didn't have a sense of an order.
    - Example: Nerdiest joke I know...
      * The barman says: “We don’t serve faster-than-light particles here.” A
        tachyon enters a bar.

## CLASS EXERCISE - 20min
IP (Meet Ivan Pakkitz)

### What is TCP/IP?

Transmission Control Protocol/ Internet Protocol

TCP/IP defines how electronic devices (like computers) should connect over the internet, and how data should be transmitted. 

TCP is responsible for breaking data down into packets and assembling them back together again. 

IP is responsible for addressing, sending, and receiving of the data packets.

### IP Addresses 

### DNS and its role in the client/server relationship 

DNS is really just a big map of domain names to IP addresses

[QUESTION: Why is this useful?]
- Easier to remember friendly url's
- IP Addresses change

**Ask students for websites**
[Demo looking up websites by IP Address]

### Domains vs Subdomains

### What is HTTP and how is it different from other protocols? 

### Request and response headers

### HTTP response codes

### SSL

[QUESTION: When would we want to use SSL?]

### Describe ports for incoming/outgoing data

### REST API's

### HTTP Verbs 

##CLASS EXERCISE - 20min 
Create, read, update, delete using HTTP Verbs 







