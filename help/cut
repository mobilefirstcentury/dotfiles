
CUT command examples in unix / linux
By surya aix13:45No comments
Cut command in unix (or linux) is used to select sections of text from each line of files. You can use the cut command to select fields or columns from a line by specifying a delimiter or you can select a portion of text by specifying the range or characters. Basically the cut command slices a line and extracts the text.
Unix Cut Command Examples

We will see the usage of cut command by considering the below text file as an example
#cat file.txt
unix or linux os
is unix good os
is linux good os
1. Write a unix/linux cut command to print characters by position?

The cut command can be used to print characters in a line by specifying the position of the characters. To print the characters in a line, use the -c option in cut command
#cut -c4 file.txt
x
u
l
The above cut command prints the fourth character in each line of the file. You can print more than one character at a time by specifying the character positions in a comma separated list as shown in the below example
#cut -c4,6 file.txt
xo
ui
ln
This command prints the fourth and sixth character in each line.
2.Write a unix/linux cut command to print characters by range?

You can print a range of characters in a line by specifying the start and end position of the characters.
# cut -c4-7 file.txt
x or
unix
linu
The above cut command prints the characters from fourth position to the seventh position in each line. To print the first six characters in a line, omit the start position and specify only the end position.
# cut -c-6 file.txt
unix o
is uni
is lin
To print the characters from tenth position to the end, specify only the start position and omit the end position.
# cut -c10- file.txt
inux os
ood os
good os
If you omit the start and end positions, then the cut command prints the entire line.
# cut -c- file.txt
3.Write a unix/linux cut command to print the fields using the delimiter?

You can use the cut command just as awk command to extract the fields in a file using a delimiter. The -d option in cut command can be used to specify the delimiter and -f option is used to specify the field position.
# cut -d' ' -f2 file.txt
or
unix
linux
This command prints the second field in each line by treating the space as delimiter. You can print more than one field by specifying the position of the fields in a comma delimited list.
# cut -d' ' -f2,3 file.txt
or linux
unix good
linux good
The above command prints the second and third field in each line.

Note: If the delimiter you specified is not exists in the line, then the cut command prints the entire line. To suppress these lines use the -s option in cut command.
4. Write a unix/linux cut command to display range of fields?

You can print a range of fields by specifying the start and end position.
# cut -d' ' -f1-3 file.txt
The above command prints the first, second and third fields. To print the first three fields, you can ignore the start position and specify only the end position.
# cut -d' ' -f-3 file.txt
To print the fields from second fields to last field, you can omit the last field position.
cut -d' ' -f2- file.txt
5. Write a unix/linux cut command to display the first field from /etc/passwd file?

The /etc/passwd is a delimited file and the delimiter is a colon (:). The cut command to display the first field in /etc/passwd file is
# cut -d':' -f1 /etc/passwd
6. The input file contains the below text

# cat filenames.txt
logfile.dat
sum.pl
add_int.sh
Using the cut command extract the portion after the dot.
First reverse the text in each line and then apply the command on it.
# rev filenames.txt | cut -d'.' -f1
