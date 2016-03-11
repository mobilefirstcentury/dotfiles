---- sed cheatsheet ----
========================


$ sed -e 's/\r//g' input.txt                     # outputs input.txt  content with '\r' characters supressed (input.txt is not modified)
$ ls ./**/*.md | xargs sed -i '1s/\*/-/g'        # replaces occurences of '*' by '-i' in the first line markdown file in this directory and its sub-directories
$ sed -i.bak -e 's/\r//g' input.txt              # edits in place but creates backup file with .bak extension
$ sed -e 's/\(.*\)/\L\1/' input.txt > output.txt # convert file text to lower case
$ cat ~todo/dev.md | sed -e 's/^\(.*\)i$/\1/'    # Doesn't modify ~todo/dev.md and prints results to stdout
$ sed -n '0~4p' somefile                         # 0~4 means select every 4th line, beginning at line 0.
$ sed -n 1p somefile.txt                         # prints only first line.
$ sed '1!d' somefile.txt                         # Alternatively, you can tell sed to delete all but the first line. Note that the single quotes are necessary. Otherwise, the !d will bring
                                                   back the last command you executed that starts with the letter d.

$ sed -n 2,4p somefile.txt                       # To extract a range of lines, say lines 2 to 4, you can execute either of the following:
$ sed '2,4!d' somefile.txt                       # deletes lines from line 2 to 4
$ sed -n -e 1,2p -e 4p somefile.txt              # extract lines not in sequence: 1 to 2, and line 4

