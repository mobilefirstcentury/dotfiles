---- jsonselect & jutil cheatsheet ----
=======================================

this is a list of tools for manipulating json data.
each tool are (should) be useable as a cli tool or as a javascript module on node or in the browser.
when not possible natively, wrappers are writter to accomodate this need.

jsonselect
-----------


### what is jsonselect ?

[jsonselect](http://jsonselect.org/) is a query language for json inspired by css selectors.
with jsonselect you can write small patterns that match against json documents.

### installation
#### cli tool
  $ npm install -g jsonselect-cli  # independant wrapper around jsonselect
  [todo] la doc demande un `make build`. pourquoi est-ce nécessaire?

#### node module
  $ npm install -s jsonselect   # in the directory of the program or script using this module.
  $ npm install jsonselect      # install in the root directory to allow use in any script ?

### basic use
**notes** jsonselect always return an array containing the objects or the scalars respecting the filter conditions.

#### cli tool
  - [todo] la doc demande un call ` node lib/index.js` au lieu de jsonselect-cli. réparer ça.
  - [todo] renommer l'executable jsonselector au lieu de jsonselect-cli

  $ jsonselect-cli ":root" < test/sample1.json
  $ jsonselect-cli ":root" -f test/sample1.json
  $ cat test/sample1.json | jsonselect-cli ":root" 
  
  
#### node module
  ```
  jsonselect = require('jsonselect');
  jsonselect.match(".books :has(.price:expr(x<20))", data));    # data is the json object to traverse
  jsonselect.foreach(".books :has(.price:expr(x<20))", data, callback)  # like match, but rather than returning an array, invokes the provided callback once per match as the matches are discovered.

  ```


### template selectors
  selectors are templatable

#### template examples 
  ```
  jsonselect.match(':has(?)', [ 'foo' ], data)  # ':has("foo")' is matched against data
  jsonselect.foreach(selector, [ values ], data, callback)  # like match, but rather than returning an array, invokes the provided callback once per match as the matches are discovered.
  ```

#### pre-compiled templates

  ```
  template = jsonselect.compile(selector, [ values ])   # template contains the compiled selector and has two properties: `match` and `foreach`.
                                                        # these two functions take a selector as an argument and instead use the compiled selector.
  ```


### filter with `:expr()`

** note ** `:expr()` is rather useless by itself. while it allows you to express constraints on values, it would only return the matching values themselves not the object respecting the
constraint.

given the following document:

    ```
    { "books": [
      { "price": 16.31,
        "name": "the unbearable lightness of being",
        "author": "milan kundera"
      },
      { "price": 23.09,
        "name": "javascript web applications",
        "author": "alex maccaw"
      },
      { "price": 106.00,
        "name": "compilers: principles, techniques, and tools",
        "author": "alfred v. aho"
      }
    ] }
    ```

get all the books prices (scalar prices values not objects ...) inferior to 40$ or between 20 and 40$

    ```
    ".books .price:expr(x <= 40.00)"  # -> [ 16.31, 23.09 ]
    ".books .price:expr(20 <= x && 40 >= x)"  # -> [ 23.09 ]
    ```

get all the books names (scalar names strings not objects ...) beginning with 'compilers'

    ```
    ".books .name:expr(x ^= "compilers")"   # -> ["compilers: principles, techniques, and tools"]
    ```


### filter with `:val()`

  ```
  `:val(v)` is a shorthand for `:expr(x = v)`,
  ```


### filter with `:contains()`
  
  ```
  `:contains(v)` is a shorthand for `:expr(x *= v)`.
  ```


### filter with `:has()`
unlike `:expr`, `:has` really returns the objects with descendants (direct or not) respecting the specified constraints:

get the full records for all books under 20$:

    ```
    ".books :has(.price:expr(x<20))"
    or 
    ":has(:root > .price:expr(x<20>))"   
    ```

    # weird logic above ! 
      - logic here: "has( .price:expr(x<20))" matches the milan kundera's book but also matches the root document :`:has` allows indirect desendants to respect the given constraints.
      - each object matched by `:has` becomes it's own root for evaluation of `:root`. thus the formulation above limits the `:has` condition to direct desendants only.
      - this is equivalent to `:has-child(.price:expr(x<20))` (not yet implemented)

get all the titles of books that are written by authors whose names are ‘alex maccaw’:

    ```
    ":has(:root > .author:val('alex maccaw')) > .name"   # is equivalent to ":has-child(.author:val('alex maccaw')) > .name" 
    ```


### matching siblings with `~`

in css `a ~ b` will only match `b` if it occurs after `a`.

jsonselect, the sibling combinator (`~`) has no ordering restrictions.

get all the titles of books that are written by authors whose names are ‘alex maccaw’:

    ```
    ".author:val("alex maccaw") ~ .name"    # much simpler syntax that weird ':root' use (see above)
                                            # the root object doesn't qualify here as it has no .name sibling :)
    ```
    
jutil
-----

### what is jutil ?

[jutil](https://github.com/misterfifths/jutil) are a group of cli commands (`jutil`, `jwhere`, `jfirst`, `jcount`, `jselect`, `jsort`, `jprops` and `jformat`) for command line json manipulation.     

** basic example **

  ```
  $ echo "{ name: 'mark zukerberg', compagny: 'facebook', country: 'us'}" | jutil 'return name'
  "mark zuckerberg"

  ```

### commands 

#### jselect
transforms input data 

** examples **

  ```
  $ echo '[ {"x": 1, "y": 2}, {"x": 2, "y": 3} ]' | jselect '{x: x, y: y, sum: x + y}'
    -> 
    [
        {
            "x": 1,
            "y": 2,
            "sum": 3
        },
        {
            "x": 2,
            "y": 3,
            "sum": 5
        }
    ]
  ```

#### jutil

jutil runs a script you in the context of the the provided json data and pretty prints and pages its result.

** note **:  

  - in the script, `$` refers to the loaded data (after any unwrapping).
  - the script is wrapped inside `with($) { ... }` : properties from the data can be directly referenced)

** options **
  - '-w' : dieables the script wrapping 
  - '-s' : disables pretty printing and pageing

#### jwhere

returns an array of objects that matches conditions provided

** examples **

  ```sh
  $ echo '[ {"x": 1, "y": 2}, {"x": 2, "y": 3}, {"x": 3, "y": 6} ]' | jwhere 'x + y > 4'
    ->
    [
        {
            "x": 2,
            "y": 3
        },
        {
            "x": 3,
            "y": 6
        }
    ]
  ```

  ````sh
  $ echo '[0, false, 4, "", "bob"]' | jwhere $
  ->
  [
      4,
      "bob"
  ]
  ````

#### jfirst

as jwhere but returns only the first object.

#### jcount

as jwhere buts return number of objects.


#### jsort
sorts inputed objects __array_ with a given sort key.

** note ** : if the input is not an array, it is not sorted.

** exampples **

  ```
  $ echo '[ {"x": 10, "y": 2}, {"x": 2, "y": 3} ]' | jsort 'x + y'
  ->
  [
      {
          "x": 2,
          "y": 3
      },
      {
          "x": 10,
          "y": 2
      }
  ]
  ```

  ```
  $ echo '[5, 2, 6, 10]' | jsort -r
  ->
  [
      10,
      6,
      5,
      2
  ]
  ```

** options **

  - '-r'  : reverse sorting order
  - 'i': case-insensitive string ordering 


#### jprops

a simpler jselect with items renaming

** examples **

  ```
  $ curl 'https://api.bitbucket.org/2.0/snippets/' | jprops -u values title url=links.self.href
  ```

  ```
  $ curl -s https://api.twitter.com/1/statuses/public_timeline.json | jprops text user=user.screen_name
    ->
    [
        {
            "text": "the edumooc news is out! http://t.co/mamjoauz ▸ top stories today via @jupidu @jankenb2",
            "user": "myweb2learn"
        },
        {
            "text": "#ipadtweet",
            "user": "the_dansullivan"
        },
        ...
    ]
  ```


#### jformat
-------

use a template to format json data as a string.
template tokens are : `%{expression}` or `%propertyname`

** note ** : the second token syntax does not understand dots

** examples **

  ```
  $ curl -s https://api.twitter.com/1/statuses/public_timeline.json |
    jformat "%{user.name}: %{user.statuses_count} tweets, follower/friend ratio: %{(user.followers_count / user.friends_count).tofixed(2)}"

    ->
    zuckerberg: 45716 tweets, follower/friend ratio: 1.33
    peterpan: 15045 tweets, follower/friend ratio: 1.18
    ...

  ```

### command pipes
jutil commands can be piped with ease.

** examples **


get the most active recent tweeter?

  ```
  $ curl -s https://api.twitter.com/1/statuses/public_timeline.json |
    jsort -r user.statuses_count |
    jfirst |
    jformat 'of the most recent tweeters, user %{user.name} has the most updates: %{user.statuses_count}'

    ->
    of the most recent tweeters, user jorge has the most updates: 36870
  ```

get language breakdown in the most recent gists?

  ```
  $ curl -s https://api.github.com/gists |
    jselect 'files[object.keys(files)[0]]' |
    jwhere language |
    jformat %language |
    sort | uniq -c | sort -nr
  
    -> 
    10 text
    3 xml
    3 ruby
    3 javascript
    2 html+erb
    2 groovy
    2 c#
    1 shell
    1 php
  ```

[todo] pas compris cet example.
shit aparrish's @everyword says:

  ```sh
  $ curl -s http://api.twitter.com/1/statuses/user_timeline.json?screen_name=everyword |
    jformat -n '%text, ' |
    say -v alex -f -
  ```

### Advanced use


#### unwrapping

Many json apis wrap their real __payload__ in an object with metadata (pagination information, rate limits, etc.)

**examples** of unwrapping payload: 

  ```
  $ echo '{ "payload": [ { "x": 2, "y": 3 }, { "x": 4, "y": 6 } ] }' |
    jutil 'return payload' |
    jformat 'sum: %{x + y}'

    -> 
    sum: 5
    sum: 10
  ```

  ```
  $ echo '{ "payload": [ { "x": 2, "y": 3 }, { "x": 4, "y": 6 } ] }' | jformat -u payload 'sum: %{x + y}'

    -> 
    sum: 5
    sum: 10
  ```


#### modules

to make scriptwriting easier, you may wish to define a set of frequently-used functions or include utility libraries in the environment where jutil evaluates its input.
you can include modules in two ways:
 + by pointing jutil at a directory :
   - in which case all .js files in that directory will be loaded — the `-m` or `--module-dir` option
   - by default, the directory `~/.jutil/modules` will be searched if it exists.
 - by pointing at individual files with `-m` or `--module`.

**examples**


  ```
  # first download underscore lib in '~/.jutil/modules' and then ...
  $ echo "[3, 4, 1]" | jutil 'return _.shuffle($)'
    ->
    [
        4,
        3,
        1
    ]
  ```

  ```
  # define a custom function in a file saved in '~/.jutil/modules'
  function $md5(str) {
      var hasher = require('crypto').createhash('md5');
      hasher.update(str, 'utf8');
      return hasher.digest('base64');
  }
  
  # then ...
  $ echo '[ { "name": "sam" }, { "name": "lou" } ]' | jselect '{ name: name, hash: $md5(name) }'
    ->
    [
        {
            "hash": "ug4m3hv3lcjunciazq/ggg==",
            "name": "sam"
        },
        {
            "hash": "qali+cwlwug7dnmzsv2wrw==",
            "name": "lou"
        }
    ]
  ```


#### globals in the script execution context

The following globals are available in the script execution context:

  - `$config` : the contents of the user's [config file](#configfiles), or the default configuration if no config file was loaded
  - `$`       : currently processed json object
  - `this`    : currently processed json object
  - `$$`      : all of the loaded data, after any [unwrapping](#unwrapping)
  - `out`     : an alias for `console.log`



#### configuration

jutil's behaviour is configurable throught `~/.jutil/config` file or any other file indicated by `-c` option.

** example **

  ```
  var config = { alwayssortkeys: true };
  ```

** default configuration **

    ```
      var config  = {
        // all files with a .js extension in these directories will be loaded
        // before evaulating the input.
        moduledirectories: ['~/.jutil/modules'],
        
        // controls spacing in pretty-printed output (when using the default
        // prettyprinter function). can be a character (like '\t') or an
        // integer, in which case it represents a number of spaces to use.
        prettyprintindent: 4,
        
        // the function used to serialize an object into a human-readable
        // string (typically json, but if you override inputparser below,
        // could really be anything you want). the function takes two
        // arguments:
        // config: the current application configuration, as specified in
        // the configuration file
        // obj: the object to format
        // return a 'pretty' string representation of obj.
        prettyprinter: function(config, obj) {
            return json.stringify(obj, null, config.prettyprintindent) + '\n';
        },

        // the function used to serialize an object into a string when
        // pretty-printing is off (typically json, but really whatever,
        // as long as inputparser below understands it). the function
        // takes two arguments:
        // config: the current application configuration, as specified in
        // the configuration file
        // obj: the object to format
        // return the string representation of obj.
        unprettyprinter: function(config, obj) {
            return json.stringify(obj);
        },
        
        // the function used to deserialize the input string (typically json,
        // but you could override this to handle whatever) into an object.
        // the function takes two arguments:
        // config: the current application configuration, as specified in
        // the configuration file
        // input: the string to parse.
        // return the deserialized object, or throw an exception if the
        // given string is not valid.
        inputparser: function(config, input) {
            return json.parse(input);
        },
        
        // always pretty-print the output. not recommend (as it's a waste of
        // cycles) if you do a lot of piping of output.
        alwaysprettyprint: false,
        
        // by default, if stdout is a terminal, the output will be pretty-printed
        // and, if it is larger than your window, piped into your pager (the pager
        // environment variable or 'less', by default). setting this to true
        // disables that behavior.
        disablesmartoutput: false,
        
        // always sort keys in the output. useful for automated testing or
        // doing diffs against the results.
        alwayssortkeys: false,
        
        // for commands that take a script to execute, don't wrap that script
        // inside "with($) { ... }", which is the default behavior. the clause
        // makes for less typing (you can reference properties of the input data
        // without "$." before them), but can cause issues if the data has a
        // property with a name that hides some useful variable or function.
        disablewithclause: false,
        
        // always attempt to extract a useful property of the incoming data.
        // this passes the incoming data through the autounwrapper function
        // before running the script against it.
        alwaysautounwrap: false,
        
        // a list of property names to be extracted when using the default
        // autounwrapper function.
        autounwrapproperties: [],
        
        // the function used to attempt to extract a useful property of the
        // incoming data. the function takes 2 arguments:
        // config: the current application configuration, as specified in
        // the configuration file
        // obj: the object parsed from the incoming data
        // it should return a "useful" property from obj (or obj itself if
        // appropriate). "useful" can mean many things, but really this is
        // intended to handle json apis that returned arrays wrapped in
        // objects, to work around the issue discussed here: http://bit.ly/m3el.
        // the default function does the following:
        // if obj is an object that only has one property, and the value of
        // that property is an object or an array, return that value.
        // otherwise if obj has a property named the same as one in the
        // autounwrapproperties array, the value of the first matching
        // property is returned.
        autounwrapper: function(config, obj) {
            if(typeof obj != 'object' || array.isarray(obj))
                return obj;

            var propname,
                onlypropname,
                foundone = false,
                val,
                i;

            for(propname in obj) {
                if(obj.hasownproperty(propname)) {
                    foundone = true;
                
                    if(onlypropname) {
                        onlypropname = undefined;
                        break;
                    }

                    onlypropname = propname;
                }
            }
            
            if(!foundone) {
                // this object has no properties; nothing we can do
                return obj;
            }
            
            if(onlypropname) {
                val = obj[onlypropname];
                if(typeof val == 'object' && val !== null)
                    return val;
            }
            
            // more than one property. cross-reference with autounwrapproperties
            for(i = 0; i < config.autounwrapproperties.length; i++) {
                propname = config.autounwrapproperties[i];
                if(obj.hasownproperty(propname))
                    return obj[propname];
            }
            
            // no luck; pass through original object
            return obj;
        }
    };

    ``

jtree
-----
### what is Jtree ?
**note**:
  - Jtree is renamed copy of https://github.com/kumavis/jsonogram that we freely modify to meet our needs.
  - it is installed in ~/scripts/

Jtree turns data into a tree

### use
  $ echo data.json | tree
    -> 
    # displays a tree... 

jq
---
### what is jq ?
  jq is a very powerfull json data manipulation tool.
  [TODO] write a cheat sheet for jq.

