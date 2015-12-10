sed
$ sed -i.bak -e 's/\r//g' input.txt 


The advantage of sed over tr is that you can do in-line substitution. No need to create an intermediate file. This is done by the -i option.

If you want to make a backup of the original input.txt, you can specify a different file suffix like this:
$ sed -i.bak -e 's/\r//g' input.txt 


-i.bak will make a backup file by appending the suffix .bak to your original file name, resulting in something like input.txt.bak


$ sed -e 's/\(.*\)/\L\1/' input.txt > output.txt # convert file text to lower case

$ sed -n '0~4p' somefile
0~4 means select every 4th line, beginning at line 0. 
-n means only explicitly printed lines are included in output.


extract one line from a text file : 

$ sed -n 1p somefile.txt # sed prints all lines by default, -n prevents that. 1p prints first line.


$ sed '1!d' somefile.txt #Alternatively, you can tell sed to delete all but the first line.
# Note that the single quotes are necessary. Otherwise, the !d will bring back the last command you executed that starts with the letter d. 



$ sed -n 2,4p somefile.txt #To extract a range of lines, say lines 2 to 4, you can execute either of the following:
$ sed '2,4!d' somefile.txt



$ sed -n -e 1,2p -e 4p somefile.txt #What if the lines you want to extract are not in sequence, say lines 1 to 2, and line 4?
