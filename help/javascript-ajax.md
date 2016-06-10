---- ajax user guide ----
========================


Jquery Ajax
-----------
Jquery ajax method is a wrapper for XMLHttpRequest (see below)

### example code
[TODO] Avec Jquery Ajax, comment tester si CORs est supporté par le browser ? 

  ```js
  // set api access key if any
  var api_key = 'fc59bf6baf30efc52ca007da6c7a425a'

  // set HTTP method
  var method = 'GET'

  // build api request URL
  // 'services' & 'rest' strings are 'PATH PARAMETERS'
  // 'method=flickr.people.getPublicPhotos' & 'user_id=32951986%40N05' and 'api_key=<api_key>' are 'QUERY PARAMETERS'
  // in the 'user_id' parameter '%40' is the 'percent encoding' of character '@' that's not allowed in URL paramters
  var url = 'https://api.flickr.com/services/rest/?method=flickr.people.getPublicPhotos&user_id=32951986%40N05&api_key=' + api_key

  // create the request                                                                                                        
  $.ajax(url,{
    type: method,
    dataType: 'json',
    xhrFields: {                                  // xhrFields is used to set arbitrary fields on underlying XMLHttpRequest object
      withCredentials: true                       // here we set 'withCredentials' to have credentials uploaded on Cross Origin Request (CORs)
    },
    headers: {                                    // headers is used to set request headers 
      'X-Requested-With': 'XMLHttpRequest'        // optional can be set to indicate to the server where the request is comming from. Must be authorized by the server.
    },
    sucess: function(data, textStatus, jqXHR){
      if(data.stat == 'OK'){
        // process data
      } else {
        // process error status
      }
    },
    error: function(jqXHR, textStatus, errorThrown){
      // process error 
    }
  })

  ```

XMLHttpRequest (aka XHR aka Ajax Request)
-----------------------------------------

traditionnal way to implement ajax request ...

### example code

  ```js
  // set api access key if any
  var api_key = 'fc59bf6baf30efc52ca007da6c7a425a'

  // set HTTP method
  var method = 'GET'

  // build api request URL
  // 'services' & 'rest' strings are 'PATH PARAMETERS'
  // 'method=flickr.people.getPublicPhotos' & 'user_id=32951986%40N05' and 'api_key=<api_key>' are 'QUERY PARAMETERS'
  // in the 'user_id' parameter '%40' is the 'percent encoding' of character '@' that's not allowed in URL paramters
  var url = 'https://api.flickr.com/services/rest/?method=flickr.people.getPublicPhotos&user_id=32951986%40N05&api_key=' + api_key

  // create the request                                                                                                        
  var xhr = new XMLHttpRequest()

  // check if the browser supports CORS (Cross Origin Request )
  if (!('withCredentials' in xhr)) {
    // Browser does not support CORS.
  } else {
    // force credential inclusion in the request (Cookies, Client Side SSL certificates, etc.)
    // Will fail if not authorized by Cross Origin Server
    xhr.withCredentials = true
  }


  // open request
  xhr.open(method, url)

  // after the open call, add HTTP header if necessary 
  // following headers CANNOT be set with `setRequestHeader` method: 
  //  - Origin (This header is central in CORs security scheme and is set automatically by the browser),
  //  - Accept-Charset, Accept-Encoding, Access-Control-Request-Headers, Access-Control- Request-Method, Connection, Content-Length, Cookie, Cookie2, Date, DNT, Expect,
  //  - Host, Keep-Alive, Referer, TE, Trailer, Transfer-Encoding, Upgrade, User-Agent, Via, 
  //  - any headers starting with ‘Proxy-’ or ‘Sec-’.
  xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest')  // optional can be set to indicate to the server where the request is comming from. Must be authorized by the server.
    
  // attach error callback
  xhr.onerror = function() {
    alert('There was an error.')
  }

  // attach data callback
  xhr.onload = function() {
    var data = JSON.parse(xhr.responseText)
    if (data.stat == 'ok') {
    // process json data
    } else {
    // process error data
    }
  }

  // optionnaly set timeout
  xhr.timeout = 50000  // in ms. Default is '0' for no timeout
  // send request
  xhr.send()

  // the request can also be sent with a request BODY
  xhr.send('request body goes here')

  // a request can be aborted
  xhr.abort()
  ```

### AJAX events
the XMLHttpRequest object exposes a list of event hooks

