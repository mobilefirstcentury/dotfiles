---- Async in Javascript User Guide ----
=============================================

Promises
--------

### Node.js async control flow convention
In node.js, async code is based on a 'error-first callback-last convention':

  - Async functions are written that way:
    ```js
    function getURL(url, callback) {
      // make request
      // eventually call with error provided as first argument `cb(error,result)`
    }
  ```
  - Async functions are then called with an anonymous callback in last position:
  ```js
  getURL(url,function(error,result){
    if(error){
      // hande error
    } else {
      // handle result
    }
  })
  ```
### Promise async control flow convention

#### writing promises
Async functions using promises are written that way:
  ```js
  function getURL(url){
    return new Promise(function(resolve,reject){
      // make request
      // eventually call `resolve(fulfillment)` if everything is ok
      // otherwise call `reject(reason)` if an error occurs
    })
  }
  ```
#### using promises
Promises are then used with 'then' and 'catch' clauses
  ```js
    getUrl(url)                           //getUrl now returns a promise
      .catch(function(reason){
        // do something with reason
      })
      .then(function(fulfillment){
        // do something with fulfillment array
        // return nothing : promise game is over (if no errors are already catched otherwise returns a promise with error reason waiting to be consumed with a 'catch' call
        // return a non promise, it will be wrapped in a promise so 'then' calls can be chained
        // return a promise        // do something with fullfilment
      })
  ```

#### Exampe code
**note**
  - for main node.js standard function this can be done by using specialized modules like 'normalize/mz'
  - other callback-style functions can be promisified with modules like 'digitaldesignlabs/es6-promisify' 

we write a 'promisified' readFile function
    ```js
    // define readFile Function
    function readFile(file){
      return new Promise((resolve,reject)=> {
        fs.readFile(file, 'utf8', (err,data) => {
            if (err) {
              reject(err)
            } else {
              resolve(data)
            }
        })
      })
    }

    // use this function
    readFile('file.txt')
      .catch(err => echo(err))
      .then(content => {
        return readFile(filename.replace(/\n/,""))
      })
      .catch(err => echo(err))
      .then(content => echo(content))
    ```
#### Parallel execution with rendez-vous
One can create a rendez-vous:
  ```js
  Promise.all([p1,p2,p3])
    .catch(function(reason){                                // the first error raised by p1, p2 or p2 is catched here
      // do something with reason
    })
    .then(function(fulfillment){                            // wait for p1, p2 and p3 all return. fullfillement is the array of their results
      // do something with fulfillment array
      // return nothing : promise game is over (if no errors are already catched otherwise returns a promise with error reason waiting to be consumed with a 'catch' call
      // return a non promise, it will be wrapped in a promise so 'then' calls can be chained
      // return a promise        // do something with fullfilment
    })
  ```

#### Parallel execution with race
contrary to `Promise.all`, `Promise.race` will return when the first promise finishes  

#### Promise chains
Promises can be chained in complex async flow
  ```js
  step1()
  .catch(step1Failed)
  .then(step2)
  .catch(step2Failed)
  .then(function(msg){
    return Promise.all([
      step3a(msg),
      step3b(msg),
      step3c(msg)
      ])})
  .catch(step3Failed)
  .then(step4);
  ```


Iterables/Iterators What is it?
-------------------------------
### What is it ?
An **iterable** is an object that can produce an **iterator**.
An **iterator** has:
  - **next()** method than returns an object: 
  ```js
  {
    value: object
    done: boolean     // false when entirely consumed
  }
  ```
  - **return** method (optional) that does the clean up when the iterator is consumed (for example release a database connection)

**beware** the term 'iterator' is often used in place of `iterable`

### Write a custom iterable
An iterable can be it's own iterator

  ```js
  var it = {
    _i:0,  // internal data
    [Symbol.iterator]() { return this; }, // make the `it` iterator an iterable 
    next() { 
      let done = this._i > 100  // break condition
      return {
        value: done?this._i:this._i++,
        done: done
      } 
    }
    return() {
      _i = 0        // clean up 
      return "I'm done"
    }
  }

  for(let i of it){echo(i)} // Let's traverse with a for of. Will print values from 1 to 100
  ```
### Iterable traversal
An iterable can be traversed with `for of`:
  ```js
  for(let country of countries){
    echo(country)
  }
  ```
or with low-level access:
```js
  for(  let it=countries[Symbol.iterator](), country=it.next();     // `Symbol.iterator` is a 'meta' method of iterables that generate an iterator
        !country;
        country=it.next()
  ){
     echo(country.value)
  }
```

### Spread Operator and Destructuring with iterable

destructuring can partially consume an iterator:
  ```js
  var [first,second]= my-iterator     // my-iterator will be on third position if any
  ```
spread operator `...` will consume entirely the iterator
  ```js
  var ['entry',...it,'exit'] = it      // my-iterator.next().done is now false
  ```

spread operator `...` can exhaust an iterator:
  - my-function(...it)


### List of iterables

#### Arrays

#### Strings

#### Collections
##### maps
  ```javascript
  let map = new Map()
  map.set("foo",42)
  map.set({cool:true},"Hello World")
  let entries = map.entries   // this is an iterator
  echo(entrie.next())  // {value: ['foo',42], done:false}
  ```



Generators
----------

### Purpose
With generators asynchrone code can be written like synchrone code

