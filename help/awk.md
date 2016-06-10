---- AWK User Guide ----
========================

command structure
------------------

  # can be invoced with more than one file
  $ awk [options] 'BEGIN {awk-commands} /pattern/{awk-commands} END {awk-commands}' file file file
  $ awk [options] - f script.awk file file file



usage
-------
  # awk-command is a script with C-like syntax

awk -v name=Jerry 'BEGIN{printf "Name = %s\n", name}' | 'name' variable contains 'Jerry' during script execution
awk --lint '/pattern/{awk-commands}' file  | lints script
awk --profile '/patter/{awk-commands}' file | pretty prints 'awk-commands' in awkpro.out 
awk --profile=pretty.out '/patter/{awk-commands}' file | pretty prints 'awk-commands' in pretty (this is the default output file name)
awk '{print $3 "\t" $4}' marks.txt   | prints only column 3 and 4 separated by a tab
awk 'BEGIN {print "Name\tNote"} {print $3 "\t" $4 }' marks.txt  | prints column tites and columns 3 & 4 separated with a tab 
awk '/a/'  | prints lines containing lettre 'a'. Printing line is default body action.
awk '/a/{++LINECNT} END {print "There are " LINECNT  " lines"}' marks.txt   | count and print the number of lines containing letter 'a'
awk '/a/{++LINECNT} END {print "Count = ", LINECNT}' marks.txt   | count and print the number of lines containing letter 'a'

awk 'BEGIN { a = 10; if (a == 10) print "a is ten" }' | conditional statement
awk 'length($0)>18' | print rows longer than 18 characters ($0 is the entire line currently processed)

awk '{if(length($0)>3) print $0}' | print rows longer than 3 characters ($0 is the entire line currently processed)
awk '{if(length($0)>3){printf "- "; print $0}}' marks.txt    | print rows longer than 3 characters preceded by a dash

awk 'BEGIN {num = 11; if (num % 2 == 0) printf "%d is even number.\n", num; else printf "%d is odd number.\n", num }' | if then else statement
awk 'BEGIN { a=30; if (a==10) print "a = 10"; else if (a == 20) print "a = 20"; else if (a == 30) print "a = 30"; }' | if then elseif else statement

awk 'NF>3' | print lignes with more than 3 fields
awk 'NR<=2' | prints only the two first lines

awk 'BEGIN { ret = getline < "non-existing-file.txt"; if (ret == -1) print "Error:", ERRNO }' | print "Error: No such file or directory" 
awk 'BEGIN {print PROCINFO["pid"]}' | print current process id (PID)
awk 'BEGIN { a = 10; b = 20; (a > b) ? max = a : max = b; print "Max =", max}' | ternary operator
awk 'BEGIN { str1="Hello, "; str2="World"; str3 = str1 str2; print str3 }' | concatenate strings
awk 'BEGIN { arr[0] = 1; arr[1] = 2; arr[2] = 3; for (i in arr) printf "arr[%d] = %d\n", i, arr[i] }'  | loop in an array
awk '$0 ~ 9' file | print lines containing '9'
awk '$0 !~ 9' file | print lines not containing '9'
awk 'BEGIN { fruits["mango"]="yellow"; fruits["orange"]="orange" print fruits["orange"] "\n" fruits["mango"] }' | use an associative array
awk 'BEGIN { fruits["mango"]="yellow"; fruits["orange"]="orange"; delete fruits["orange"]; print fruits["orange"] }' | delete an element of an associative array


