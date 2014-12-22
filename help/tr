Translate/ tr command examples in unix and linux
By surya aix13:531 comment
Tr stands for translate or transliterate. The tr utility in unix or linux system is used to translate, delete or squeeze characters. The syntax of tr command is
tr [options] set1 [set2]
The options of tr command are:
-c : complements the set of characters in string.
-d : deletes the characters in set1
-s : replaces repeated characters listed in the set1 with single occurrence
-t : truncates set1
Tr command Examples:

1. Convert lower case letters to upper case

The following tr command translates the lower case letters to capital letters in the give string:
# echo "linux dedicated server" | tr "[:lower:]" "[:upper:]"
LINUX DEDICATED SERVER
# echo "linux dedicated server" | tr "[a-z]" "[A-Z]"
LINUX DEDICATED SERVER
2. Transform upper case letters to lower case.

Similar to the above example, you can translate the uppercase letters to small letters.
# echo "UNIX DEDICATED SERVER" | tr "[:upper:]" "[:lower:]"
unix dedicated server
# echo "UNIX DEDICATED SERVER" | tr "[A-Z]" "[a-z]"
unix dedicated server
3. Replace non-matching characters.

The -c option is used to replace the non-matching characters with another set of characters.
# echo "unix" | tr -c "u" "a"
uaaa
In the above example, except the character "c" other characters are replaced with "a"
4. Delete non-printable characters

The -d option can be used to delete characters. The following example deletes all the non-printable characters from a file.
# tr -cd "[:print:]" < filename
5. Squeezing characters

You can squeeze more than one occurrence of continuous characters with single occurrence. The following example squeezes two or more successive blank spaces into a single space.
# echo "linux    server" | tr -s " "
linux server
Here you can replace the space character with any other character by specifying in set2.
# "linux    server" | tr -s " " ","
linux,server
6. Delete characters

The following example removes the word linux from the string.
# echo "linuxserver" | tr -d "linux"
server



$ tr '[:upper:]' '[:lower:]' < input.txt > output.txt # convert text file to lower case