### What is it?
A generator is a special function that behaves like an iterable in that it can produce an iterator. But:
  - iterable produce an iterator when their `Symbol.iterator` method is called
  - generator produce an iterator when called ( and doesn't have the `Symbol.iterator` method)

**generator definition**
  ```js
  function* my-generator(args) {
    ...
    name = yield <expr>    // `yield` is equivalent to 'What value should i used here? I'll pause until you tell me by calling `next(args)`'
    ...
    name = yield <expr> 
    ...
    return <expr>  // optional 
  }

  // or
  function* my-generator(args){
    while(<condition>){
      name = yield <expr>
      ...
    }
    return <expr>  // optional 
  }
  ```

**generator use**
  ```js  
  var it = my-generator(args)     // returns an iterator that can be consumed
  it.next()                       // first call always without arguments
  // call next until 'next(args).done' is true
    it.next(args)                 // subsequent calls with optional argument
  // call `next(args)` until `next(args).done` is true
  it.return(arg)                  // injects `return arg` at current yield position. Like any function clean-up code can be executed: `try{<generator code>} finally{<clean-up-code>}`
                                  // it.return() is called automatically by 'for of' and spread operator '...'
  it.throw(error)                 // injects `throw(error)` at current yield position. Like any function exception can be catched: `try{<generator code>} catch(error){...}`
  ```

### Manual Consumption

#### next() loop

**mecanism**
  - when called `my-generator(args)` a generator returns **immediately** an iterator (wich is also an iterable)
  - each call of `next(args)` on the iterator:
    + will:
      - activate or unfreeze the generator
      - injects `args` in place of `yield <expr>` so `name` will be assigned `args` (expect first `next` call that has no yield to replace and will ignore any argument passed)
      - execute code inside the generator until next `yield <expr>`
      - freeze the generator
      - return `<expr>`
    + until the generator is consumed (until break condition or no more yield)

**summary**
  ```js
  
  var it = foo();           // create the iterator

  // start up the generator
  it.next();                // -> { value: 1, done: false }        // 1 is the evaluation fo the right-hand expression of the first yield

  // answer first question, inside the generator the first `yield` will return "foo"
  it.next( "foo" );         // { value: 2, done: false }          // 2 is the evaluation of the right-hand expression of the second yield 

  // answer second question, inside  
  it.next( "bar" );         // { value: 3, done: false }          // 3 is the evaluation of the right-hand expression of the third yield

  // answer third question and evaluate the reste of the code of the generator (and any 'return clause' if any
  it.next( "baz" );         // { value: undefined OR value returned by optional return statement', done: true }   
  ```
### Automatic consumption

#### for of loop

In itsef a generator is **not** an iterable but when called (`my-generator()`) it returns an iterator (wich is also an iterable) that can be traversed with for of.
  ```js
  for(let value of my-generator()){
  ...
  }
  ```
**note** for of calls automatically the return method of the iterator


[TODO] 
  - Etendre `GeneratorPrototype` pour lui rajouter une method `Symbol.iterator` qui retourne `this()` (ce qui en ferait un iterable)
  - on pourra alors faire `for (let value of my-generator){...}`

#### spread operator
like iterables (see above)

#### With Generator runner 

#### How?
if a generators yields promises, a controlling library, A generic recursive code can consumme the generator by calling the iterator when the promises resolve or reject.
Several generic library, aka generator runners, exist.

#### 'tj/co'aka 'co' library
co is a library that can execute a generator.
co is supported natively in node 5.0 and in modern browsers

  - it can thin-wrap a synchone-like code:
  ```js
  co(function* main(){
    try{
      var filename = yield readFile(file)
      filename = filename.replace(/\n/,"") 
      echo(yield readFile(filename))
    }
    catch(error) {
        echo(error)
    }
  })
  ```

  - Or can generate a promise:
  ```js
  co(function*(){
    var filename = yield readFile(file)
    filename = filename.replace(/\n/,"") 
    return readFile(filename)
  })
  .catch(error => echo(error))
  .then(value => echo(value))
  ```


Async Flow control
------------------
with proper babel configuration (cf ~/help/babel.md), one can use ES7 async/await syntax with ES5:

**notes**
  - 'mz/fs' is a promisified version of fs module 
  - promisified versions of child_process, crypto, dns, fs, readline and zlib modules are provided by 'normalize/mz' module
  - under the hood the code is transpiled to generators (cf above) 
  - other callback-style functions can be promisified with modules like 'digitaldesignlabs/es6-promisify'

**example with readFile**
  ```js
  "use strict"
  const fs = require('mz/fs')
  var echo = (...args)=> console.log.apply(null,args)      // arrow functions does not provide arguments parameter.
                                                           // 'rest paramters' are a good alternative


  async function doAsync(){

    var file = 'file.txt'
    try{
      var filename = (await fs.readFile(file,'utf8')).replace(/\n/,"")
      echo(await fs.readFile(filename,'utf8'))
    }
    catch(error) {
      echo(error)
    }

  }        // [TODO] in current babel implementation, async function can't be directly invocated like in '(async function bla(){...})()'. Babel BUG?

  doAsync() 
  ```

**example with fetch**
  - fetch is the promise-compliante replacement of `XMLHttpRequest` that shoulb become standard in future version of JS ([TODO] When?)
  - isomorphic-fetch is a module implementing fetch for Node and the Browser 
  - 'api.randomuser.me' is a cool API that returns a ... random user

  ```js
  "use strict"

  require('isomorphic-fetch')
  var url = "http://api.randomuser.me"

  async function getUser(){
    try {
      return (await (await fetch(url)).json()).results[0]
    } 
    catch(err){echo(err)}
  }

  getUser().then(user=> echo(user))
  ```
