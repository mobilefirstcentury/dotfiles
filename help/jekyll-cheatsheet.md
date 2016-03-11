Jekyll 2.4.0 Cheat Sheet
========================

Liquid Tags
-----------

[Docs](https://github.com/Shopify/liquid/wiki/Liquid-for-Designers)

### Variable

#### assign

Create a new variable.

##### Input

    {% assign my_variable = false %}
    {% if my_variable != true %}
      Hi there!
    {% endif %}

##### Output

    Hi there!

#### capture

Captures the string inside of the opening and closing tags and
assigns it to a variable.

##### Input {#input}

    {% capture my_variable %}
      Captured text.
    {% endcapture %}

    {{ my_variable }}

##### Output {#output}

    Captured text.

### Iteration

#### break

Causes the loop to stop iterating.

##### Input {#input}

    {% for i in (1..5) %}
      {% if i == 3 %}
        {% break %}
      {% else %}
        {{ i }}
      {% endif %}
    {% endfor %}

##### Output {#output}

    1 2

#### continue

Causes the loop to skip the current iteration.

##### Input {#input}

    {% for i in (1..5) %}
      {% if i == 3 %}
        {% continue %}
      {% else %}
        {{ i }}
      {% endif %}
    {% endfor %}

##### Output {#output}

    1 2 4 5

#### cycle

Loops through a group of strings and outputs them in the order that
they were passed as parameters.

`cycle` must be used within a for loop block.

##### Input {#input}

    {% for i in (1..5) %}
      {% cycle 'red', 'blue', 'yellow' %}
    {% endfor %}

##### Output {#output}

    red blue yellow red blue

#### decrement

Creates a new variable and every time it’s called the value
decreases by 1, with the initial value being -1.

##### Input {#input}

    {% decrement my_variable %}
    {% decrement my_variable %}
    {% decrement my_variable %}

##### Output {#output}

    -1
    -2
    -3

Like `increment`, variables declared inside decrement are
independent from variables created through assign or capture.

#### for

Repeatedly executes a block of code.

##### Input {#input}

    {% for page in site.pages %}
      {{ page.title }}
    {% endfor %}

##### Output {#output}

    index
    about
    contact

#### increment

Creates a new variable and every time it’s called the value
increases by 1, with the initial value being 0.

##### Input {#input}

    {% increment my_variable %}
    {% increment my_variable %}
    {% increment my_variable %}

##### Output {#output}

    0
    1
    2

Variables created through the `increment` tag are independent from
variables created through `assign` or `capture`.

In the example below, `my_var` is created through `assign`. The
`increment` tag is then used several times on a variable with the
same name. However, note that the `increment` tag does not affect
the value of `my_var` that was created through `assign`.

##### Input {#input-1}

    {% assign my_var = 15 %}
    {% increment var %}
    {% increment var %}
    {% increment var %}
    {{ my_var }}

##### Output {#output-1}

    0
    1
    2
    15

### Control Flow

#### case

Creates a switch statement to compare a variable with different
values. `case` initializes the switch statement, and `when` compares
its values.

##### Input {#input}

    <!-- page.name is set to "home" -->
    {% case page.name %}
      {% when 'home' %}
        Home Page
      {% when 'about' %}
        About Page
      {% else %}
        Contact Page
    {% endcase %}

##### Output {#output}

    Home Page

#### elsif

Adds more conditions to an `if` or `unless` block.

##### Input {#input}

    <!-- page.name is set to "contact" -->
    {% if page.name == 'about' %}
      About Page
    {% elsif page.name == 'contact' %}
      Contact Page
    {% else %}
      Other Page
    {% endif %}

##### Output {#output}

    Contact Page

#### if

Executes a block of code only if a certain condition is met.

##### Input {#input}

    <!-- page.name is set to "about" -->
    {% if page.name == 'about' %}
      About Page
    {% endif %}

##### Output {#output}

    About Page

#### operations

Operators used in logic statements.

-   **==** equal
-   **!=** not equal
-   **\>** bigger than
-   **\<** less than
-   **\>=** bigger or equal
-   **\<=** less or equal
-   **or** this or that
-   **and** must be this and that
-   **contains** includes the substring if used on a string, or
    element if used on an array
#### unless

Similar to `if`, but executes a block of code only if a certain
condition is **not** met.

##### Input {#input}

    <!-- page.name is set to "about" -->
    {% unless page.name == "contact" %}
      It's not the contact page
    {% endunless %}

##### Output {#output}

    It's not the contact page

Which is the same as doing:

    {% if page.name != "contact" %}
      It's not the contact page
    {% endif %}

### Other

#### comment

Don’t output the contained text.

##### Input {#input}

    My name is {% comment %}Mr{% endcomment %} Jekyll

##### Output {#output}

    My name is Jekyll

#### gist

Embed a GitHub Gist.

##### Input {#input}

    {% gist parkr/931c1c8d465a04042403 %}

##### Output {#output}

    <noscript><pre>
    &lt;?xml version=&quot;1.0&quot; encoding=&quot;utf-8&quot;?&gt;
    &lt;!DOCTYPE html PUBLIC &quot;-//W3C//DTD XHTML 1.0 Strict//EN&quot;
      &quot;http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd&quot;&gt;
    &lt;html&gt;
      &lt;head&gt;
        &lt;title&gt;503 backend read error&lt;/title&gt;
      &lt;/head&gt;
      &lt;body&gt;
        &lt;h1&gt;Error 503 backend read error&lt;/h1&gt;
        &lt;p&gt;backend read error&lt;/p&gt;
        &lt;h3&gt;Guru Mediation:&lt;/h3&gt;
        &lt;p&gt;Details: cache-lax1435-LAX 1453942175 1299394840&lt;/p&gt;
        &lt;hr&gt;
        &lt;p&gt;Varnish cache server&lt;/p&gt;
      &lt;/body&gt;
    &lt;/html&gt;
    </pre></noscript><script src="https://gist.github.com/parkr/931c1c8d465a04042403.js"> </script>

#### highlight

Code snippet highlighting.

##### Input {#input}

    {% highlight ruby %}
      def foo
        puts 'foo'
      end
    {% endhighlight %}

##### Output {#output}

    <div class="highlight">
      <pre><code class="language-ruby" data-lang="ruby"><span class="k">def</span> <span class="nf">foo</span>
      <span class="nb">puts</span> <span class="s1">&#39;foo&#39;</span>
    <span class="k">end</span></code></pre></div>

#### include

Inserts a file from the `_includes` directory.

##### Input {#input}

    <h1>My site</h1>
    {% include nav.html %}

##### Output {#output}

    <h1>My Site</h1>
    <ul class="nav">
      <li><a href="/">Home</a></li>
      <li><a href="/about/">About</a></li>
      <li><a href="/contact/">Contact</a></li>
    </ul>

#### include\_relative

Includes a file relative to the current file.

##### Input {#input}

    <h1>My site</h1>
    {% include_relative about.html %}

##### Output {#output}

    <h1>My Site</h1>
    <h1>About</h1>

#### post\_url

Generate the correct permalink URL.

##### Input {#input}

    {% post_url 2010-07-21-name-of-post %}

##### Output {#output}

    /news/2010/07/21/name-of-post/

#### raw

No liquid will be parsed in within these tags.

##### Input {#input}

    {% raw %}
      {{ page.title }}
    {% endraw %}

##### Output {#output}

    {{ page.title }}

Document Variables
------------------

[Docs](http://jekyllrb.com/docs/collections/)

#### collection

Label of the containing collection.

##### Input {#input}

    {{ site.my_collection.first.collection }}

##### Output {#output}

    my_collection

#### content

The content of the collection item, rendered or un-rendered
depending upon what Liquid is being processed and the item is.

##### Input {#input}

    {{ site.my_collection.first.content }}

##### Output {#output}

    Hello from my_collection.

#### relative\_path

The path to the document’s source file relative to the site source.

##### Input {#input}

    {{ site.my_collection.first.relative_path }}

##### Output {#output}

    _my_collection/item.md

Collection Variables
--------------------

[Docs](http://jekyllrb.com/docs/collections/)

#### directory

The full path to the collections’s source directory.

##### Input {#input}

    {{ site.my_collection.directory }}

##### Output {#output}

    /Users/mike/jekyll-project/_my_collection

#### docs

An array of the collection’s documents.

##### Input {#input}

    {{ site.my_collection.docs.first.url }}

##### Output {#output}

    /my_collection/item.html

#### files

An array of static files in the collection.

##### Input {#input}

    {{ site.my_collection.files | size }}

##### Output {#output}

    0

#### label

The name of your collection.

##### Input {#input}

    {{ site.my_collection.label }}

##### Output {#output}

    my_collection

#### output

Whether the collection’s documents will be output as individual
files.

##### Input {#input}

    {{ site.my_collection.output }}

##### Output {#output}

    true

#### relative\_path

The path to the document’s source file relative to the site source.

##### Input {#input}

    {{ site.collections.my_collection.relative_path }}

##### Output {#output}

    _my_collection

Global Variables
----------------

[Docs](http://jekyllrb.com/docs/variables/)

#### content

In layout files, the rendered content of the Post or Page being
wrapped. Not defined in Post or Page files.

#### page

Page specific information + the YAML front matter. Custom variables
set via the YAML Front Matter will be available here.

#### paginator

When the paginate configuration option is set, this variable becomes
available for use.

#### site

Sitewide information + configuration settings from `_config.yml`.

Liquid Filters
--------------

[Docs](https://github.com/Shopify/liquid/wiki/Liquid-for-Designers)

### String

#### append

Append characters to a string.

##### Input {#input}

    {{ 'jekyll' | append: '.jpg' }}

##### Output {#output}

    jekyll.jpg

#### capitalize

Capitalizes the first character.

##### Input {#input}

    {{ "static site generator" | capitalize }}

##### Output {#output}

    Static site generator

#### cgi\_escape

Escape a string for use in a URL.

##### Input {#input}

    {{ "foo,bar;baz?" | cgi_escape }}

##### Output {#output}

    foo%2Cbar%3Bbaz%3F

#### downcase

Converts a string to lowercase.

##### Input {#input}

    {{ "STATIC Site generator" | downcase }}

##### Output {#output}

    static site generator

#### escape

Returns an escaped version of html.

##### Input {#input}

    {{ "<p>Jekyll</p>" | escape }}

##### Output {#output}

    &amp;lt;p&amp;gt;Jekyll&amp;lt;/p&amp;gt;

#### markdownify

Convert a Markdown-formatted string into HTML.

##### Input {#input}

    {{ "Hello **Jekyll**" | markdownify }}

##### Output {#output}

    Hello <strong>Jekyll</strong>

#### number\_of\_words

Count the number of words in a string.

##### Input {#input}

    {{ "Hi Jekyll!" | number_of_words }}

##### Output {#output}

    2

#### prepend

Prepend characters to a string.

##### Input {#input}

    {{ 'Jekyll' | prepend: 'I love ' }}

##### Output {#output}

    I love Jekyll

#### remove\_first

Removes only the first occurrence of a substring from a string.

##### Input {#input}

    {{ 'I really really like Jekyll' | remove_first: 'really' }}

##### Output {#output}

    I really like Jekyll

#### remove

Removes any occurrence of a substring from a string.

##### Input {#input}

    {{ 'I really really like Jekyll' | remove: 'really' }}

##### Output {#output}

    I like Jekyll

#### replace\_first

Replaces only the first occurrence of a substring from a string.

##### Input {#input}

    {{ 'I really really like Jekyll' | replace_first: 'really', 'kinda' }}

##### Output {#output}

    I kinda really like Jekyll

#### replace

Replaces any occurrence of a substring from a string.

##### Input {#input}

    {{ 'I really really like Jekyll' | replace: 'really', 'truly' }}

##### Output {#output}

    I truly truly like Jekyll

#### size

Return the size of a string.

##### Input {#input}

    <!-- page.my_string is jekyll -->
    {{ page.my_string | size }}

##### Output {#output}

    6

#### slice

returns a substring, starting at the specified index.

##### Input {#input}

    {{ "hello" | slice: 0 }}
    {{ "hello" | slice: 1 }}
    {{ "hello" | slice: 1, 3 }}

##### Output {#output}

    h
    e
    ell

#### slugify

Convert a string into a lowercase URL slug.

##### Input {#input}

    {{ "The _config.yml file" | slugify }}

##### Output {#output}

    the-config-yml-file

The slugify filter accepts an option, each specifying what to
filter. The default is default. They are as follows (with what they
filter):

-   `none`: no characters
-   `raw`: spaces
-   `default`: spaces and non-alphanumeric characters
-   `pretty`: spaces and non-alphanumeric characters except for
    `._~!$&'()+,;=@`
#### split

Divide a string into an array.

##### Input {#input}

    {{ "a~b" | split:"~" }}

##### Output {#output}

    ['a', 'b']

#### strip\_html

Strip all html tags from the input string.

##### Input {#input}

    {{ "<p>Jekyll is cool</p>" | strip_html }}

##### Output {#output}

    Jekyll is cool

#### textilize

Convert a Textile-formatted string into HTML.

##### Input {#input}

    {{ "h1. Hello Jekyll" | textilize }}

##### Output {#output}

    <h1>Hello Jekyll</h1>

#### truncate

Truncate a string down to x characters.

##### Input {#input}

    {{ "I love Jekyll" | truncate: 12 }}

##### Output {#output}

    I love Je...

#### truncatewords

Truncate string down to x words.

##### Input {#input}

    {{ "I love Jekyll" | truncatewords: 2 }}

##### Output {#output}

    I love...

#### upcase

Converts a string to uppercase.

##### Input {#input}

    {{ "static site generator" | upcase }}

##### Output {#output}

    STATIC SITE GENERATOR

#### uri\_escape

URI escape a string.

##### Input {#input}

    {{ "foo, bar \baz?" | uri_escape }}

##### Output {#output}

    foo,%20bar%20%5Cbaz?

#### xml\_escape

Select all the objects in an array where the key has the given
value.

##### Input {#input}

    {{ "<p>Hi Jekyll</p>"| xml_escape }}

##### Output {#output}

    &amp;lt;p&amp;gt;Hi Jekyll&amp;lt;/p&amp;gt;

### Array

#### array\_to\_sentence\_string

Append characters to a string.

##### Input {#input}

    <!-- page.my_array is ['a', 'b', 'c'] -->
    {{ page.my_array | array_to_sentence_string }}

##### Output {#output}

    a, b, and c

#### first

Get the first element of the passed in array.

##### Input {#input}

    <!-- page.my_array is ['a', 'b', 'c'] -->
    {{ page.my_array | first }}

##### Output {#output}

    a

#### group\_by

Group an array’s items by a given property.

##### Input {#input}

    <!-- page.people is
    - name: "John"
      school: "Stanford"
    - name: "Jane"
      school: "Stanford"
    - name: "Joe"
      school: "Harvard"
    -->
    {{ page.people | group_by: "school" }}

##### Output {#output}

    {
      "name"=>"Stanford",
      "items"=>[{
        "name"=>"John",
        "school"=>"Stanford"
      }, {
        "name"=>"Jane",
        "school"=>"Stanford"
      }]
    },
    {
      "name"=>"Harvard",
      "items"=>[{
        "name"=>"Joe",
        "school"=>"Harvard"
      }]
    }

#### join

Joins an array with the specified character.

##### Input {#input}

    <!-- page.my_array is ['a', 'b', 'c'] -->
    {{ page.my_array | join: ', ' }}

##### Output {#output}

    a, b, c

#### jsonify

Convert Hash or Array to JSON.

##### Input {#input}

    <!-- page.my_array is ['a', 'b', 'c'] -->
    {{ page.my_array | jsonify }}

##### Output {#output}

    ["a","b","c"]

#### last

Get the last element of the passed in array.

##### Input {#input}

    <!-- page.my_array is ['a', 'b', 'c'] -->
    {{ page.my_array | last }}

##### Output {#output}

    c

#### map

Accepts an array element’s attribute as a parameter and creates a
string out of each array element’s value.

##### Input {#input}

    <!-- page.people is
      - name: "John"
        school: "Stanford"
      - name: "Jane"
        school: "Stanford"
      - name: "Joe"
        school: "Harvard"
    -->
    {{ page.people | map: "name" }}

##### Output {#output}

    JohnJaneJoe

#### push

Adds an object to a array.

##### Input {#input}

    {% assign my_array = "a,b,c" | split:"," %}
    {% assign my_array = my_array | push: 'd' %}

    {{ my_array | array_to_sentence_string }}

##### Output {#output}

    a, b, c, and d

#### size

Return the size of an array or string.

##### Input {#input}

    <!-- page.my_array is ['a', 'b', 'c'] -->
    {{ page.my_array | size }}

##### Output {#output}

    3

#### sort

Sorts an array.

##### Input {#input}

    <!-- page.my_array is ['c', 'a', 'b'] -->
    {{ page.my_array | sort }}

##### Output {#output}

    ['a','b','c']

#### where

Select all the objects in an array where the key has the given
value.

##### Input {#input}

    <!-- page.people is
      - name: "John"
        school: "Stanford"
      - name: "Jane"
        school: "Stanford"
      - name: "Joe"
        school: "Harvard"
    -->
    {{ page.people | where: "school", "Stanford" }}

##### Output {#output}

    {"name"=>"John", "school"=>"Stanford"}{"name"=>"Jane", "school"=>"Stanford"}

### Date

#### date\_to\_long\_string

Convert a date to long format.

##### Input {#input}

    {{ site.time | date_to_long_string }}

##### Output {#output}

    01 January 2016

#### date\_to\_long\_rfc822

Convert a Date into RFC-822 format.

##### Input {#input}

    {{ site.time | date_to_rfc822 }}

##### Output {#output}

    Mon, 07 Nov 2008 13:07:54 -0800

#### date\_to\_string

Convert a date to short format.

##### Input {#input}

    {{ site.time | date_to_string }}

##### Output {#output}

    01 Jan 2016

#### date\_to\_xmlschema

Convert a Date into ISO 8601 format.

##### Input {#input}

    {{ site.time | date_to_xmlschema }}

##### Output {#output}

    2008-11-07T13:07:54-08:00

#### date

Converts a date into another format.

##### Input {#input}

    {{ site.time | date: "%a, %b %d, %y" }}

##### Output {#output}

    Wed, Jan 27, 16

  -   **%a** - Abbreviated weekday (Sun)
  -   **%A** - Full weekday name (Sunday)
  -   **%b** - Abbreviated month name (Jan)
  -   **%B** - Full month name (January)
  -   **%c** - Preferred local date and time representation (Fri Jan
      29 11:16:09 2016)
  -   **%d** - Day of the month, zero-padded (05)
  -   **%-d** - Day of the month (5)
  -   **%D** - Formats the date (29/01/16).
  -   **%e** - Day of the month (3).
  -   **%F** - Returns the date in ISO 8601 format (2016-01-29).
  -   **%H** - Hour of the day, 24-hour clock (07)
  -   **%I** - Hour of the day, 12-hour clock (04)
  -   **%j** - Day of the year (017)
  -   **%k** - Hour of the day, 24-hour clock (7)
  -   **%m** - Month of the year (04)
  -   **%M** - Minute of the hour (09)
  -   **%p** - Meridian indicator uppercase (AM)
  -   **%P** - Meridian indicator lowercase (pm)
  -   **%r** - 12-hour time (01:31:43 PM)
  -   **%R** - 24-hour time (18:09)
  -   **%T** - 24-hour time with seconds (18:09:13)
  -   **%S** - Number of seconds since 1970-01-01 00:00:00 UTC
      (1452355261)
  -   **%S** - Second of the minute (05)
  -   **%U** - Week number of the current year, starting with the
      first Sunday as the first day of the first week (03)
  -   **%W** - Week number of the current year, starting with the
      first Monday as the first day of the first week (09)
  -   **%w** - Day of the week. Sunday is 0 (4)
  -   **%x** - Preferred representation for the date (05/11/15)
  -   **%X** - Preferred representation for the time (17:15:31)
  -   **%y** - Year without a century (16)
  -   **%Y** - Year with century (2016)
  -   **%Z** - Time zone name (PST)
  -   **%%** - Literal % character

### Integer

#### divided\_by

Integer division.

##### Input {#input}

    {{ 10 | divided_by:3 }}

##### Output {#output}

    3

#### minus

Subtraction.

##### Input {#input}

    {{ 4 | minus:1 }}

##### Output {#output}

    3

#### modulo

Remainder.

##### Input {#input}

    {{ 3 | modulo:2 }}

##### Output {#output}

    1

#### minus

Addition.

##### Input {#input}

    {{ 4 | plus:1 }}

##### Output {#output}

    5

#### times

Integer multiplication.

##### Input {#input}

    {{ 10 | times:3 }}

##### Output {#output}

    30

Liquid For Loops
----------------

[Docs](https://github.com/Shopify/liquid/wiki/Liquid-for-Designers)

#### else

Condition when there are no items in the array.

##### Input {#input}

    <!-- page.my_array is [] -->
    {% for item in page.my_array %}
      {{ item }}
    {% else %}
      There are no items!
    {% endfor %}

##### Output {#output}

    There are no items!

#### first

Returns whether it’s the first iteration.

##### Input {#input}

    <!-- page.my_array is [1, 2, 3] -->
    {% for item in page.my_array %}
      {% if forloop.first %}
        First!
      {% else %}
        Not first
    {% endif %}
    {% endfor %}

##### Output {#output}

    First! Not first Not first

#### index

index of the current iteration.

##### Input {#input}

    <!-- page.my_array is ['a', 'b', 'c'] -->
    {% for item in page.my_array %}
      {{ forloop.index }}
    {% endfor %}

##### Output {#output}

    1 2 3

#### index0

index of the current iteration (zero based).

##### Input {#input}

    <!-- page.my_array is ['a', 'b', 'c'] -->
    {% for item in page.my_array %}
      {{ forloop.index0 }}
    {% endfor %}

##### Output {#output}

    0 1 2

#### last

Returns whether it’s the last iteration.

##### Input {#input}

    <!-- page.my_array is [1, 2, 3] -->
    {% for item in page.my_array %}
      {% if forloop.last %}
        Last!
      {% else %}
        Not last
      {% endif %}
    {% endfor %}

##### Output {#output}

    Not last Not last Last!

#### length

Length of the entire loop.

##### Input {#input}

    <!-- page.my_array is ['a', 'b', 'c'] -->
    {% for item in page.my_array %}
      {{ forloop.length }}
    {% endfor %}

##### Output {#output}

    3 3 3

#### limit

Restrict how many items are looped through.

##### Input {#input}

    <!-- page.my_array is [1, 2, 3, 4, 5] -->
    {% for item in page.my_array limit: 2 %}
      {{ item }}
    {% endfor %}

##### Output {#output}

    1 2

#### offset

Start looping from the nth item.

##### Input {#input}

    <!-- page.my_array is [1, 2, 3, 4, 5] -->
    {% for item in page.my_array offset: 2 %}
      {{ item }}
    {% endfor %}

##### Output {#output}

    3 4 5

#### reversed

Reverses the order.

##### Input {#input}

    <!-- page.my_array is [1, 2, 3, 4, 5] -->
    {% for item in page.my_array reversed %}
      {{ item }}
    {% endfor %}

##### Output {#output}

    5 4 3 2 1

#### rindex

Outputs the number of iterations left.

##### Input {#input}

    <!-- page.my_array is ['a', 'b', 'c'] -->
    {% for item in page.my_array %}
      {{ forloop.rindex }}
    {% endfor %}

##### Output {#output}

    3 2 1

#### rindex0

Outputs the number of iterations left (zero based).

##### Input {#input}

    <!-- page.my_array is ['a', 'b', 'c'] -->
    {% for item in page.my_array %}
      {{ forloop.rindex0 }}
    {% endfor %}

##### Output {#output}

    2 1 0

Markdown
--------

[Docs](http://kramdown.gettalong.org/syntax.html)

#### blockquotes

##### Input {#input}

    > Blockquotes are very handy in email to emulate reply text.
    > This line is part of the same quote.

##### Output {#output}

    <blockquote>
      <p>Blockquotes are very handy in email to emulate reply text.
    This line is part of the same quote.</p>
    </blockquote>

#### code blocks

##### Input {#input}

    ```
    def what?
      42
    end
    ```
    {: .language-ruby}

##### Output {#output}

    <pre>
      <code class="language-ruby">
        def what?
          42
        end
      </code>
    </pre>

#### definition list

##### Input {#input}

    HTML
    : Hypertext Markup Language, a standardized system for tagging text files.

    CSS
    : Cascading Style Sheets (CSS) is a style sheet language used for describing the presentation of a document written in a markup language

##### Output {#output}

    <dl>
      <dt>HTML</dt>
      <dd>Hypertext Markup Language, a standardized system for tagging text files.</dd>
      <dt>CSS</dt>
      <dd>Cascading Style Sheets (CSS) is a style sheet language used for describing the presentation of a document written in a markup language</dd>
    </dl>

#### headings

##### Input {#input}

    # H1

    ## H2

    ### H3

    #### H4

    ##### H5

    ###### H6

##### Output {#output}

    <h1 id="h1">H1</h1>

    <h2 id="h2">H2</h2>

    <h3 id="h3">H3</h3>

    <h4 id="h4">H4</h4>

    <h5 id="h5">H5</h5>

    <h6 id="h6">H6</h6>

#### horizontal rules

##### Input {#input}

    ---

##### Output {#output}

    <hr />

#### lists

##### Input {#input}

    1. First item
    2. Second item
    3. Third item

    * First item
    * Second item
    * Third item

##### Output {#output}

    <ol>
      <li>First item</li>
      <li>Second item</li>
      <li>Third item</li>
    </ol>

    <ul>
      <li>First item</li>
      <li>Second item</li>
      <li>Third item</li>
    </ul>

#### paragraphs

##### Input {#input}

    A paragraph is simply one or more consecutive lines of text, separated by one or more blank lines

##### Output {#output}

    <p>A paragraph is simply one or more consecutive lines of text, separated by one or more blank lines</p>

#### tables

##### Input {#input}

    | Tables        | Are           | Cool  |
    | ------------- |:-------------:| -----:|
    | col 3 is      | right-aligned | $1600 |
    | col 2 is      | centered      |   $12 |
    | zebra stripes | are neat      |    $1 |

##### Output {#output}

    <table>
      <thead>
        <tr>
          <th>Tables</th>
          <th style="text-align: center">Are</th>
          <th style="text-align: right">Cool</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>col 3 is</td>
          <td style="text-align: center">right-aligned</td>
          <td style="text-align: right">$1600</td>
        </tr>
        <tr>
          <td>col 2 is</td>
          <td style="text-align: center">centered</td>
          <td style="text-align: right">$12</td>
        </tr>
        <tr>
          <td>zebra stripes</td>
          <td style="text-align: center">are neat</td>
          <td style="text-align: right">$1</td>
        </tr>
      </tbody>
    </table>

#### text markup

##### Input {#input}

    **strong** text

    _emphasis_ text

    `inline` code

    [link](http://jekyllrb.com) text

    ![Alt tag](/path/to/image.jpg)

##### Output {#output}

    <p><strong>strong</strong> text</p>

    <p><em>emphasis</em> text</p>

    <p><code>inline</code> code</p>

    <p><a href="http://jekyllrb.com">link</a> text</p>

    <p><img src="/path/to/image.jpg" alt="Alt tag" /></p>

Page Variables
--------------

[Docs](http://jekyllrb.com/docs/variables/)

#### path

The path to the raw post or page.

##### Input {#input}

    {{ page.path }}

##### Output {#output}

    index.html

#### url

The URL of the Post without the domain, but with a leading slash.

##### Input {#input}

    {{ page.url }}

##### Output {#output}

    /index.html

Paginator Variables
-------------------

[Docs](http://jekyllrb.com/docs/pagination/)

#### next\_page\_path

path of next pagination page, or nil if no subsequent page exists.

##### Input {#input}

    {{ paginator.next_page_path }}

##### Output {#output}

    /blog/4

#### next\_page

page number of the next pagination page, or `nil` if no next page
exists.

##### Input {#input}

    {{ paginator.next_page }}

##### Output {#output}

    4

#### page

Current page number.

##### Input {#input}

    {{ paginator.page }}

##### Output {#output}

    1

#### per\_page

Number of posts per page.

##### Input {#input}

    {{ paginator.per_page }}

##### Output {#output}

    5

#### posts

A list of posts for the current page.

##### Input {#input}

    {% for post in paginator.posts %}
      {{ post.id }}
    {% endfor %}

##### Output {#output}

    /2016/01/03/no-im-not /2016/01/04/im-back /2016/01/03/goodbye-world /2016/01/02/im-fleeting

#### previous\_page\_path

path of previous pagination page, or nil if no previous page exists.

##### Input {#input}

    {{ paginator.previous_page_path }}

##### Output {#output}

    /blog/2

#### previous\_page

page number of the previous pagination page, or `nil` if no previous
page exists.

##### Input {#input}

    {{ paginator.previous_page }}

##### Output {#output}

    2

#### total\_pages

Number of pagination pages.

##### Input {#input}

    {{ paginator.total_pages }}

##### Output {#output}

    6

#### total\_posts

Total number of posts in the site.

##### Input {#input}

    {{ paginator.total_posts }}

##### Output {#output}

    37

Post Variables
--------------

[Docs](http://jekyllrb.com/docs/variables/)

#### categories

The list of categories to which this post belongs.

##### Input {#input}

    <!-- tags is set to
      categories:
        - news
    -->
    {{ page.categories | array_to_sentence_string  }}

##### Output {#output}

    news

#### content

The content of the post, rendered or un-rendered depending upon what
Liquid is being processed and what `post` is.

##### Input {#input}

    {{ page.content }}

##### Output {#output}

    Hello World!

#### date

The date assigned to the Post.

##### Input {#input}

    {{ page.date }}

##### Output {#output}

    2016-02-02 00:00:00 -0800

#### excerpt

The un-rendered excerpt of the Post.

##### Input {#input}

    {{ page.excerpt }}

##### Output {#output}

    Hello World!

#### id

An identifier unique to the Post.

##### Input {#input}

    {{ page.id }}

##### Output {#output}

    /2015/10/11/hello-world

#### next

The next post relative to the position of the current post in
`site.posts`. Returns `nil` for the last entry.

##### Input {#input}

    {{ page.next.title }}

##### Output {#output}

    /2016/01/02/hello-world.html

#### previous

The previous post relative to the position of the current post in
`site.posts`. Returns `nil` for the first entry.

##### Input {#input}

    {{ page.previous.title }}

##### Output {#output}

    /2016/01/02/im-fleeting.html

#### tags

The list of tags to which this post belongs.

##### Input {#input}

    <!-- tags is set to
      tags:
        - HTML
        - CSS
    -->
    {{ page.tags | array_to_sentence_string  }}

##### Output {#output}

    HTML and CSS

#### title

The title of the post.

##### Input {#input}

    {{ page.title }}

##### Output {#output}

    Hello World

Site Variables
--------------

[Docs](http://jekyllrb.com/docs/variables/)

#### categories.*category*

The list of all Posts in a category.

##### Input {#input}

    {% for p in site.categories.news %}
      {{ p.url }}
    {% endfor %}

##### Output {#output}

    /2016/01/03/goodbye-world.html
    /2016/01/01/hello-world.html

#### collections

A list of all the collections.

##### Input {#input}

    {{ site.collections | size }}

##### Output {#output}

    1

#### *configuration data*

All the variables set via the command line and your `_config.yml`
are available through `site`.

##### Input {#input}

    <!-- url is set to http://mysite.com in the configuration file -->
    {{ site.url }}

##### Output {#output}

    http://mysite.com

#### data

A list containing the data loaded from the YAML, JSON and CSV files
located in the \_data directory.

##### Input {#input}

    {{ site.data.nba_players.first.name }}

##### Output {#output}

    Michael Jordan

#### documents

A list of all the documents in every collection.

##### Input {#input}

    {{ site.documents | size }}

##### Output {#output}

    19

#### html\_pages

A subset of `site.pages` listing those which end in `.html`

##### Input {#input}

    {% for p in site.html_pages %}
      {{ p.path }}
    {% endfor %}

##### Output {#output}

    about.html
    contact.html
    index.html

#### pages

A list of all Pages.

##### Input {#input}

    {% for p in site.pages %}
      {{ p.path }}
    {% endfor %}

##### Output {#output}

    about.html
    contact.html
    index.html
    site-map.xml

#### posts

A reverse chronological list of all Posts.

##### Input {#input}

    {% for p in site.posts %}
      {{ p.url }}
    {% endfor %}

##### Output {#output}

    /2016/01/03/goodbye-world.html
    /2016/01/02/im-fleeting.html
    /2016/01/01/hello-world.html

#### related\_posts

If the page being processed is a Post, this contains a list of up to
ten related Posts. By default, these are the ten most recent posts.

##### Input {#input}

    <!-- run on /_posts/2016-01-01-hello-world.md -->
    {% for p in site.related_posts %}
      {{ p.title }}
    {% endfor %}

##### Output {#output}

    Goodbye World
    Im Fleeting

#### static\_files

A list of all static files (i.e. files not processed by Jekyll’s
converters or the Liquid renderer).

##### Input {#input}

    {% for file in site.static_files %}
      {{ file.path }}
    {% endfor %}

##### Output {#output}

    /css/style.css
    /js/my-script.js

#### tags.*tag*

The list of all Posts with a particular tag.

##### Input {#input}

    {% for p in site.tags.sad %}
      {{ p.url }}
    {% endfor %}

##### Output {#output}

    /2016/01/03/goodbye-world.html
    /2016/01/02/im-fleeting.html

#### time

The current time (when you run the jekyll command).

##### Input {#input}

    {{ site.time }}

##### Output {#output}

    2016-01-28 08:32:19 -0800

Static File Variables
---------------------

[Docs](http://jekyllrb.com/docs/static-files/)

#### extname

The extension name for the file.

##### Input {#input}

    {{ site.static_files.first.extname }}

##### Output {#output}

    .css

#### modified\_time

The time the file was last modified.

##### Input {#input}

    {{ site.static_files.first.modified_time }}

##### Output {#output}

    1454000258

#### path

The relative path to the file.

##### Input {#input}

    {{ site.static_files.first.path }}

##### Output {#output}

    /css/style.css

Yaml
----

[Docs](http://lzone.de/cheat-sheet/YAML)

#### hashes

##### Input {#input}

    # Nest hash
    my_hash:
      subkey:
        subsubkey1: 5
        subsubkey2: 6
      another:
        somethingelse: 'Important!'

    # Hash of hashes
    my_hash: {nr1: 5, nr2: 6}

#### sequences

##### Input {#input}

    # sequence
    array:
      - 132
      - 2.434
      - 'abc'

    # sqeuence of sequences
    my_array:
    - [1, 2, 3]
    - [4, 5, 6]

#### variables

##### Input {#input}

    a: 1
    b: 1.234
    c: 'abc'
    d: "abc"
    e: abc
    f: false # boolean type
    g: 2015-04-05 # date type

    # Enforcing strings
    h: !str 2015-04-05


