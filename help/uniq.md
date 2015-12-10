UNIQ command examples in unix and linux
By surya aix13:52No comments

Uniq command in unix or linux system is used to suppress the duplicate lines from a file. It discards all the successive identical lines except one from the input and writes the output.

The syntax of uniq command is
# uniq [option] filename
The options of uniq command are:
c : Count of occurrence of each line.
d : Prints only duplicate lines.
D : Print all duplicate lines
f : Avoid comparing first N fields.
i : Ignore case when comparing.
s : Avoid comparing first N characters.
u : Prints only unique lines.
w : Compare no more than N characters in lines
Uniq Command Examples:

First create the following example.txt file in your unix or linux operating system.
# cat example.txt
Unix operating system
unix operating system
unix dedicated server
linux dedicated server
1. Suppress duplicate lines

The default behavior of the uniq command is to suppress the duplicate line. Note that, you have to pass sorted input to the uniq, as it compares only successive lines.
# uniq example.txt
unix operating system
unix dedicated server
linux dedicated server

If the lines in the file are not in sorted order, then use the sort command and then pipe the output to the uniq command.
# sort example.txt | uniq
2. Count of lines

The -c option is used to find how many times each line occurs in the file. It prefixes each line with the count.
# uniq -c example.txt
      2 unix operating system
      1 unix dedicated server
      1 linux dedicated server
3. Display only duplicate lines

You can print only the lines that occur more than once in a file using the -d option.
> uniq -d example.txt
unix operating system

> uniq -D example.txt
unix operating system
unix operating system
The -D option prints all the duplicate lines.
4. Skip first N fields in comparison

The -f option is used to skip the first N columns in comparison. Here the fields are delimited by the space character.
# uniq -f2 example.txt
unix operating system
unix dedicated server
In the above example the uniq command, just compares the last fields. For the first two lines, the last field contains the string "system". Uniq prints the first line and skips the second. Similarly it prints the third line and skips the fourth line.
5. Print only unique lines

You can skip the duplicate lines and print only unique lines using the -u option
# uniq -u example.txt
unix dedicated server
linux dedicated server
