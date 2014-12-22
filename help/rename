Consider this common scenario. A directory contains multiple files that are named using a common convention: for example, image-001.png, image-002.png, image-003.png, etc. You want to rename the files to, say, upload-001.png, upload-002.png, upload-003.png, etc.

The coders among us can write a bash script to automate the process. For expedience, this post shows how to use the built-in rename command to achieve the same goal.

The following command replaces the first occurrence of image with upload in the file name for all PNG files in the current directory.


$ rename -v 's/image/upload/' *.png
image-001.png renamed as upload-001.png
image-002.png renamed as upload-002.png
image-003.png renamed as upload-003.png
Notes:

-v
Produce verbose output, listing each file with its old and new names.

's/image/upload/'
Provide a valid PERL expression to modify the file names.

*.png
Specify the files to be renamed.

The full power of PERL expressions is at your disposal to specify the file renaming rule. A thorough explanation of PERL expressions is beyond the scope of this post. The following only samples some useful PERL expressions.

Global replace.
If you want to replace ALL occurrences of a pattern in a file name, you must specify a global replace. For example, you want to replace all spaces in the file names with null, that is, delete all spaces.


$ rename -v 's/ //g' *.pdf
Boarding Pass - Derek 2014-05-19.pdf renamed as BoardingPass-Derek2014-05-19.pdf
Boarding Pass - Erin 2014-05-19.pdf  renamed as BoardingPass-Erin2014-05-19.pdf
capture_still_frame (1).pdf renamed as capture_still_frame(1).pdf
capture_still_frame (2).pdf renamed as capture_still_frame(2).pdf
Match any character in a list.
Suppose you want to replace all occurrences of spaces, underscores, and round brackets with the dash character. Here is how.


$ rename -v 's/[_ ()]/-/g' *.pdf
Any character within the square brackets is matched, and replaced by a dash.

Back reference variables.
Suppose the file names follow this convention: prefix-sequence.suffix. For instance, usa-001.png. My task is to switch the order of the prefix and the sequence number, resulting in names such as 001-usa.png. You can achieve the result by using back reference variables as follows:


$ rename -v 's/(.+)-([0-9]{3})/$2-$1/' *.png
india-003.png renamed as 003-india.png
uk-002.png renamed as 002-uk.png
usa-001.png renamed as 001-usa.png
The above example has 2 back reference variables separated by a dash: $1 and $2. The first variable $1 is defined by (.+), which means 1 or more characters. The second variable $2 is defined by ([0-9]{3}), which means exactly 3 digits, each digit being from 0 to 9. The replacement pattern, $2-$1, specifies that $2 now comes before $1, with a dash in between.

To avoid potential mistakes, you can first do a mock run of the rename command before actually running it for real. Specify the -n option, which stands for 'no-act'.


$ rename -n 's/image/upload/' *.png
image-001.png renamed as upload-001.png
image-002.png renamed as upload-002.png
image-003.png renamed as upload-003.png
If all the suggested replacements look reasonable, then go ahead to run the command without the -n.
