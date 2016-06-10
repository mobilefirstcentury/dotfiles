---- ECMAScript 6 Cheatsheet ----
==================================


Node.js Compatibility
---------------------
**note** list of compatibilites can be found here:
  - [Kangax ECMAScript 6 compatibility table](http://kangax.github.io/compat-table/es6/)
  - [Node.green](http://node.green/)
### Node v6.0.x
[TODO]

### Node v5.0.x

#### Stable features
by defaut Node.js support most ES6 features:

  - Block scoping
    - let (strict mode only)                             r
    - const
    - function-in-blocks (strict mode only [1])
  - Classes (strict mode only)
  - Collections
    - Map
    - WeakMap
    - Set
    - WeakSet
  - Typed arrays
  - Generators
  - Binary and Octal literals
  - Object literal extensions (shorthand properties and methods)
  - Promises
  - New String methods
  - Symbols
  - Template strings
  - Arrow Functions
  - new.target [2]
  - Object.assign
  - Spread operator [2]

#### staged features
"staged" features are enabled by '--harmony' (or --es_staging) options

  - Symbol.toStringTag  | --harmony_tostring)
  - Array.prototype.includes | --harmony_array_includes
  - Rest Parameters | --harmony_rest_parameters

**note** list of staged features 
  $ node --v8-options | grep harmony_ | grep -v progress    

#### In progress features
In progress features are enabled inidividually by specific options:
  $ node --v8-options | grep "in progress"  # get the list of in progress features for current Node version

  - harmony modules                       | --harmony_modules
  - regular expression extensions         | --harmony_regexps
  - harmony proxies                       | --harmony_proxies
  - harmony sloppy function block scoping | --harmony_sloppy_function
  - harmony let in sloppy mode            | --harmony_sloppy_let
  - harmony unicode regexps               | --harmony_unicode_regexps
  - harmony Reflect API                   | --harmony_reflect
  - harmony destructuring                 | --harmony_destructuring
  - harmony default parameters            | --harmony_default_parameters
  - harmony sharedarraybuffer             | --harmony_sharedarraybuffer
  - harmony atomics                       | --harmony_atomics
  - harmony simd                          | --harmony_simd


Block scope
-----------

Reduce accidental errors

```js
// "let": define variables in the scope of a block (new in ES6)
// "var": define variables in the scope of the entire function.
console.log(a); // "undefined": a is declared below, but is function-scoped!
{
  var a = 'Hello';
  let b = 'world';
  console.log(`${a} ${b}`); // "Hello world", see template literals
}
console.log(`${a} ${b}`); // will throw: b is defined in the scope of the block
```

Arrow functions
--------------

Putting the fun in functions

```js
// In the simplest form, '() => expr' is equivalent to
// function() { return expr; }, so using ES6's Array.from
// we can quickly generate an array with random numbers.
let randArr = Array.from({length: 100}, () => Math.random()*1000);

// The lefthand side of the arrow function enumerates the parameters. If it's
// just one, we don't need parentheses around it.
randArr = randArr.map(v => Math.floor(v));

// With more parameters, we _do_ need the parentheses. On the righthand side,
// we can have any return expression (object literals need to be in regular
// parentheses to distinguish them from statement blocks).
let evenKeys = randArr.filter((v, k) => k % 2 === 0);

// We can also put statements on the righthand side -- in which case we
// have to write our own return statement, and create a { block }.
// Let's use ES6's some() to see if we have numbers in the range 30...50.
console.log(evenKeys.some(v => {
  if (typeof v !== 'number') throw new TypeError('Give me numbers.');
  return v >= 30 && v <= 50;
}));

// One neat thing: 'this' is set to the function's enclosing context --
// no need to bind() arrow functions to 'this' or use hacks like 'self=this'!
function SlowPrinter(arr, timer = 50) { // ES6 default assignment
  this.arr = arr.slice(); // make a copy
  this.timer = timer;
  this.busy = false;
  this.print = function() {
    if (this.busy) return false;
    this.busy = true;
    // With a regular function, this would now be undefined in strict mode
    setTimeout(() => {
      this.busy = false;
      console.log(this.arr.shift());
      if (this.arr.length) this.print();
    }, this.timer);
  };
}
new SlowPrinter(evenKeys, 25).print();
```

Template literals
-----------------

Interpolation, multiline strings, quick transformations

```js
// Backticks enclose a template literal; ${} interpolates arbitrary expressions
let num = 99; // see block scope
console.log(`${num} bottles of beer on the wall, ${num} bottles of beer
Take one down and pass it around, ${--num} bottles of beer!`);

// Tagged form: Attach a function that processes string fragments and evaluated
// expressions
function celsius(strings, ...values) {
  let rv = '';
  strings.forEach((string, index) => { // See arrow functions
    rv += string;
    if (typeof values[index] !== 'undefined')
      rv += Math.round((values[index] - 32) / 1.8);
  });
  return rv;
}

// Converts all the interpolated numbers to the proper unit
console.log(celsius `Today temperatures ranged from ${60} to ${65} degrees.`);
```

Classes
-------

Syntactic sugar for constructors

```js
class Monster {
  constructor() {
    this.maxDamage = 5;
    this.icon = '%';
  }
  bite(victim) { // same as Monster.prototype.bite
    console.log(this.icon + ' bites!');
    this._dmg(victim);
  }
  _dmg(victim, maxDamage = this.maxDamage) { // ES6 feature: default value
    let dmg = Math.floor(Math.random() * maxDamage + 1);
    victim.hp -= dmg;
    console.log('You suffer ' + dmg + ' points of damage.');
  }
}

// Using extends here has the same effect as:
// Rat.prototype = Object.create(Monster.prototype);
// Rat.prototype.constructor = Rat;
class Rat extends Monster {
  constructor() {
    super(); // same as Monster.call(this)
    this.icon = 'r';
  }
  breathe(victim) {
    if (victim.distance < 2) {
      console.log(this.icon + ' is using its proximity breathing attack!');
      this._dmg(victim, 3);
    }
  }
}

let rat = new Rat();
let hero = {
  hp: 20,
  distance: 1
};
rat.bite(hero);
rat.breathe(hero);
```

Promises
---------

Useful for asynchronous programming

```js
// fetch() is a WHATWG spec supported by some modern browsers as an alternative to XMLHttpRequest.
// Notably, it returns Promises both for the initial response header, and for the body stream, so we can chain up an execution pipeline using then().

fetch('http://localhost/', {
    mode: 'same-origin'
})
.then(function(response) {
  console.log('Status', response.status);
  return response.text();
})
.then(function(text) { // We got the header before the body streams through
  console.log('Body', text);
})
.catch(function(e) { // Catch all the things!
  console.warn('There was a problem:', e.message);
});

```


Making Promises
--------------

Wrap existing callback-based functions to return Promise objects

```js
// Let's make a "setTimeout" that works with promises instead of vanilla
// callbacks. Note the function we pass to the constructor is executed
// immediately once we create a new Promise.
function wait(time) {
  // See arrow functions
  return new Promise((resolve, reject) => {
    setTimeout(resolve, time);
  });
}

// This will start an actual timer, but do nothing upon its completion.
wait(3000);

// So let's build some functions that allow us to make an execution chain.
function causeProblems() {
  throw new Error('You wanted problems? You got em!');
}

function apologize() {
  console.log('Sorry about the mess.');
}

function ignoreProblems(error) {
  console.log('Ignored problems successfully:', error);
}

// apologize() will be called after a second.
wait(1000).then(apologize);

// apologize() will _not_ be called, due to the error.
wait(2000).then(causeProblems).then(apologize, ignoreProblems);

// Since we know this, we can use catch(), which does not take a resolve handler
wait(3000).then(causeProblems).catch(ignoreProblems);
```

Generators
----------

Pause and remote-control your functions

```js
// A generator function will return an object that implements the iteration
// protocol, i.e., it has a next() method that returns
// { value: < some value>, done: <true or false> }
function* incRand(max) { // Asterisk defines this as a generator function
  while (true) {
    // Pause execution after the yield, resume when next(<something>) is called
    // and assign <something> to x
    let x = yield Math.floor(Math.random() * max + 1);
    max += x;
  }
}
var rng = incRand(2); // Now we have a generator object to work with
console.log(rng.next()); // { value: <between 1 and 2>, done: false }
console.log(rng.next(3)); // as above, but between 1 and 5
console.log(rng.next()); // as above, but NaN since 5 + undefined results in NaN
console.log(rng.next(20)); // Oops, looks like we broke it! NaN again.
rng.throw(new Error('Unrecoverable generator state.')); // Will be thrown from yield
```


Property value shorthand
--------------------


Don't repeat yourself

```js
var firstName = 'Grover';
var lastName = 'Cleveland';
var person = { firstName, lastName }; // Same as firstName: firstName, lastName: lastName
console.log(person.lastName); // 'Cleveland'
```


Destructuring
-------------

Quickly extract values from objects and arrays

```js
// Using destructuring we can quickly assign arbitrary subsets of object
// properties to eponymous variables
let animal = { type: 'dog', sound: 'woof', paws: 4 };
let {name, sound, paws} = animal;
console.log(sound, name); /// "woof undefined"

// This also works for function parameters (here used w/ an arrow function
// returning a template string)
var fmt = ({id, name}) => `${id}: ${name}`;
console.log(fmt({ id: 1, name: 'joe'})); // "1: joe"

// Arrays work pretty much the same, but the variable name is irrelevant.
// We don't have to destructure the whole thing, but here we also use the
// ...spread operator to capture the rest of the array.
let [n1, n2, n3, n4, ...r] = [100, 'three', 34, {number: 23}, 694, 'eighteen'];
console.log(n1, n2, n3, n4); // "100 'three' 34 { number: 23 }"
console.log(r); // "[ 694, 'eighteen' ]"
```


Symbols as keys
---------------

Call `Symbol()` to get a unique identifier

```js
// Symbols are guaranteed to be unique, and as such a good alternative to
// string constants. Here we use them for a super-basic spam classifier
// anyone can add to without risking conflict with existing classifiers.
// Descriptions are optional and don't factor into uniqueness comparisons.
const ALL_CAPS_NAME = Symbol('name in all caps');
const DOMAIN_DIGITS = Symbol('lots of digits in domain name');
var senderClassifiers = [
  (header) => { // See arrow functions
    var r = /^From: (.*) </.exec(header) || [];
    return r[1] && r[1] === r[1].toUpperCase() ? [ALL_CAPS_NAME, 0.5] : null;
  },
  (header) => {
    var r = /^From:.*@(.*)>/.exec(header) || [];
    return r[1] && r[1].match(/\d\d\d/) ? [DOMAIN_DIGITS, 0.2] : null;
  }
];

function scoreHeaders(arr) {
  return arr.map(header => {
    let score = 0;
    senderClassifiers.forEach((cl) => {
      let rv = cl(header);
      if (rv && rv[1]) score += rv[1];
    });
    return {
      score, header // See shorthand assignment
    };
  });
}
console.dir(scoreHeaders([
    'From: SATAN <satan@ilove666.com>',
    'From: POTUS <president@whitehouse.gov>',
    'From: Your Mom <mom@home>'
]));
```


Using well-known Symbols
-------------------------

`Symbol.iterator` can be used to make your own iterators

```js
// By following the iteration protocol, we can make any object iterable
// via for .. of loops, the ...spread operator, and destructuring. Generators
// give us objects that follow this protocol. Let's implement it ourselves
// to make an array popper that also timestamps objects.
function tspop(arr) {
  function next() {
    let value = arr.pop();
    if (typeof value !== 'undefined') {
      if (typeof value === 'object')
        value.ts = Date.now();
      // This format is prescribed by the protocol.
      return { value, done: false }; // ES6 shorthand property
    }
    else
      // We can omit value when we're done.
      return { done: true };
  }
  // The Symbol.iterator is a "well-known Symbol" in ES6 which we can use to
  // give any object a function that returns objects that implement the
  // iteration protocol, i.e. a next() function that returns { value, done }.
  this[Symbol.iterator] = () => ({ next }); // ES6 shorthand property
}
var db = [{ name: 'jm', age: 36}, {name: 'ck', age: 15}, {name: 'ob', age: 85}];
var p = new tspop(db);
for (var l of p) // Whee! Thank you, iteration protocol!
  console.log(l);
```

