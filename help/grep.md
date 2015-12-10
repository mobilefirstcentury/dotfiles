GREP COMMAND EXAMPLES

1) GREP command syntax

# grep options search term filename 
or
# command | grep options search term 

Example0: Search for a word “mom” or "word" dad in file1.txt
grep 'mom' 'dad' file1.txt 

Example1: Search for a word “ada” in file1.txt
grep ‘ada’ file1.txt 

Example2: Search for a word which is either capital or small letters(i — case-insensitive )
grep -i ‘ac’ file1.txt 

Example3: Inverce your search, search all words other than ace
grep -v ‘ace’ file1.txt 

Example4: To get the count of a ared word occurrence.
grep -c ‘ared’ file1.txt 

Example5: Find acd characters in a file and display the line numbers where grep finds acd
grep -n ‘acd’ file1.txt 

Example6: Find exact word ac ie should find only ac not acd or reacf etc.
grep -w ‘ac’ file1.txt 

Example7: Search for a word and print 2 lines Before to ths search
grep -B2 abc file1.txt 

Example8: Search for a word and print 2 lines After to ths search
grep -A2 abc file1.txt 

Example9: Search for a word and print 2 lines Before and after center to this search term
grep -C2 abc file1.txt 

Example10: Search for term recursively in sub directories as well.
grep -r ‘abc’ /etc/ 

Example11: Search for a term and just list the files which contains it with in a directory.
grep -l ‘abc’ /etc/

2) Basic regular expressions:

^ -- Caret symbol, Match beginning of the line.

$ -- Match End of the line

* -- Match 0 or more occurrence of previous character

. – Match Any single character

[] – Match Range of characters, just single occurrence.

            [a-z] –Match small letters

            [A-Z] –Match cap letters

            [0-9] – Match numerical.

[^] – Match Negate a sequence

 -- Match Escape character.
If we learn any new thing with example, it will be there for long time in our mind.

Now we will see one example each regular expression what we given above. 
Example1: Find all the lines which start with “Mr”

grep ‘^Mr’ filename
Example2: Find all the lines which ends with ‘sh’

grep ‘sh$’ filename
Example3: Display all the lines in a file expect empty lines.

grep –v ‘^$’ filename

Note:-v option is used to negate the search term, here ^$ indicates empty line, so our grep –v is filtering empty lines in the output.
Example4: Search for words which are bash, baash, bsh, baaash, baaaaash,

grep ‘ba*s’ filename

This will search for words which has a between b and s zero or more times. 
Example5: Search for all words which starts with b and h

grep ‘b.*h’ filename
Example6: Search for a word which is having three letters in it and starts with x and ends with m.

grep ‘x[a-z]m’ filename

This search will return all the 3 letter words which start with x and ends with m. 
Example7: Search words do not contain ‘ac’ in a file.

grep ‘[^ac]’ filename
Example8: Search for a ‘[‘ in a file

Note: The “[“is a special character, you cannot search with normal grep we have to use escape character () in order to negate it. So use ‘[‘ to search for [. This is applicable for all the special characters mention above.

grep ‘[’ filename
3) Extended regular expressions:

+ --Match one or more occurrences of previous character.

| -- Match Either character

? – Match 0 or 1 occurrence of previous character.

() –match a group of characters

{number} –Match number of occurrence of a character

{1, 3} –Match a character which is 1 to 3 times repetition

{5, } –Match a repeated character which is repeated 5 or more times.

Note1: In order to use this extended regular expressions we have to use –E option give grep the capability to understand Extended regular expressions. 

Note2: egrep is nothing but grep –E, so try to avoid it if grep itself can do the work for you. Why to learn new command? 

Example1:Search for a words which contains one or more occurrence of ‘b’ between a and c.

grep –E ‘ab+c’ filename
Example2: Search for a word which contains zero or one occurrence of b between a and c

grep –E ‘ab?c’ filename
Example3: Search for a word which contains either a or b, a and b between d, e characters

grep –E ‘da|be’ filename
Example4: Search for a word which contains either a or b, but not both a and b between d, e characters

grep –E ‘d(a|b)e’ filename
Example5: Search for a word which contains only 2 ‘b’ between a and c character

grep –E ‘ab{2}c’ filename
Example6: Search for a word which contains 3 to 4 ‘b’ between a and c character

grep –E ‘ab{2,4}c’ filename
Example7: Search for a word which contains 3 or more ‘b’ between a and c character

grep –E ‘ab{3, }c’ filename

Note: When we are using {} we have to give a range, but in this example we did not give range we just started the range but did not end the range which indicates infinity.