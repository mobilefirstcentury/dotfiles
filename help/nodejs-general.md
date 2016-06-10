---- Node.js introduction ----
==============================


first contact with  Node.js
---------------------------

language and different modules in the development of networking tools and web servers. The core functions of modules include File system I/O handling, Binary data (buffers), Networking
(HTTP, UDP,TCP, DNS, TLS/SSL), Data streams, Cryptography functions, etc. It is also necessary to pay attention to an elegant API of Node’s modules. This feature plays a starring role in the
simplification of server apps development.

Another important thing about **Node.js** is the support of frameworks designed to accelerate the apps development. Socket.io, Express.js, and Connect are the examples. Node.js applications
can be written with any JavaScript-compile language, such as CoffeeScript or TypeScript.

The primary role of **Node.js** is the development of web servers and other network programs. That’s why it has a lot of common with
PHP, which is often used on servers. The significant difference between two is in their core. PHP is a blocking language,
while Node.js is a non-blocking language. It means that commands in PHP are executed only after the previous commands has been completed, while commands in Node.JS are executed in parallel.


Non-blocking nature of Node.js
------------------------------

Node.js provides server developers with event-driven programming. As a result, developers are able to create servers with a high scalability. They use a simplified model of event-driven
programming, which relies on callbacks used to indicate the completion of a task.

Node.js was developed to improve the performance of existing server-side programming languages, which suffer from difficulties related to concurrency.
It combines the ease of JavaScript with the abilities of Unix network programming.

And these are the reasons, why **Node.js** is built upon the **Google V8 engine**.
First of all, V8 is an open-source project licensed under the BSD agreement.
This feature provides Node.js developers with lots of abilities. The second reason is the performance of V8, which is extremely fast.
The third reason is V8’s focus on the web. This JavaScript engine is specialised on internet fundamentals (HTTP, TCP, DNS, etc). Last but not the least is the popularity of JavaScript among web developers.

Technical features of Node.js 
-----------------------------

Technical features of **Node.js** are threading, V8, package management, unified API, and event loop. Below you will find the detailed explanation of each one.

### Threading 

First of all we should mention two thing about threading of Node.js: it relies on non-blocking I/O calls; it operates on a single thread. As a result, Node.js support no end of concurrent
connections, eliminating the thread context-switching cost. By sharing a single thread between all possible requests, Node.js can be used to develop highly concurrent apps. In **Node.js**
applications, any function that performs I/O should use a callback.

But there is a downside in such approach. Scaling with the CPU cores number in Node.js is impossible until you use an additional module like pm2.

The absence of threads doesn’t cancel the advantage of multiple cores in your environment. You can always spawn child processes with easy communication by using child\_process.fork() API.
The cluster module, which is built upon that same interface, also provides you with the ability to enable load balancing over cores. In this situation sockets are shared between processes.

### V8 

**V8**, written in C++, is responsible for the run-time for JavaScript. It compiles source code of JavaScript to native machine code in order to remove its real time interpretation. Libuv,
which is a part of Node.js, creates an abstraction layer for file system and network functionality. In their turd Node.js bindings, also written in C++, connect all these technologies
together with the operating system.

### Package management 

**Node.js** server platform includes a pre-installed package manager NPM. Node.js package manager is used to install Node.js programs from its registry. NPM is used to improve the
performance of development by organizing third-party Node.js programs installation and management. Keep in mind, that npm and CommonJS require() statement are not the same thing. The package
manager is not used to load code. It is designed for code installation and dependencies management from the command line. The npm registry can include all possible kinds of packages from
simple helper libraries to task runners like.

NPM modules:

