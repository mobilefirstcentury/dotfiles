---- Javascript String Reference ----
===================================

The **`String`** global object is a constructor for strings, or a sequence of characters.
[Source](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference)

Syntax {#Syntax}
------

String literals take the forms:




  ```
  'string text'
  "string text"
  "中文 español English हिन्दी العربية português বাংলা русский 日本語 ਪੰਜਾਬੀ 한국어 தமிழ்"
  ```


Strings can also be created using the `String` global object directly:

String(thing)

### Parameters {#Parameters}

`thing`
:   Anything to be converted to a string.

### Template strings {#Template_strings}

Since ECMAScript 2015, string literals can also be so-called [Template
strings](/en-US/docs/Web/JavaScript/Reference/template_strings):

  ```
  `hello world`
  `hello!
  world!`
  `hello ${who}`
  escape `<a>${who}</a>`
  ```

### Escape notation {#Escape_notation}

Beside regular, printable characters, special characters can be encoded using escape notation:

  ```
  Code                       Output
  -------------------------- -----------------------
  `\0`                       the NULL character
  `\'`                       single quote
  `\"`                       double quote
  `\\`                       backslash
  `\n`                       new line
  `\r`                       carriage return
  `\v`                       vertical tab
  `\t`                       tab
  `\b`                       backspace
  `\f`                       form feed
  `\uXXXX`                   unicode codepoint
  `\u{X}` ... `\u{XXXXXX}`   unicode codepoint **
  `\xXX`                     the Latin-1 character
  ```

Unlike some other languages, JavaScript makes no distinction between single-quoted strings and double-quoted strings; therefore, the escape sequences above work in strings created with
either single or double quotes.

### Long literal strings {#Long_literal_strings}

Sometimes, your code will include strings which are very long.
Rather than having lines that go on endlessly, or wrap at the whim of your editor, you may wish to specifically break the string into multiple lines in the source code without affecting the
actual string contents. There are two ways you can do this.

You can use the [+](/en-US/docs/Web/JavaScript/Reference/Operators/Arithmetic_Operators#Addition_()) operator to append multiple strings together, like this:

  ```
  let longString = "This is a very long string which needs " +
                  "to wrap across multiple lines because " +
                  "otherwise my code is unreadable.";
  ```
                 

Or you can use the backslash character ("\\") at the end of each line to indicate that the string will continue on the next line.
Make sure there is no space or any other character after the backslash (except for a line break), or as an indent; otherwise it will not work.
That form looks like this:

  ```
  let longString = "This is a very long string which needs \
  to wrap across multiple lines because \
  otherwise my code is unreadable.";
  ```

Both of these result in identical strings being created.

Description {#Description}
-----------

Strings are useful for holding data that can be represented in text form.
Some of the most-used operations on strings are:
  - checking their `length`,
  - building and concatenating them using the `+` and `+=` string operators,
  - checking for the existence or location of substrings with the `indexOf()` method, 
  - extracting substrings with the `substring()` method. 

### Character access {#Character_access}

There are two ways to access an individual character in a string. The first is the `charAt()` method:


  ```
  return 'cat'.charAt(1); // returns "a"
  ```

The other way (introduced in ECMAScript 5) is to treat the string as an array-like object, where individual characters correspond to a numerical index:

  ```
  return 'cat'[1]; // returns "a"
  ```

For character access using bracket notation, attempting to delete or assign a value to these properties will not succeed. The properties involved are neither writable nor configurable. 

### Comparing strings {#Comparing_strings}

  ```
  var a = 'a';
  var b = 'b';
  if (a < b) { // true
    console.log(a + ' is less than ' + b);
  } else if (a > b) {
    console.log(a + ' is greater than ' + b);
  } else {
    console.log(a + ' and ' + b + ' are equal.');
  }
  ```


### Distinction between string primitives and `String` objects {#Distinction_between_string_primitives_and_String_objects}

Note that JavaScript distinguishes between `String` objects and primitive string values. (The same is true of `Boolean` and `Number`)

String literals (denoted by double or single quotes) and strings returned from `String` calls in a non-constructor context (i.e., without using the `new` keyword) are primitive strings.
JavaScript automatically converts primitives to `String` objects, so that it's possible to use `String` object methods for primitive strings.
In contexts where a method is to be invoked on a primitive string or a property lookup occurs, JavaScript will automatically wrap the string primitive and call the method or perform the
property lookup.

  ```
  var s_prim = 'foo';
  var s_obj = new String(s_prim);

  console.log(typeof s_prim); // Logs "string"
  console.log(typeof s_obj);  // Logs "object"
  ```

String primitives and `String` objects also give different results when using `eval()`.
Primitives passed to `eval` are treated as source code; `String` objects are treated as all other objects are, by returning the object.
For example:

  ```
  var s1 = '2 + 2';             // creates a string primitive
  var s2 = new String('2 + 2'); // creates a String object
  console.log(eval(s1));        // returns the number 4
  console.log(eval(s2));        // returns the string "2 + 2"
  ```

A `String` object can always be converted to its primitive counterpart with the `valueOf()` method

  ```
  console.log(eval(s2.valueOf())); // returns the number 4
  ```

Properties {#Properties}
----------

`String.prototype`:   Allows the addition of properties to a `String` object.

Methods {#Methods}
-------

  ```
  `String.fromCharCode()`:   Returns a string created by using the specified sequence of Unicode values.
  `String.fromCodePoint()`:   Returns a string created by using the specified sequence of code points.
  `String.raw()` :   Returns a string created from a raw template string.
  ```

`String` generic methods {#String_generic_methods}
--------------------------------------------------

**String generics are non-standard, deprecated and will get removed near future**. Note that you can not rely on them cross-browser without using the shim that is provided below.

  ```
  var num = 15;
  console.log(String.replace(num, /5/, '2'));
  ```
Generics are also available on `Array`methods.

The following is a shim to provide support to non-supporting browsers:

  ```
  /*globals define*/
  // Assumes all supplied String instance methods already present
  // (one may use shims for these if not available)
  (function() {
    'use strict';

    var i,
      // We could also build the array of methods with the following, but the
      //   getOwnPropertyNames() method is non-shimable:
      // Object.getOwnPropertyNames(String).filter(function(methodName) {
      //   return typeof String[methodName] === 'function';
      // });
      methods = [
        'quote', 'substring', 'toLowerCase', 'toUpperCase', 'charAt',
        'charCodeAt', 'indexOf', 'lastIndexOf', 'startsWith', 'endsWith',
        'trim', 'trimLeft', 'trimRight', 'toLocaleLowerCase',
        'toLocaleUpperCase', 'localeCompare', 'match', 'search',
        'replace', 'split', 'substr', 'concat', 'slice'
      ],
      methodCount = methods.length,
      assignStringGeneric = function(methodName) {
        var method = String.prototype[methodName];
        String[methodName] = function(arg1) {
          return method.apply(arg1, Array.prototype.slice.call(arguments, 1));
        };
      };

    for (i = 0; i < methodCount; i++) {
      assignStringGeneric(methods[i]);
    }
  }());
  ```

`String` instances {#String_instances}
--------------------------------------

### Properties {#Properties_2}

`String.prototype.constructor` :   Specifies the function that creates an object's prototype.
`String.prototype.length`:   Reflects the length of the string.
`N` :   Used to access the character in the *N*th position where *N* is a positive integer between 0 and one less than the value of `length`. These properties are read-only.

### Methods {#Methods_2}

#### Methods unrelated to HTML {#Methods_unrelated_to_HTML}

`String.prototype.charAt()`            : Returns the character at the specified index.
`String.prototype.charCodeAt()`        : Returns a number indicating the Unicode value of the character at the given index.
`String.prototype.codePointAt()`       : Returns a non-negative integer that is the UTF-16 encoded code point value at the given position.
`String.prototype.concat()`            : Combines the text of two strings and returns a new string.
`String.prototype.includes()`          : Determines whether one string may be found within another string.
`String.prototype.endsWith()`          : Determines whether a string ends with the characters of another string.
`String.prototype.indexOf()`           : Returns the index within the calling `String`    object of the first occurrence of the specified value, or -1 if not found.
`String.prototype.lastIndexOf()`       : Returns the index within the calling `String`    object of the last occurrence of the specified value, or -1 if not found.
`String.prototype.localeCompare()`     : Returns a number indicating whether a reference string comes before or after or is the same as the given string in sort order.
`String.prototype.match()`             : Used to match a regular expression against a string.
`String.prototype.normalize()`         : Returns the Unicode Normalization Form of the calling string value.
`String.prototype.repeat()`            : Returns a string consisting of the elements of the object repeated the given times.
`String.prototype.replace()`           : Used to find a match between a regular expression and a string, and to replace the matched substring with a new substring.
`String.prototype.search()`            : Executes the search for a match between a regular expression and a specified string.
`String.prototype.slice()`             : Extracts a section of a string and returns a new string.
`String.prototype.split()`             : Splits a `String`    object into an array of strings by separating the string into substrings.
`String.prototype.startsWith()`        : Determines whether a string begins with the characters of another string.
`String.prototype.substr()`            : Returns the characters in a string beginning at the specified location through the specified number of characters.
`String.prototype.substring()`         : Returns the characters in a string between two indexes into the string.
`String.prototype.toLocaleLowerCase()` : The characters within a string are converted to lower case while respecting the current locale.
`String.prototype.toLocaleUpperCase()` : The characters within a string are converted to upper case while respecting the current locale.
`String.prototype.toLowerCase()`       : Returns the calling string value converted to lower case.
`String.prototype.toSource()`          : Returns an object literal representing the specified object; you can use this value to create a new object. Overrides Object.prototype.toSource()`
`String.prototype.toString()`          : Returns a string representing the specified object. Overrides the `Object.prototype.toString()`    method.
`String.prototype.toUpperCase()`       : Returns the calling string value converted to uppercase.
`String.prototype.trim()`              : Trims whitespace from the beginning and end of the string. Part of the ECMAScript 5 standard.
`String.prototype.trimLeft()`          : Trims whitespace from the left side of the string.
`String.prototype.trimRight()`         : Trims whitespace from the right side of the string.
`String.prototype.valueOf()`           : Returns the primitive value of the specified object. Overrides the `Object.prototype.valueOf()`    method.
`String.prototype[@@iterator]()`       : Returns a new `Iterator` object that iterates over the code points of a String value, returning each code point as a String value.

#### HTML wrapper methods {#HTML_wrapper_methods}

These methods are of limited use, as they provide only a subset of the
available HTML tags and attributes.

`String.prototype.anchor()`:   `<a name="name">` (hypertext target)
`String.prototype.link()`:   `<a href="rul">` (link to URL)

Examples {#Examples}
--------

### String conversion {#String_conversion}

It's possible to use `String` as a "safer" `toString()` alternative, as although it still normally calls the underlying `toString()`, it also works for `null` and `undefined`.
For example:

  ```
  var outputStrings = [];
  for (var i = 0, n = inputValues.length; i < n; ++i) {
    outputStrings.push(String(inputValues[i]));
  }
  ```

