
REGULAR EXPRESSION IN VIM
=========================

Substitute Command
------------------

### Search & Replace
:range s[ubstitute]/pattern/string/cgiI
For each line in the range replace a match of the pattern with the string where:
c Confirm each substitution
g Replace all occurrences in the line (without g - only first).
i Ignore case for the pattern.
I Don't ignore case for the pattern.

### Range of Operation, Line Addressing and Marks

By specifying the line range you restrict the command execution to this particular part of text only..
Line range consists of one or more line specifiers, separated with a comma or semicolon..
You can also mark your current position in the text typing ml , where "l" can be any letter, and use it later defining the line address.

If no line range is specified the command will operate on the current line only.
  .           : the current line
  $           : the last line in the file
  %           : the whole file. The same as 1,$
  't          : position of mark "t"
  /pattern[/] : the next line where text "pattern" matches.
  ?pattern[?] : the previous line where text "pattern" matches
  \/          : the next line where the previously used search pattern matches
  \?          : the previous line where the previously used search pattern matches
  \&          : the next line where the previously used substitute pattern matches

Each may be followed (several times) by "+" or "-" and an optional number. This number is added or subtracted from the preceding line number. If the number is omitted, 1 is used.
Examples:
  10,20                                     -- from 10 to 20 line.
  /Section 1/+,/Section 2/-                 -- all lines between Section 1 and Section 2, non-inclusively, i.e. the lines containing Section 1 and Section 2 will not be affected.
  /Section 1/;/Subsection/-,/Subsection/+   -- first find Section 1, then the first line with Subsection, step one line down (beginning of the range) and find the next line with Subsection, step one line up (end of the range).
  :/Section/+ y                             -- this will search for the Section line and yank (copy) one line after into the memory.
  :// normal p                              -- and that will search for the next Section line and put (paste) the saved text on the next line.


Pattern Description
-------------------

### Anchors

s:\<vi\>:VIM:g  : word boundary
s:^vi\>:VIM:    : begining of line 
s:^vi$:VIM:     : end of line 
It matches any character from this set..
So :%s:[Vv]i:VIM: will match and ..
 
### Meta characters
Chharacter with a special meaning that have to be "escaped": they have to be preceded by a "\".

#### Liste of meta characters
  . any character except new line	 	 
  \s whitespace character	
  \S non-whitespace character
  \d digit	
  \D non-digit
  \x hex digit	
  \X non-hex digit
  \o octal digit	
  \O non-octal digit
  \h head of word character (a,b,c...z,A,B,C...Z and )	
  \H non-head of word character
  \p printable character	
  \P like \p, but excluding digits
  \w word character	
  \W non-word character
  \a alphabetic character	
  \A non-alphabetic character
  \l lowercase character	
  \L non-lowercase character
  \u uppercase character	
  \U non-uppercase character

#### Examples of meta characters use
\d\d/\d\d/\d\d\d\d To match 6 letter word starting with a capital letter

### Quantifiers, Greedy and Non-Greedy

How many times certain part of you pattern should?
  * matches 0 or more of the preceding characters, ranges or metacharacters .* matches everything including empty line
  + matches 1 or more of the preceding characters...
  = matches 0 or 1 more of the preceding characters...
  {n,m} matches from n to m of the preceding characters...
  {n} matches exactly n times of the preceding characters...
  {,m} matches at most m (from 0 to m) of the preceding characters...
  {n,} matches at least n of of the preceding characters...

Quantifiers are ** greedy ** by default: they matches as much content as possible.

Non greedy quantifiers
  \{-} matches 0 or more of the preceding atom, as few as possible
  \{-n,m} matches 1 or more of the preceding characters...
  \{-n,} matches at lease or more of the preceding characters...
  \{-,m} matches 1 or more of the preceding characters...

 
### Character ranges

