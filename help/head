
HEAD command examples in UNIX / Linux
By surya aix13:51No comments
The head command in Unix or Linux system is used to print the first N lines from the file to the terminal. The syntax of head command is
head [options] [files]
The head command options are:
c : Prints the first N bytes of file; With leading -, prints all but the last N bytes of the file.
n : Prints first N lines; With leading - print all but the last N lines of each file.
Head Command Examples:

Create the following file in your linux or Unix operating system for practising the examples:
# cat example.txt
linux storage
ubuntu os
fedora
1. Display first 10 lines

By default, the head command prints the first 10 lines from a file.
# head example.txt
2. Display first N lines

Use the -n option to print the first n lines from a file. The following example prints the first 2 lines from the file:
# head -n2 example.txt
linux storage
ubuntu os
3. Skip last N lines

You can skip the last N lines from a file and print the remaining lines. The following example skips the last 2 lines and prints the remaining lines.
# head -n-2 example.txt
linux storage
4. Print the first n bytes

use the -c option to print the first N bytes from the file. The following example prints the first 5 bytes from the file.
# head -c5 example.txt
linux
5. Skip printing last n bytes

Use the leading "-", to skip printing last N bytes.
# head -c-7 example.txt
linux storage
ubuntu os
6. Print line between M and N lines

You can combine the head command with tail command to print lines between the line numbers M and N. The following command prints the lines between numbers 5 and 10.
# head -n10 filename | tail -5
