This is [-Cheatsheets-](.) — a collection of cheatsheets I've written.

Lodash
======

-   [Like](https://www.facebook.com/sharer/sharer.php?u=http://ricostacruz.com/cheatsheets/lodash.html)
-   [Tweet](https://twitter.com/intent/tweet?text=The%20ultimate%20cheatsheet%20for%20Lodash.%20http://ricostacruz.com/cheatsheets/lodash.html)
-   [+1](https://plus.google.com/share?url=http://ricostacruz.com/cheatsheets/lodash.html)

> This is an incomplete list.

Collections
-----------

Works for both arrays and objects.

~~~~ {.highlight}
_.filter(list, (n) => n % 2)    //=> Array
_.find(list, (n) => n % 2)      //=> item
_.findRight(list, ...)          //=> item
~~~~

### Accessing

~~~~ {.highlight}
_.at([ abcd ], 0)               //=> [ a ] - same as list[0]
_.at([ abcd ], [ 0, 1 ])        //=> [ ab ]
~~~~

### Set/get

~~~~ {.highlight}
_.set(object, 'users[0].name', value)
_.get(object, 'users[0].name')
_.get(object, ['users', 0, 'name'])
~~~~

### Iteration

~~~~ {.highlight}
_.forEach(list, (item, i) => ...)
_.forEachRight(list, ...)

_.map(list, ...)
~~~~

~~~~ {.highlight}
_.every(users, (u) => u.active)  //=> true|false (aka _.all)
_.any(users, ...)                //=> true|false (aka _.some)
~~~~

Array
-----

~~~~ {.highlight}
_.chunk([ abcd ], 2)           //=> [ [ab], [cd] ]
_.compact(list)

_.fill(Array(4), 'x')          //=> [ 'x', 'x', 'x', 'x' ]
_.flatten
_.flattenDeep
~~~~

### Filtering

~~~~ {.highlight}
_.drop([ abcdef ], 2)          //=> [   cdef ]
_.dropRight([ abcdef ], 2)     //=> [ abcd   ]
_.take([ abcdef ], 2)          //=> [ ab     ]
_.takeRight([ abcdef ], 2)     //=> [     de ]

_.initial([ abcdef ])          //=> [ abcde  ] - dropRight(list, 1)
_.rest([ abcdef ])             //=> [  bcdef ] - takeRight(list, 1)

_.slice([ abcdef ], 2, 4)      //=> [   cd   ]

_.dropWhile(list, 'active')            // works like filter
_.dropWhile(list, 'active', true)
_.dropWhile(list, { active: true })
_.dropWhile(list, (n) => ...)
_.dropRightWhile(list, ...)

_.without([ abcde ], b)        //=> [ acde ]

_.remove(list, (n) => n % 2)
~~~~

### Accessing

~~~~ {.highlight}
_.first([ abcdef ])            //=> a
_.last([ abcdef ])             //=> f
~~~~

### Sets

~~~~ {.highlight}
_.uniq()
_.difference([ abc ], [ bc ])       //=> [ a    ]
_.intersection([ abc ], [ bcd ])    //=> [  bc  ]
_.union([ abc ], [ bcd ])           //=> [ abcd ] (unique)

Array#concat()
~~~~

### Indexes

~~~~ {.highlight}
_.findIndex
_.findLastIndex

_.sortedIndex(list, val)
_.sortedLastIndex(list, val)

_.indexOf(list, val)
~~~~

Functions
---------

### Currying

~~~~ {.highlight}
greet = (greeting, name) => `${greeting}, ${name}!`
~~~~

~~~~ {.highlight}
fn = _.partial(fn, 'hi')
fn('joe')    //=> 'hi, joe!'

_.partial(fn, 'joe')
fn('yo')     //=> 'yo, joe!'
~~~~

~~~~ {.highlight}
_.curry(greet)('hi')         //=> function(name)
_.curryRight(greet)('joe')   //=> function(greet)
~~~~

Functions - decorating
----------------------

### Throttling

~~~~ {.highlight}
_.throttle(fn)
_.debounce(fn)
~~~~

### Limiting

~~~~ {.highlight}
_.before(5, fn)         // only works 5 times
_.after(5, fn)          // works only after 5 times
_.once(fn)              // like _.before(fn, 1)
~~~~

### Etc

~~~~ {.highlight}
_.wrap(_.escape, (name) => `hi ${name}`)
// same as doing `name = _.escape(name)`

_.delay(fn, 2000)

_.negate(fn)

_.memoize(fn)
_.memoize(fn, ...)
~~~~

Strings
-------

### Capitalization

~~~~ {.highlight}
_.capitalize('hello world')   //=> 'Hello world'
_.startCase('hello_world')    //=> 'Hello World'
_.snakeCase('hello world')    //=> 'hello_world'
_.kebabCase('hello world')    //=> 'hello-world'
_.camelCase('hello world')    //=> 'helloWorld'
~~~~

### Padding

~~~~ {.highlight}
_.pad('abc', 8)           //=> '   abc  '
_.padLeft('abc', 8)       //=> '     abc'
_.padLeft('abc', 8, '-')  //=> '00000abc'
_.padRight(...)
~~~~

### Trim

~~~~ {.highlight}
_.trim('  str  ')
_.trimLeft('  str  ')
_.trimRight('  str  ')
~~~~

### Etc

~~~~ {.highlight}
_.repeat('-', 2)              //=> '--'
_.deburr('déjà vu')           //=> 'deja vu'
_.trunc('hello world', 5)     //=> 'hello...'
~~~~

~~~~ {.highlight}
_.startsWith('abc', 'a')   //=> true
_.endsWith('abc', 'c')     //=> true
~~~~

Objects
-------

~~~~ {.highlight}
_.keys(obj)
_.values(obj)
~~~~

Chaining
--------

~~~~ {.highlight}
_([1, 2, 3])
  .reduce((total, n) => total + n)
  .map((n) => n * n)
  .tap(console.log)
  .thru((n) => n.reverse())
  .value()
~~~~

-   [Like](https://www.facebook.com/sharer/sharer.php?u=http://ricostacruz.com/cheatsheets/lodash.html)
-   [Tweet](https://twitter.com/intent/tweet?text=The%20ultimate%20cheatsheet%20for%20Lodash.%20http://ricostacruz.com/cheatsheets/lodash.html)
-   [+1](https://plus.google.com/share?url=http://ricostacruz.com/cheatsheets/lodash.html)

**[Cheatsheets](.)** is a collection of cheatsheets I've written over
the years. Suggestions and corrections? [Send them
in](https://github.com/rstacruz/cheatsheets/issues). ** I'm [Rico Sta.
Cruz](http://ricostacruz.com). Check out my [Today I learned
blog](http://ricostacruz.com/til) for more.

[](.#toc)


01 Jun 2015 • on [english](https://yannbertrand.github.io/tag/english),
[tech](https://yannbertrand.github.io/tag/tech),
[js](https://yannbertrand.github.io/tag/js) ![profile image for Yann
Bertrand](https://avatars.githubusercontent.com/u/5855339?v=3) by Yann
Bertrand

My lodash/underscore.js Cheatsheet {.post-title}
==================================

This cheatsheet’s aim is to simplify the lodash library docs. However
the complete docs can be found at
[https://lodash.com/docs](https://lodash.com/docs).

About lodash {#_about_lodash}
------------

Lodash is a utility library delivering consistency, modularity,
performance, & extras.

Collection {#_collection}
----------

### \_.forEach(`collection`, `[iteratee]`) {#__foreach_code_collection_code_code_iteratee_code}

Iterates over elements of `collection` invoking `iteratee` for each
element. The `iteratee` is invoked with three arguments: (value,
index|key, collection). Iteratee functions may exit iteration early by
explicitly returning `false`.

**Arguments**

1.  `collection` Array|Object|String: The collection to iterate over.

2.  `[iteratee=_.identity]` Function: The function invoked per
    iteration.

**Examples**

~~~~ {.highlight}
_([1, 2]).forEach(function(n) {
    console.log(n);
}).value();
// → logs each value from left to right and returns the array

_.forEach({ 'a': 1, 'b': 2 }, function(n, key) {
    console.log(n, key);
});
// → logs each value-key pair and returns the object (iteration order is not guaranteed)
~~~~

### \_.includes(`collection`, `target`) {#__includes_code_collection_code_code_target_code}

Checks if value is in `collection` using \`SameValueZero for equality
comparisons.

**Arguments**

1.  `collection` Array|Object|String: The collection to search.

2.  `target` \*: The value to search for.

**Returns**

boolean: Returns `true` if a matching element is found, else `false`.

**Examples**

~~~~ {.highlight}
_.includes([1, 2, 3], 1);
// → true

_.includes([1, 2, 3], 1, 2);
// → false

_.includes({ 'user': 'fred', 'age': 40 }, 'fred');
// → true

_.includes('pebbles', 'eb');
// → true
~~~~

### \_.pluck(`collection`, `path`) {#__pluck_code_collection_code_code_path_code}

Gets the property value of `path` from all elements in `collection`.

**Typical usage**

Log a property of an object in an array.

**Arguments**

1.  `collection` Array|Object|string: The collection to iterate over.

2.  `path` Array|string: The path of the property to pluck.

**Returns**

Array: Returns the property values.

**Examples**

~~~~ {.highlight}
var users = [
  { 'user': 'barney', 'age': 36 },
  { 'user': 'fred',   'age': 40 }
];

_.pluck(users, 'user');
// → ['barney', 'fred']

var userIndex = _.indexBy(users, 'user');
_.pluck(userIndex, 'age');
// → [36, 40] (iteration order is not guaranteed)
~~~~

Lang {#_lang}
----

### \_.clone(`value`) {#__clone_code_value_code}

Creates a clone of ̀`value`.

**Typical usage**

To avoid updating an object reference.

**Arguments**

1.  `value` \*: The value to clone.

**Returns**

`boolean`: Returns `true` if a matching element is found, else `false`.

**Examples**

~~~~ {.highlight}
var users = [
  { 'user': 'barney' },
  { 'user': 'fred' }
];

var shallow = _.clone(users);
shallow[0] === users[0];
// → true
~~~~
# lodash-cheatsheet

## _.map
map is used to take an array, array of objects, a string or an object and create a new array from the relavant vaule sto the function or key that you provide.

Examples
##### 1
```
var numbers = [1,2,3,4,5]

var findEven = (n) => {
  if(n % 2 === 0) {
    return(n)
  }
}

_.map(numbers, findEven)
```

this will return an array that looks like this in the console
```
[undefined,2,undefined,4,undefined]
```
if you are using react it will remove the undefineds' for you.

##### 2