-   [express](http://expressjs.com/) – Express.js is a Sinatra-inspired framework.
-   [connect](http://www.senchalabs.org/connect/) – an extensible HTTP server framework, which provides a collection of middleware plugins and serves as a base foundation for Express.
-   [socket.io](http://socket.io/), [sockjs](https://github.com/sockjs) – most common server-side components.
-   [Jade](http://jade-lang.com/) – a templating engine from Express.js.
-   [mongo](https://npmjs.org/package/mongodb), [mongojs](https://github.com/gett/mongojs) – MongoDB wrappers for providing API for MongoDB object databases.
-   [redis](https://github.com/mranney/node_redis) – Nodejs Redis (a client library).
-   [coffee-script](https://npmjs.org/package/coffee-script) – a compiler for CoffeeScript.
-   [underscore](https://npmjs.org/package/underscore) – Node.js JavaScript utility library.
-   [forever](https://npmjs.org/package/forever) – utility to check the continuous work of a node script.

### Unified API 

In order to offer a unified JS development stack, Node.js is combined with browser, JSON and document DB. It provides the increased attention to client-side frameworks and such server-side
development patterns as MVC, MVP, MVVM. As a result, Node.js make it possible to use the same service interface for both client-side and server-side.

### Event loop 

Being influenced by Eventmachine and Twisted, Node has a lot of similarities in design with them, but it takes the event model slightly further. Node.js is notified when a connection is
made. At the same time, the operating system issues a callback. Then, Node.js starts an event loop. The system uses it to scale to all simultaneous connections. And the event loop doesn’t
need to be called explicitly. The next algorithm is used instead: while callbacks are defined, the server enters the event loop by the end of the definition process. The event loop is not
used if there is no work to be done.

Node.js Examples 
----------------

### Chat 

Chat is a real-time application used by several people. Being lightweight, high traffic, and data-intensive, chat app is a perfect example of for Node.js use. It’s also good to start your
learning from such kind of apps, because they are relatively simple, but cover most of the typical for **Node.js apps** paradigms.

Imagine the situation with a single chatroom on a website. For instance, there are three users chatting.

There is the [Express.js](http://expressjs.com/) app on the server-side. It is necessary for the implementation of two things: 1) a GET ‘/’ request handler; 2) a websockets server. The first
one serves the webpage, which contains both a ‘Send’ button and a message board, to start the input of a new message. The second one listens for emitted by websocket clients messages.

On the client-side, there is an HTML page which includes a couple of handlers set up. One of them is used for the event associated with a ‘Send’ button click, which works with the input
message: picks it up and sends down the websocket. Another handlers set up listens for incoming messages on the websockets client.

Here’s what happens, when someone posts a message:

1.  Browser relies on a JavaScript handler to catch the ‘Send’ button click, picks up the message or another value from the field of input, and emits a websocket message with the help of the
    websocket client which is connected to the server.

2.  Now, it’s time of server-side component of the websocket connection to act in the algorithm. First of all, it receives the message. It’s second action consists in forwarding it to other
    connected clients. The broadcast method is used here.

3.  As a result, all clients get the message in a form of push message via a websockets client-side component, which runs within the web page. Then, they pick up the content of the message
    and append the new message to the board, updating the web page.

Keep in mind, that it was the basic example. There are more robust solutions, based on simple cache and Redis. Some of them provide a better delivery mechanism which protects users from
connection losses and stores messages of registered visitors. Regardless of the implemented solution, **Node.js** always operates under the same principles: it reacts to events, handles all
concurrent connections, maintains fluid user experience.

### Object DB 

Object DB (for instance, MongoDB) is another area of use for Node.js. With the help of JSON stored data, **Node.js** is able to function without the data conversion and impedance mismatch.

In a case of Rails, you have to perform much more actions. In its turn **Node.js** simplifies the process. JSON objects are exposed with a REST API for the client to consume. Additionally,
there is no need to worry about JSON when reading or writing from the database. With Node.js, you will be able to avoid the necessity of multiple conversions. In order to do this, you will
must synchronize the data flow between your client, server, and database with the help of a uniform data serialization format.

### Queued inputs 

**Node.js** also provides you with the ability to push the database writes off and use them later.  In a case of a high amount of concurrent data, problems can occur with database.
**Node.js** can handle the concurrent connections with ease, but because of blocking nature of database access operation, you can run into trouble. Luckily, there is a reliable solution: you
should acknowledge the behavior of a client before the data is written to the DB.

Such approach provides the ability to maintain the responsiveness of the system even under a heavy load. This is especially useful in the situation with the successful data write when the
client doesn’t require a firm confirmation. On practice this includes such processes as user-tracking data writing (which is processed in batches, and used sometime later); or operations
that don’t require instant reflection where eventual consistency is acceptable.

In order to queue the data, the message queuing infrastructure (such as [RabbitMQ](http://www.rabbitmq.com/) or [ZeroMQ](http://zeromq.org/)) is used. Then the data is digested by a separate
database batch-write process. Another possible solution is computation intensive processing backend services, which are written in a platform, that provides better for such tasks
performance. Keep in mind, that similar behavior is also possible with other frameworks or languages. But the difference is in a hardware. To achieve the same throughput, you will need to
change the hardware.

### Data Streaming 

In traditional platforms, HTTP responses and requests are treated like streams. In a case of Node.js, this principle can be used to get new cool features. You can easily process files during
their upload (real-time audio or video encoding, or proxying between different sources of data).

### Proxy 

**Node.js** supports server-side proxy capabilities. It is often used for collecting data from multiple source points, and proxying services with different time of response. In addition,
Node is helpful in a case of non-existent proxying infrastructure. It is also used as a tool for local development.

Some used cases for Node.js 
--------------------------

why should you use it?
-----------------------

-   You are already familiar with JavaScript, so you know almost everything about Node.js. As a result, this runtime environment provides extremely short learning curve.
-   Node.js provides lightning fast JavaScript execution. V8, event loop and other aforementioned features are responsible for the high performance.
-   Wide variety of tools, provided by npm – the Node.js package manager.
-   Real-time and multi-user support.
-   Data streaming.
-   The possibility to write web apps that run on a single codebase on both server and client with automatic data synchronization between them.
-   Huge community with volunteer maintainers and reliable investors.
-   Node.js hosting providesrapid adoption.

Node.js web scraping 
--------------------

With the increase of data on the web, scraping – the process of programmatic information retrieving  - become widespread and simplified. There are a lot of appropriate tools, but you can
always use Node.js to make your own powerful solution for web scraping. Below you will find information about Request and Cheerio – Node.js modules for web scraping; and two apps – one is
able to fetch and display data, another can find Google search related keywords.

### Modules 

To bring in the aforementioned modules you will have to use NPM – the Node Package Manager.

#### Request Module 

It is possible to download Internet data from both HTTP and HTTPS interfaces with the help of Node.js, but they should be separated. By using [Request
module](https://github.com/request/request), you can easily merge these methods and abstract the difficulties away.
The module provides a unified interface for making requests. Keep in mind, that you can use Request to download web pages into the memory.
The installation includes the following steps: go to the directory with main Node.js file; open terminal; start “npm install request”.

#### Cheerio 

With [Cheerio](https://github.com/cheeriojs/cheerio) module, you will be able to use the syntax of jQuery while working with downloaded web data. Cheerio provides developers with the ability
to provide their attention on the downloaded data, rather than on parsing it. The installation includes the following steps: go to the directory with main Node.js file; open terminal; start
”npm install cheerio“.

##### Implementation 

The below code will help you grab the temperature information from an appropriate website. You can use the code of your area at the end of the URL. Also check, if aforementioned modules have
been installed successfully.


```js
var request = require("request"),
    cheerio = require("cheerio"),
    url = "http://www.wunderground.com/cgi-bin /findweather/getForecast?&query=" + 02888;
     
    request(url, function (error, response, body) {
        if (!error) {
          var $ = cheerio.load(body),
          temperature = $("[data-variable='temperature'].wx-value").html();
           
          console.log("It’s " + temperature + " degrees Fahrenheit.");
        } else {
          console.log("We’ve encountered an error: " + error);
        }
    });
```

And this is how the app works. The modules are required for the later access. Then, the URL is defined. It shows the place, where a variable should be downloaded.
Next, Request module is used to download the page at the appropriate URL. The “request“ function is used. You pass in the aforementioned URL, and a callback handles the results of the
request.
Now is the time for data to be returned. And we have to deal with the callback again.  First of all, it is invoked, and then passed 3 variables:” error”, ”response“, ”body”.
In the situation when Request module is unable to extract the data, it passes a valid error object to the function. Thus, the body variable is null. Keep in mind, that before working with
data, you have to check errors and log them to see what was wrong.
If everything works well, the data is passed to Cheerio, where you can handle it with the help of standard jQuery syntax.
You can also create a selector responsible for grabbing the chosen elements from the page. Just use your browser and developer tools to explore the page with the required data.
In the browser, you have to open the page you’ve decided to scrape and create a jQuery selector for the elements you are going to get data from.
In the code, you have to perform 3 steps. First of all, you should use request for downloading the page. Then, it is time for Cheerio: pass the returned data into it to get jQuery-like
interface. And finally, it’s time to use the selector (don’t forget to write it in advance).

### Data Mining 

Data mining is a more advanced use of web scraping. The process also relies on downloading web pages, extracting data from them, and generating reports. Of course, you can always use
**Node.js** in this process.

Below you will find a simple data-mining Node.js application. It looks for the top terms associated with appropriate Google search results. The application examines the Google search,
downloads all the necessary pages, parses out the text from each page, analyzes it, and presents the most popular words. Hit [this
link](https://gist.github.com/elliotbonneville/1bf694b8c83f358e0404) for the full code.

#### How to download the Google search 

First of all you should decide what page to analyse. Find the URL for the search you want. Then you should download it and parse the results. As a result, you will be able to find the
required URLs.

Request module is used for downloading the page, while Cheerio is necessary to parse it. And this is the code:


```js
request(url, function (error, response, body) {
    if (error) {
      console.log(“Couldn’t get page because of error: “ + error);
      return;
    }
     
    // load the body of the page into Cheerio so we can traverse the DOM
    var $ = cheerio.load(body), links = $(".r a");
     
    links.each(function (i, link) {
        // get the href attribute of each link
        var url = $(link).attr("href");
         
        // strip out unnecessary junk
        url = url.replace("/url?q=", "").split("&")[0];
         
        if (url.charAt(0) === "/") {
          return;
        }
         
        // this link counts as a result, so increment results
        totalResults++;
    });
});

```

Google search for “data mining” is the URL variable you are passing in.
First of all, you should get the contents of the page. To do this, you’ll have to make a request.
The second step requires loading the page contents into Cheerio. As a result, you will be able to query the DOM for the elements with the links to the appropriate results.
The third stage requires looping through the links and stripping out extra URL parameters.

And don’t forget to check URL. It shouldn’t start with a “/”.

#### How to pull words from every page 

This step is almost similar to the simple example, but now the URL variable refers to the URL of the page from the above loop.


```js
request(url, function (error, response, body) {
  // load the page into Cheerio
  var $page = cheerio.load(body), text = $page("body").text();
```

You should use Request and Cheerio once again. This modules will do 2 actions:
1. download the page
2. get access to DOM.

In the example, the access is used to get the text from the page.
Another step requires working with the text. You should clean it up from the page by compress the white space into single spaces; getting rid of characters that are not spaces or letters;
converting everything to lowercase.
Now, you can split the text on the spaces and get the array with all the rendered words of the page. Next stage is about looping through them and adding to the corpus.

Use this code to perform the above actions:

```js
  // Throw away extra white space and non-alphanumeric characters.
  text = text.replace(/\\s+/g, " ")
      .replace(/[\^a-zA-Z ]/g, "")
      .toLowerCase();
   
  // Split on spaces for a list of all the words on that page and
  // loop through that list.
  text.split(" ").forEach(function (word) {
        // We don't want to include very short or long words because they're probably bad data.
        if (word.length  20) {
          return;
        }
         
        if (corpus[word]) {
          // If this word is already in our
          corpus, our collection
          // of terms, increase the count for
          appearances of that
          // word by one.
          corpus[word]++;
        } else {
          // Otherwise, say that we've found
          one of that word so far.
          corpus[word] = 1;
        }
  });
```

#### How to analyze the words 

With all words in the corpus, you should sort them by popularity. Gather them in an array:

```js
  // stick all words in an array
  for (prop in corpus) {
    words.push({
      word: prop,
      count: corpus[prop]
    });
  }
   
  // sort array based on how often they occur
  words.sort(function (a, b) {
      return b.count - a.count;
  });
```

This is the example of the finished work:


```json
[
  { word: 'data', count: 981 },
  { word: 'mining', count: 531 },
  { word: 'that', count: 187 },
  { word: 'analysis', count: 120 },
  { word: 'information', count: 113 }
]
```

This is how the web scraping (and data mining) is done.


Node.js CMS 
-----------

### [KeystoneJS](http://keystonejs.com/) 

KeystoneJS provides the easiest way for building database-driven sites, apps and APIs in Node.js.
It provides automatic configuration for Express.js, and give an access to MongoDB.
The Admin UI is intuitive and provides all necessary features, designed to save your time.
The other useful features include readable asynchronous code, secure forms processing, effective session management for data encryption.
There are also email management features on KeystoneJS CMS. 
This CMS is based on Bootstrap and jQuery.


### [Calipso](http://calip.so/) 

Calipso is a very fast, extremely flexible, and at the same time simple **Node.js CMS**, built along themes similar to Drupal and WordPress.
Because of minimalistic approach to the design, this CMS suits best to sites that don’t rely on tons of media content.
Check the example for the better understanding of the problem.
Another important aspect of Calipso is a modular approach to delivering the functions.
All core features of this CMS are provided by modules. Bootstrapping, forms, and theming are the exclusion.


### [Apostrophe](http://apostrophenow.org/) 

This open source nodejs CMS provides maximum flexibility alongside with a minimal learning curve.
As a result, you can focus on building things, rather than on learning. Apostrophe provides wide variety of features.
Thus, this CMS appeals to both business owners and community websites.
In addition, Apostrophe is good for learning more about Node.js on practice.


### [Hatch.js](http://hatchjs.com/) 

Hatch is built on Node.js and Redis, to provide fast and highly consistent performance.
Thanks to Twitter Bootstrap framework, it enables you to apply a lot of existing themes.
There are also powerful editing tools designed for rapid site building.
You can build pages with the help of WYSIWYG-style editor. The open source platform provides both free and paid addons.
Keep in mind, that Hatch works as a NPM, so you can build your own features with ease. We should also mention, that it is responsive, supports raw CSS editing, and provides a lot of social
features.

### [Cody CMS](http://www.cody-cms.org/en/) 

Cody also runs on top of Node.js.
Thanks to Chrome’s JavaScript runtime, this Node.js CMS provides the ability to build fast and scalable network apps.
Cody itself is written from scratch in Javascript.
Thus, you can easily use this language in both server and client sides for creating of next web application.
Keep in mind, that Cody is open source. That’s why you can read the code, copy, and modify it for free. You can also host your website for free.

### [Buckets](http://buckets.io/) 

This content management system is also open source and built upon Node.js with MongoDB.
Buckets provides you with the ability to store the content in a structured and at the same time flexible way.
It is fast and responsive. Buckets looks perfect on both sleek layouts of big screens and fast responsive layouts of smartphones.
It provides the ability to add, modify, remove, or update content at the maximum speed.

### [PencilBlue](https://pencilblue.org/) 

PencilBlue is fully responsive and easy to use. It was designed for content driven websites for businesses and publications.
The platform provides SEO and relational data management tools and the freedom to host the Node.js CMS on all possible server architectures.
Being 100% extendable, it relies on a plugin system.
Thus, developers are able to modify even the core functionality of the platform. Furthermore, PencilBlue is totally scalable.
Based on Node.js, it abstracts its services and data providers. Keep in mind, that MongoDB and Redis are included out of the box.



Node.js e-commerce platforms 
----------------------------

### [Reaction Commerce](https://reactioncommerce.com/) 

Another platform in our list of open source Node.js e-commerce solutions is Reaction Commerce.
It’s free and easy to use. The developers of Reaction Commerce are trying to make online selling as easy as digital shopping.
This JavaScript e-commerce platform provides real time merchandising, promotions, and pricing.
There are also options for live monitoring of conversions.
Reaction Commerce provides its users with the ability to observe and track the behaviour of visitors and optimize sales in real time.

Reaction Commerce is a completely open source ecommerce platform based on JavaScript which widely utilizes Node.js. It offers a modern, scalable, and reactive architecture with real time
capabilities. Besides, Reaction Commerce incorporates such platforms as Meteor and supports Docker, so you can easily get all the benefits of containerization. Below, I list some other
platform’s  features:

- Product Details. Reaction Commerce supports additional product details. This feature is utilized in a key/value list.
- Reaction Apps. You can easily install new apps or create your own to extend the default features of this Node.js ecommerce platform.
- Variant Management. Besides, Reaction Commerce offers a user friendly admin panel, so you can manage product options as well as related images without any headaches.
- Fully Open Source. The Node.js ecommerce platform must be completely open source, and Reaction Commerce is not an exception.
- Recursive Tag Taxonomy. What is this? Another useful feature which make categorization better. You can find more information on the official website.
- Device Agnostic. It is extremely necessary to be device agnostic nowadays. Luckily, Reaction Commerce offers the same experience for both mobile and desktop devices.
- Inline Field Editing. Simplicity is always a plus when it comes to content management. With this Node.js ecommerce platform, you can add and edit your content by clicking any text field.
- Google Analytics Support. Reaction Commerce supports Google Analytics event tracking out-of-the-box.
- Clone Existing Products. By using this Node.js ecommerce solution, you can create products by cloning any existing ones. It is fast and simple.
- Tons of other features. Besides, Reaction Commerce offers tons of other ecommerce features. Don’t forget to check them on the official website here: Reaction Commerce features.

### [StoreHippo](http://www.storehippo.com/technology) 

StoreHippo is the platform for e-commerce and m-commerce.
The platform is based on the MEAN stack, which consists of MongoDB, Express, AngularJS, and Node.js.
All this technologies are used while creating dynamic web sites.
The use of MEAN stack makes the user experience seamless.
StoreHippo-based e-commerce stores are fully responsive, so there is no need to deploy two different solutions for mobile and web.
This Node.js e-commerse platform is a perfect solution for digital retail.


### [Schema.io](http://schema.io)

The next Node.js ecommerce platform and API for creative online stores is Schema.io. This system incorporates a lot of modern coding technologies to provide developers with the ability to
create top notch ecommerce solutions. It’s not a free solution, but there is a free plan. You can check available offers on the official website. As for features, they are listed below:

- Extensive API. Schema provides powerful and extendable API as well as reliable tools for creating beautiful ecommerce websites.
- Custom Admin. You can easily customize admin pages and workflows with the help of this Node.js ecommerce platform. Besides, there is the ability to automate everything.
- Device Agnostic. Schema.io works on both mobile and desktop devices, so you can extend it to all possible platforms.
- Advanced Integration. Schema supports integration with outside content and programming frameworks. Therefore, you can use your favourite tools within the system.
- API Centric. By choosing this Node.js ecommerce platform, you will be able to extend every part of your ecommerce project with the help of powerful API.
- High Performance. Sell millions of products making your data available everywhere within seconds with Schema.io.
- Advanced Customization. You can use standard models or customize everything according your business needs.


### [NodeShop](http://www.nodeshop.org/) 

Nodeshop is a Node.js powered solution designed to create e-commerce web stores.
Its front-end framework is based on Bootstrap, that’s why the user interface looks good.
The project is still in progress, so all the suggestions are appreciated.


### [MarketCloud](http://www.marketcloud.it/)
Marketcloud is not an ordinary ecommerce platform. It is an API service for ecommerce development which supports Node.js. Thus, if you are not a coder, Marketcloud won’t be useful for your
business, but it is always possible to hire a team of specialists. The platform is aimed at managing data while developers focus on building amazing ecommerce experience. Below, you can see
some of Marketcloud’s features.

- Enhanced development workflow. The workflow is based on Yeoman’s generators turning routine ecommerce development into fun.
- Advanced Authentication. Provide your visitors with the ability to sign in via Facebook, Twitter, or email and get a deep insight into their preferences, browsing history, and carts.
- Top Notch Search Engine. All Marketcloud ecommerce websites get a reliable search engine. As a  result, your customers can find almost everything on your web store.
- Easy to Use Dashboard. The system offers a user friendly dashboard, so your administrators will be able to manage and visualize ecommerce data within a quick and powerful application.
- Data Layer. Marketcloud relies on JSON documents when it comes to data. Since the platform’s API abstracts database-related mechanics, every client connected to your application shares the same version of data.
- Cross Platforming Capabilities. Support for different platforms is no longer a competitive advantage – it’s a feature which help to exist on your market. Thus, Marketcloud offers the ability to build native mobile and web apps with the aid of SDKs for Javascript, Android, iOS, etc.
- Simple And Powerful API. Incorporate new features with just a few lines of code due to simple and powerful API offered by Marketcloud .


### [Sofa](http://www.sofa.io/)

If you are looking for a reliable tool for building web store on CouchCommerce, pay attention to Sofa. It is an SDK for building ecommerce web apps for that exact platform. Sofa offers tons
of great features, relies on modular system, and is framework agnostic. Some of its features are listed below:

- Advanced Search. The platform offers an easy to use search service with throttling support.
- Easy Checkout. Decrease your cart abandonment rate with Sofa’s easy checkout. Besides, you will be able to provide your buyers with several payment option.
- Promise-Based API. Get rid of callback hell with components’ asynchronous promise-based APIs, and manage flow control in your apps with ease.
- Convenient Cart. With Sofa, you will improve customer experience due to convenient shopping carts.
- Modular System. The platform relies on a modular system with all its components sliced into separate packages. Thus, you can choose only necessary features and install them via npm and Bower.
- Enhanced Catalog. Sofa provides an enhanced process of accessing categories or products from a catalog.


### [80 cents](http://80cents.org/)

Although Node JS has quickly become a great tool for developing various web project, we still don’t have a lot of reliable ecommerce solutions among them. Thus, 80cents is the last Node.js
ecommerce platform in this article. Being a fully open source platform, it should help you sell all your goods and services on the Internet. Check the following features:

- Superior Online Experience. 80cents is here to help you with providing top notch ecommerce experience. As a seller, you will get a superb admin panel, while your customers will be able to enjoy a perfect UI. Node JS provides enough capabilities to achieve this goal.
- Endless Customization. Get your 80cents ecommerce store ready in less than five minutes. Modify everything whenever you want.
- Experiments. This Node.js ecommerce platform is a fully open source project; therefore, you or your developers can implement all their ideas within your web store.
- Real-Time Experience. 80cents has been developed with real-time experience in mind, so you can easily take the advantage of this feature within your ecommerce website.
- Device Agnostic. The platform offers the the best possible ecommerce experience on any device.




Node.js Tutorials 
-----------------
[TODO] transformer ces tutoriaux en ressources markdown pour MFC

- [Node.js Hosting Solutions](//firebearstudio.com/blog/the-best-node-js-hosting-solutions.html "The Best Node.js Hosting Solutions") 
- [Node.js Frameworks and Tools](//firebearstudio.com/blog/the-best-node-js-frameworks-and-tools.html "The Best Node.js Frameworks and Tools") 
- [How to Become a Rockstar Node.JS Developer](//firebearstudio.com/blog/how-to-become-a-rockstar-node-js-developer-tutorials-blogs-and-books.html "How to Become a Rockstar Node.JS Developer (tutorials, blogs, and books)") 
- [Node.js Ecommerce Platforms](https://firebearstudio.com/blog/the-best-node-js-ecommerce-platforms.html "The Best Node.js Ecommerce Platforms")
- [Node.js and The Internet of Things](https://firebearstudio.com/blog/node-js-and-the-internet-of-things.html "Node.js and The Internet of Things")
- [Node.js vs PHP](https://firebearstudio.com/blog/node-js-vs-php.html "Node.js vs PHP")
- [Node.JS Debugging Tools](https://firebearstudio.com/blog/node-js-debugging-tools.html "Node.JS Debugging Tools")
- [Node.js Application Monitoring Tools](https://firebearstudio.com/blog/the-best-node-js-application-monitoring-tools.html "The Best Node.js Application Monitoring Tools")
- [Node.js IDEs](https://firebearstudio.com/blog/node-js-ide.html "The Best Node.js IDEs") 
- [Node.js Development Environment From Scratch](https://firebearstudio.com/blog/node-js-development-environment.html "Node.js Development Environment From Scratch") 
- [Node.js Developer’s Cookbook](https://firebearstudio.com/blog/node-js-developers-cookbook-useful-code-snippets-tips-and-notes.html "Node.js Developer’s Cookbook: Useful Code Snippets, Tips, and Notes")
- [Node.js Command Line Apps & Utilities](https://firebearstudio.com/blog/node-js-command-line-apps-utilities.html "75 Best Node.js Command Line Apps & Utilities")
- [Node.js Filesystem Tools](https://firebearstudio.com/blog/node-js-filesystem-tools.html "17 Node.js Tools To Streamline Your Operations With File System")
- [Node.js NLP](https://firebearstudio.com/blog/node-js-natural-language-processing.html "Node.js Natural Language Processing Projects")
- [Top Node.js REST API frameworks](https://firebearstudio.com/blog/top-node-js-rest-api-frameworks.html "Top Node.js REST API frameworks")
- [Database for Node.js: Drivers, Builders, and Mappers](https://firebearstudio.com/blog/node-js-database.html "Database for Node.js: Drivers, Builders, and Mappers")
- [Node.js Security Improvements](https://firebearstudio.com/blog/nodejs-security-improvements.html "Node.js Security Improvements")
- [Node.js Full Stack Frameworks Overview](https://firebearstudio.com/blog/node-js-full-stack-frameworks-overview.html "Node.js Full Stack Frameworks Overview")
- [Best Node.JS Books](https://firebearstudio.com/blog/node-js-books.html "Best Node.JS Books")