[012345]    -- will match any of the numbers inside the brackets. The same range can be written as [0-5], where dash indicates a range of characters in ASCII order. Likewise, we can define the range for all lowercase letters: [a-z], for all letters: [a-zA-Z], letters and digits: [0-9a-zA-Z] etc. Depending on your system locale you can define range which will include characters like à, Ö, ß and other non ASCII characters.
/[^A-Z]/    -- will match any character except capital letters. We can now rewrite our pattern for quoted text using
/"[^"]\+"/  -- Note: inside the [ ] all metacharacters behave like ordinary characters. If you want to include "-" (dash) in your range put it first
/[-0-9]/    -- will match all digits and -. "^" will lose its special meaning if it's not the first character in the range.
\.\s\+[a-z] -- a period followed by one or more blanks and a lowercase word. We know how to find an error, now let's see how we can correct it. To do this we need some ways to remember our matched pattern and recall it later. That is exactly what backreferences are for.

 
### Grouping and Backreferences

s:\(\w\+\)\(\s\+\)\(\w\+\):\3\2\1: back reference of groups in the search expression

&  : the whole matched pattern
\L : the following characters are made lowercase
\0 : the whole matched pattern
\U : the following characters are made uppercase
\1 : the matched pattern in the first pair of \(\)
\E : end of \U and \L
\2 : the matched pattern in the second pair of \(\)
\e : end of \U and \L
\r : split line in two at this point
\9 : the matched pattern in the ninth pair of \(\)
\l : next character made lowercase
~  : the previous substitute string
\u : next character made uppercase

Example: 
s:\([.!?]\)\s\+\([a-z]\):\1  \u\2:g    Now the full S&R to correct non-capital words at the beginning of the sentences looks like

### Alternations

Using "\|" you can combine several expressions into one which matches any of its components. The first one matched will be used.
remark: in alternations expressions are NOT greedy so beware of the order of you alternates!

examples:
\(Date:\|Subject:\|From:\)\(\s.*\) parse various mail headings and their contents into \1 and \2, respectively.

 
### Regexp Operator Precedence

As in arithmetic expressions, regular expressions have a precedence.

1 \( \)                           grouping
2 \=,\+,*,\{n} etc.               quantifiers
3 abc\t\.\w                       sequence of characters/ metacharacters, not containing quantifiers or grouping operators
4 \|                              alternation



Global Command
--------------

### Global search and execution

I want to introduce another quite useful and powerful Vim command which we're going to use later

:range g[lobal][!]/pattern/cmd
Execute the Ex command cmd (default ":p") on the lines within [range] where pattern matches. If pattern is preceded with a ! - only where match does not occur.
The global commands work by first scanning through the [range] of of the lines and marking each line where a match occurs. In a second scan the [cmd] is executed for each marked line with its line number prepended. If a line is changed or deleted its mark disappears. The default for the [range] is the whole file.

Note: Ex commands are all commands you are entering on the Vim command line like :s[ubstitute], :co[py] , :d[elete], :w[rite] etc. Non-Ex commands (normal mode commands) can be also executed via

:norm[al]non-ex command

mechanism.

Examples

Some examples of :global usage:

:g/^$/ d

- delete all empty lines in a file

:g/^$/,/./-j

- reduce multiple blank lines to a single blank

:10,20g/^/ mo 10

- reverse the order of the lines starting from the line 10 up to the line 20.

Here is a modified example from Walter Zintz vi tutorial:

:'a,'b g/^Error/ . w >> errors.txt

- in the text block marked by 'a and 'b find all the lines starting with Error and copy (append) them to "errors.txt" file. Note: . (current line address) in front of the w is very important, omitting it will cause :write to write the whole file to "errors.txt" for every Error line found.

You can give multiple commands after :global using "|" as a separator. If you want to use "|' in an argument, precede it with "\'. Another example from Zintz tutorial:

:g/^Error:/ copy $ | s /Error/copy of the error/

- will copy all Error line to the end of the file and then make a substitution in the copied line. Without giving the line address :s will operate on the current line, which is the newly copied line.