variables
---------

  $0 | entire line processed
  $n | nth field of line processed
  ARGC  | number of arguments
  ARGV  | array of arguments. ARGV[0] is always 'awk'
  ARGIND | index in ARGV of currently processed file
  CONVFMT | number conversion format. defauts to '%.6g'
  OFMT   | number printing format. defaults to '%.6g'
  ENVIRON | associative array of environment variables
  FILENAME | file beeing processed
  FS | input fied separators. default ' $'. Example of possible modification : FS='^I $' where ^I is the tab character
  OFS | ouput field seperator. default to ' $'
  RS | input record separator. defaults to '$'
  ORS | Outpur record separator. defaults to '$'
  NF | number of fields in current line
  NR |  current line number (doesn't reset if several files processed)
  FNR | current line number in the current file (resets if several files processed)
  RLENGTH | length os the string matched by function 'match'
  RSTART | first position of the string matched by function 'match'
  ERRNO | error encontrer
  FIELDWIDTHS | when set fixed witdth field are processed and FS is not used
  IGNORECASE | when set processing is case insensitive
  PROCINFO | associative arrray of infos on process

examples
-------

 # double space a file
 awk '1;{print ""}'
 awk 'BEGIN{ORS="\n\n"};1'

 # double space a file which already has blank lines in it. Output file should contain no more than one blank line between lines of text.
 awk 'NF{print $0 "\n"}'

 # triple space a file
 awk '1;{print "\n"}'


 # precede each line by its line number FOR THAT FILE (left alignment). Using a tab (\t) instead of space will preserve margins.
 awk '{print FNR "\t" $0}' files*

 # precede each line by its line number FOR ALL FILES TOGETHER, with tab.
 awk '{print NR "\t" $0}' files*

 # number each line of a file (number on left, right-aligned) Double the percent signs if typing from the DOS command prompt.
 awk '{printf("%5d : %s\n", NR,$0)}'

 # number each line of file, but only print numbers if line is not blank Remember caveats about Unix treatment of \r (mentioned above)
 awk 'NF{$0=++a " :" $0};1'
 awk '{print (NF? ++a " :" :"") $0}'

 # count lines (emulates "wc -l")
 awk 'END{print NR}'

 # print the sums of the fields of every line
 awk '{s=0; for (i=1; i<=NF; i++) s=s+$i; print s}'

 # add all fields in all lines and print the sum
 awk '{for (i=1; i<=NF; i++) s=s+$i}; END{print s}'

 # print every line after replacing each field with its absolute value
 awk '{for (i=1; i<=NF; i++) if ($i < 0) $i = -$i; print }'
 awk '{for (i=1; i<=NF; i++) $i = ($i < 0) ? -$i : $i; print }'

 # print the total number of fields ("words") in all lines
 awk '{ total = total + NF }; END {print total}' file

 # print the total number of lines that contain "Beth"
 awk '/Beth/{n++}; END {print n+0}' file

 # print the largest first field and the line that contains it Intended for finding the longest string in field #1
 awk '$1 > max {max=$1; maxline=$0}; END{ print max, maxline}'

 # print the number of fields in each line, followed by the line
 awk '{ print NF ":" $0 } '

 # print the last field of each line
 awk '{ print $NF }'

 # print the last field of the last line
 awk '{ field = $NF }; END{ print field }'

 # print every line with more than 4 fields
 awk 'NF > 4'

 # print every line where the value of the last field is > 4
 awk '$NF > 4'

 # create a string of a specific length (e.g., generate 513 spaces)
 awk 'BEGIN{while (a++<513) s=s " "; print s}'

 # insert a string of specific length at a certain character position
 # Example: insert 49 spaces after column #6 of each input line.
 gawk --re-interval 'BEGIN{while(a++<49)s=s " "};{sub(/^.{6}/,"&" s)};1'

 # These next 2 entries are not one-line scripts, but the technique
 # is so handy that it merits inclusion here.
 
 # create an array named "month", indexed by numbers, so that month[1]
 # is 'Jan', month[2] is 'Feb', month[3] is 'Mar' and so on.
 split("Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec", month, " ")

 # create an array named "mdigit", indexed by strings, so that
 # mdigit["Jan"] is 1, mdigit["Feb"] is 2, etc. Requires "month" array
 for (i=1; i<=12; i++) mdigit[month[i]] = i

 # convert DOS newlines (CR/LF) to Unix format
 awk '{sub(/\r$/,"")};1'   # assumes EACH line ends with Ctrl-M
  tr -d \r <infile >outfile            # GNU tr version 1.22 or higher

 # convert Unix newlines (LF) to DOS format
 awk '{sub(/$/,"\r")};1'



 # delete leading whitespace (spaces, tabs) from front of each line aligns all text flush left
 awk '{sub(/^[ \t]+/, "")};1'

 # delete trailing whitespace (spaces, tabs) from end of each line
 awk '{sub(/[ \t]+$/, "")};1'

 # delete BOTH leading and trailing whitespace from each line
 awk '{gsub(/^[ \t]+|[ \t]+$/,"")};1'
 awk '{$1=$1};1'           # also removes extra space between fields

 # insert 5 blank spaces at beginning of each line (make page offset)
 awk '{sub(/^/, "     ")};1'

 # align all text flush right on a 79-column width
 awk '{printf "%79s\n", $0}' file*

 # center all text on a 79-character width
 awk '{l=length();s=int((79-l)/2); printf "%"(s+l)"s\n",$0}' file*

 # substitute (find and replace) "foo" with "bar" on each line
 awk '{sub(/foo/,"bar")}; 1'           # replace only 1st instance
 gawk '{$0=gensub(/foo/,"bar",4)}; 1'  # replace only 4th instance
 awk '{gsub(/foo/,"bar")}; 1'          # replace ALL instances in a line

 # substitute "foo" with "bar" ONLY for lines which contain "baz"
 awk '/baz/{gsub(/foo/, "bar")}; 1'

 # substitute "foo" with "bar" EXCEPT for lines which contain "baz"
 awk '!/baz/{gsub(/foo/, "bar")}; 1'

 # change "scarlet" or "ruby" or "puce" to "red"
 awk '{gsub(/scarlet|ruby|puce/, "red")}; 1'

 # reverse order of lines (emulates "tac")
 awk '{a[i++]=$0} END {for (j=i-1; j>=0;) print a[j--] }' file*

 # if a line ends with a backslash, append the next line to it (fails if there are multiple lines ending with backslash...)
 awk '/\\$/ {sub(/\\$/,""); getline t; print $0 t; next}; 1' file*

 # print and sort the login names of all users
 awk -F ":" '{print $1 | "sort" }' /etc/passwd

 # print the first 2 fields, in opposite order, of every line
 awk '{print $2, $1}' file

 # switch the first 2 fields of every line
 awk '{temp = $1; $1 = $2; $2 = temp}' file

 # print every line, deleting the second field of that line
 awk '{ $2 = ""; print }'

 # print in reverse order the fields of every line
 awk '{for (i=NF; i>0; i--) printf("%s ",$i);print ""}' file

 # concatenate every 5 lines of input, using a comma separator between fields
 awk 'ORS=NR%5?",":"\n"' file

 # print first 10 lines of file (emulates behavior of "head")
 awk 'NR < 11'

 # print first line of file (emulates "head -1")
 awk 'NR>1{exit};1'

  # print the last 2 lines of a file (emulates "tail -2")
 awk '{y=x "\n" $0; x=$0};END{print y}'

 # print the last line of a file (emulates "tail -1")
 awk 'END{print}'

 # print only lines which match regular expression (emulates "grep")
 awk '/regex/'

 # print only lines which do NOT match regex (emulates "grep -v")
 awk '!/regex/'

 # print any line where field #5 is equal to "abc123"
 awk '$5 == "abc123"'

 # print only those lines where field #5 is NOT equal to "abc123" This will also print lines which have less than 5 fields.
 awk '$5 != "abc123"'
 awk '!($5 == "abc123")'

 # matching a field against a regular expression
 awk '$7  ~ /^[a-f]/'    # print line if field #7 matches regex
 awk '$7 !~ /^[a-f]/'    # print line if field #7 does NOT match regex

 # print the line immediately before a regex, but not the line containing the regex
 awk '/regex/{print x};{x=$0}'
 awk '/regex/{print (NR==1 ? "match on line 1" : x)};{x=$0}'

 # print the line immediately after a regex, but not the line containing the regex
 awk '/regex/{getline;print}'

 # grep for AAA and BBB and CCC (in any order on the same line)
 awk '/AAA/ && /BBB/ && /CCC/'

 # grep for AAA and BBB and CCC (in that order)
 awk '/AAA.*BBB.*CCC/'

 # print only lines of 65 characters or longer
 awk 'length > 64'

 # print only lines of less than 65 characters
 awk 'length < 64'

 # print section of file from regular expression to end of file
 awk '/regex/,0'
 awk '/regex/,EOF'

 # print section of file based on line numbers (lines 8-12, inclusive)
 awk 'NR==8,NR==12'

 # print line number 52
 awk 'NR==52'
 awk 'NR==52 {print;exit}'          # more efficient on large files

 # print section of file between two regular expressions (inclusive)
 awk '/Iowa/,/Montana/'             # case sensitive


 # delete ALL blank lines from a file (same as "grep '.' ")
 awk NF
 awk '/./'

 # remove duplicate, consecutive lines (emulates "uniq")
 awk 'a !~ $0; {a=$0}'

 # remove duplicate, nonconsecutive lines
 awk '!a[$0]++'                     # most concise script
 awk '!($0 in a){a[$0];print}'      # most efficient script