Event              | handler Description
---                | ---
onloadstart        | Fires when the request starts.
onprogress         | Fires when sending and loading data.
onabort            | Fires when the request has been aborted by calling the abort method.
onerror            | Fires when the request has failed (When there's no Response Status Code to read: Connection problem or Cross Origin request on server not supporting CORs for instance)
onload             | Fires when the request has completed (even with Response Error Status code in the 400 or the 500)
ontimeout          | Fires when the timeout has been exceeded (if the client code specified a timeout value). Onerror won't fire.
onloadend          | Fires when the request has completed, regardless of whether there was an error or not.
onreadystatechange | Deprecated

### XMLHttpRequest Response Properties
The XMLHttpRequest exposes response properties to inspect request state

[TODO] Où est renseigné 'ResponseType'?

property     | Description
& methods
---                   | ---
status                | HTTP status code (for example, 200 for a successful request).
statusText            | response string returned by the server (for example, OK for a successful request).
response              | body of the response, in the format defined by responseType. If client required JSON, the response will be a JSON object parsed from the response body.
responseText          | body of the response as a string. Can only be used if responseType was not set or was set as text .
responseXML           | body of the response as a DOM element (XML is here for historical reasons). Can only be used if responseType was not set or was set as document .
getResponseHeader     | method to get a response header
getAllResponseHeaders | method to get all response headers

CORs - Cross Origin Request Sharing
------------------------------------

### Same origin policy 
By default in browser-javascript can only execute an XHR request 'same origin', ie with same domain (localhost is different from 127.0.0.1!), same protocol and same port as it's own HTML page
CORs is a mechanism to allow cross domain request

**note** 
  - for GET requests, the server do respond to the browser whatever its origin; the browser then shows or hides the response to the user depending on the origin policy 
  - [TODO] Je ne comprends pas en quoi ce mécanisme apporte quelque sécurité que ce soit pour le user ...
    + Sécurité du User: c'est le serveur qui décide d'autoriser ou non la requête
    + Sécurité du serveur: il suffit de ne pas faire la requête depuis un browser pour contourner la same origin policy

### Server authorization settings
During a CORs, the browser automatically adds an Origin header to identify the client

Header                           | Description
---                              | ---
Origin: http:www.domain.com:1111 | example Origin Request Header


#### CORs Enabling
  - to enable CORs, the server must set the following headers:


Header                                             | Description
---                                                | ---
'Access-Control-Allow-Origin:*'                    | allow every origin*
Access-Control-Allow-Origin: http://localhost:1111 | allow only request from JS served by http://localhost:1111


#### Response Header
by default, CORs only allow access to following response headers.
Other response headers have to be white-listed by the server.

  - Cache-Control
  - Content-Language
  - Content-Type
  - Expires
  - Last-Modified
  - Pragma

#### Credentials (cookies, client side SSL)
  - unlike same origin request, by default CORs requests don't include cookies
  - to force credential inclusion do : `xhr.withCredentials = true`  (will fail if not authorized by server)
  

#### example code 
##### Using cors module
Cors is a node module compatible with express that respects good practices

```js
var express = require('express')
var cors = require('cors')
var app = express()

var SERVER_PORT=9999

// Here we set the directory that is served publicly
// here is it the script folder but could be anything accessible on the file system
app.use(express.static(__dirname))

// dummy posts
POSTS = ...

// use wide open cors policy
app.use(cors())

// we define the API
app.get('/api/posts',function(req,res){
  res.json(POSTS)
})

app.delete('/api/posts/:id', function(req,res){
  // ...
  res.json(POSTS)
})

app.listen(SERVER_PORT, function(){
  console.log('Server Started on 127.0.0.1:'+ SERVER_PORT)
})
```

##### Manual settings
For documentation purpose. Don't do that.
```js

var express = require('express')

// dummy posts
var POSTS = ...

var SERVER_PORT=9999
var app = express()

// Here we set the directory that is served publicly
// here is it the script folder but could be anything accessible on the file system
app.use(express.static(__dirname))

// Here we show how to manually set CORs policy

// AllowCrossDomain is a custom middleware that we use to add the Cors Access Control Header
function allowCrossDomain(req, res, next){            
  // get the origin so we can be chirurgical if we want to...
  var origin = req.get('origin')

  if ('OPTIONS'==req.method){
    // this a preflight CORs request: following settings are very open. Play it safe by restricting as much as possible
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE,PATCH,OPTIONS');
    res.header('Access-Control-Allow-Headers', 'Content-Type, Authorization, Content-Length, X-Requested-With');
  } else { 
    // this is a simple request.  following settings are very open. Play it safe by restricting as much as possible
    res.header('Access-Control-Allow-Origin','*')
  }
  next()
}
app.use(allowCrossDomain)

// if we need a specific CORs config per route, yes we can...
// here we catch all routes but we can be as specific as needed with normal routes or even with regular expressions
app.options('*', function (req, res) {
    var origin = req.get('origin');
    // ...
    res.send(200); // only if we don't use options route (see below) 
});


// we define the API
app.get('/api/posts',function(req,res){
  res.json(POSTS)
})

app.delete('/api/posts/:id', function(req,res){
  // ...
  res.json(POSTS)
})


app.listen(SERVER_PORT, function(){
  console.log('Server Started on 127.0.0.1:'+ SERVER_PORT)
})
```