:g/^Error:/ s /Error/copy of the error/ | copy $

- here the order is reversed: first modify the string then copy to the end.

Examples
--------

### Tips and Techniques

A collection of some useful S&R tips:

(1) sent by Antonio Colombo:

"a simple regexp I use quite often to clean up a text: it drops the blanks at the end of the line:"

s:\s*$::

or (to avoid acting on all lines):

s:\s\+$::

 
### Creating outline

For this example you need to know a bit of HTML. We want to make a table of contents out of h1 and h2 headings, which I will call majors and minors. HTML heading h1 is a text enclosed by <h1> tags as in <h1>Heading</h1>.

(1) First let's make named anchors in all headings, i.e. put <h1><a name="anchor">Heading</a></h1> around all headings. The "anchor" is a unique identifier of this particular place in HTML document. The following S&R does exactly this:

:s:\(<h[12]>\)\(.*\s\+\([-a-zA-Z]\+\)\)\s*\(</h[12]>\):\1<a name="\3">\2</a>\4:

Explanation: the first pair of \(\) saves the opening tag (h1 or h2) to the \1, the second pair saves all heading text before the closing tag, the third pair saves the last word in the heading which we will later use for "anchor" and the last pair saves the closing tag. The replacement is quite obvious - we just reconstruct a new "named" heading using \1-\4 and link tag <a>.

(2) Now let's copy all headings to one place:

:%g/<h[12]>/ t$

This command searches our file for the lines starting with <h1> or <h2> and copies them to the end of the file. Now we have a bunch of lines like:

<h1><a name="anchor1">Heading1></a></h1>
<h2><a name="anchor2">Heading2></a></h2>
<h2><a name="anchor3">Heading3></a></h2>
..........................
<h1><a name="anchorN">HeadingN></a></h1>

First, we want to convert all name=" to href="# in order to link table entries to their respective places in the text:

s:name=":href="#:

Second, we want our h1 entries look different from h2. Let's define CSS classes "majorhead" and "minorhead" and do the following:

g/<h1>/ s:<a:& class="majorhead":
g/<h2>/ s:<a:& class="minorhead":

Now our entries look like:

<h1><a class="majorhead" name="anchor1">Heading1></a></h1>
<h2><a class="minorhead" name="anchor2">Heading2></a></h2>

We no longer need h1 and h2 tags:

s:<h[21]>::

and replace closing tags with breaklines <br>

s:/h[21]:br:

<a class="majorhead" name="anchor1">Heading1></a><br>
<a class="minorhead" name="anchor2">Heading2></a><br>

 
### Working with Tables

Quite often you have to work with a text organized in tables/columns. Consider, for example, the following text

 	
America
Africa
Europe
Africa
Europe
Europe
Africa
Europe
 	
Europe
Europe
Suppose we want to change all "Europe" cells in the third column to "Asia":

:%s:\(\(\w\+\s\+\)\{2}\)Europe:\1Asia:

 	
America
Africa
Europe
Africa
Europe
 	
Africa
Europe
 	 	
Europe
To swap the first and the last columns:

:%s:\(\w\+\)\(.*\s\+\)\(\w\+\)$:\3\2\1:

Europe
America
Africa
 
Africa
Europe
Europe
Africa
Europe
 	
Europe
Europe
To be continued...

Other Regexp Flavors
 
Here I would like to compare Vim's regexp implementation with others, in particular, Perl's. You can't talk about regular expressions without mentioning Perl.

(with a help from Steve Kirkendall) The main differences between Perl and Vim are:

Perl doesn't require backslashes before most of its operators. Personally, I think it makes regexps more readable - the less backlashes are there the better.
Perl allows you to convert any quantifier into a non-greedy version by adding an extra ? after it. So ? is a non-greedy  .
Perl supports a lots of weird options that can be appended to the regexp, or even embedded in it.
You can also embed variable names in a Perl regular expression. Perl replaces the name with its value; this is called "variable interpolation".


