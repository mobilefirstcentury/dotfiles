---- Bash parameters and parameter expansions ----
==================================================

   Passing and analyzing parameters in scripts

   Do you sometimes wonder how to use parameters with your scripts, and
   how to pass them to internal functions or other scripts? Do you need to
   do simple validity tests on parameters or options, or perform simple
   extraction and replacement operations on the parameter strings? This
   tip helps you with parameter use and the various parameter expansions
   available in the bash shell.

   [20]View more content in this series |
   Share:

   [21]Ian Shields, Senior Programmer, IBM

   [22]Close [x]

   author photo - Ian Shields Ian Shields works on a multitude of Linux
   projects for the developerWorks Linux zone. He is a Senior Programmer
   at IBM at the Research Triangle Park, NC. He joined IBM in Canberra,
   Australia, as a Systems Engineer in 1973, and has since worked on
   communications systems and pervasive computing in Montreal, Canada, and
   RTP, NC. He has several patents. His undergraduate degree is in pure
   mathematics and philosophy from the Australian National University. He
   has an M.S. and Ph.D. in computer science from North Carolina State
   University. You can contact Ian at [23]ishields@us.ibm.com.
   developerWorks Contributing author level

   16 May 2007

   Also available in [24]Russian
     * [25]- Table of contents
          + [26]Passed parameters
          + [27]Options and getopts
          + [28]Parameter expansions
          + [29]Putting it together
          + [30]Default values
          + [31]Passing parameters
          + [32]Learn more
          + [33]Resources
          + [34]Comments

   The bash shell is available on many Linux® and UNIX® systems today, and
   is a common default shell on Linux. In this tip you will learn how to
   handle parameters and options in your bash scripts and how to use the
   shell's parameter expansions to check or modify parameters. This
   article focuses on bash, and the examples were all run on Linux systems
   with bash as the shell. However, the same expansions are available in
   many other shells, such as ksh, ash, or dash, and you may use them with
   these shells on other UNIX systems or even environments such as Cygwin.
   This tip builds on the tools covered in the earlier tip [35]Linux tip:
   Bash test and comparison functions. Some of the material in this
   article is excerpted from the developerWorks tutorial [36]LPI exam 102
   prep: Shells, scripting, programming, and compiling, which covers many
   basic scripting techniques.

Passed parameters

   Part of the beauty of functions and shell scripts is the ability to
   make a single function or script behave differently by passing
   parameters to it. In this section you will learn how to identify and
   use the parameters that are passed.

   Inside a function or script, you can refer to the parameters using the
   bash special variables in Table 1. You prefix these with a $ symbol to
   reference them as with other shell variables.

   CAPTION: Table 1. Shell parameters for functions

   Parameter Purpose
   0, 1, 2, ... The positional parameters starting from parameter 0.
   Parameter 0 refers to the name of the program that started bash, or the
   name of the shell script if the function is running within a shell
   script. See the bash man pages for information on other possibilities,
   such as when bash is started with the -c parameter. A string enclosed
   in single or double quotes will be passed as a single parameter, and
   the quotes will be stripped. In the case of double quotes, any shell
   variables such as $HOME will be expanded before the function is called.
   You will need to use single or double quotes to pass parameters that
   contain embedded blanks or other characters that might have special
   meaning to the shell.
   * The positional parameters starting from parameter 1. If the expansion
   is done within double quotes, then the expansion is a single word with
   the first character of the IFS special variable separating the
   parameters, or no intervening space if IFS is null. The default IFS
   value is a blank, tab, and newline. If IFS is unset, then the separator
   used is a blank, just as for the default IFS.
   @ The positional parameters starting from parameter 1. If the expansion
   is done within double quotes, then each parameter becomes a single
   word, so that "$@" is equivalent to "$1" "$2" ... If your parameters
   are likely to contain embedded blanks, you will want to use this form.
   # The number of parameters, not including parameter 0.

   Note: If you have more than 9 parameters, you cannot use $10 to refer
   to the tenth one. You must first either process or save the first
   parameter ($1), then use the shift command to drop parameter 1 and move
   all remaining parameters down 1, so that $10 becomes $9 and so on. The
   value of $# will be updated to reflect the remaining number of
   parameters. In practice, you will most often want to iterate over the
   parameters to a function or shell script, or a list created by command
   substitution using a for statement, so this constraint is seldom a
   problem.

   Now you can define a simple function to do nothing more than tell you
   how many parameters it has and display them as shown in Listing 1.

Listing 1. Function parameters

[ian@pinguino ~]$ testfunc () { echo "$# parameters"; echo "$@"; }
[ian@pinguino ~]$ testfunc
0 parameters

[ian@pinguino ~]$ testfunc a b c
3 parameters
a b c
[ian@pinguino ~]$ testfunc a "b c"
2 parameters
a b c

   Shell scripts handle parameters in the same way as functions. Indeed,
   you will frequently find yourself assembling scripts out of many small
   functions. Listing 2 shows a shell script, testfunc.sh, for the same
   simple task and the result of running it with one of the above inputs.
   Remember to mark your script executable using chmod +x.

Listing 2. Shell script parameters

[ian@pinguino ~]$ cat testfunc.sh
#!/bin/bash
echo "$# parameters"
echo "$@";
[ian@pinguino ~]$ ./testfunc.sh a "b c"
2 parameters
a b c

   In Table 1 you discovered that the shell may refer to the list of
   passed parameters as $* or $@ and that whether you quote these
   expressions or not affects how they are interpreted. Whether you use
   $*, "$*", $@, or "$@", you won't see much difference in the output of
   the above function, but rest assured that when things become more
   complex, the distinctions will matter very much, as you wish to analyze
   parameters or perhaps pass some to other functions or scripts. Listing
   3 shows a function that prints out the number of parameters and then
   prints the parameters according to these four alternatives. Listing 4
   shows the function in action. The default IFS variable uses a space as
   its first character, so Listing 4 adds a vertical bar as the first
   character of the IFS variable to show more clearly where this character
   is being used in the expansion of "$*".

Listing 3. A function to explore parameter handling differences

[ian@pinguino ~]$ type testfunc2
testfunc2 is a function
testfunc2 ()
{
    echo "$# parameters";
    echo Using '$*';
    for p in $*;
    do
        echo "[$p]";
    done;
    echo Using '"$*"';
    for p in "$*";
    do
        echo "[$p]";
    done;
    echo Using '$@';
    for p in $@;
    do
        echo "[$p]";
    done;
    echo Using '"$@"';
    for p in "$@";
    do
        echo "[$p]";
    done
}

Listing 4. Printing parameter information with testfunc2

[ian@pinguino ~]$ IFS="|${IFS}" testfunc2 abc "a bc" "1 2
> 3"
3 parameters
Using $*
[abc]
[a]
[bc]
[1]
[2]
[3]
Using "$*"
[abc|a bc|1 2
3]
Using $@
[abc]
[a]
[bc]
[1]
[2]
[3]
Using "$@"
[abc]
[a bc]
[1 2
3]

   Study the differences carefully, particularly for the quoted forms and
   the parameters that include white space such as blanks or newline
   characters. From the single pair of [] characters, note that the
   expansion of "$*" is indeed a single word.
     __________________________________________________________________

   [37]Back to top

Options and getopts

   Traditional UNIX and Linux commands consider some of the passed
   arguments to be options. Historically, these were single character
   switches distinguished from other parameters by having a leading hyphen
   or minus sign. For convenience several options can be combined as in
   the command ls -lrt, which provides a long (option -l) directory
   listing in reverse order (option -r) sorted by modification time
   (option -t).

   You can use the same technique with shell scripts and the getopts
   builtin command eases your task. To see how this works, consider the
   example script, testopt.sh, shown in Listing 5.

Listing 5. The testopt.sh script

#!/bin/bash
echo "OPTIND starts at $OPTIND"
while getopts ":pq:" optname
  do
    case "$optname" in
      "p")
        echo "Option $optname is specified"
        ;;
      "q")
        echo "Option $optname has value $OPTARG"
        ;;
      "?")
        echo "Unknown option $OPTARG"
        ;;
      ":")
        echo "No argument value for option $OPTARG"
        ;;
      *)
      # Should not occur
        echo "Unknown error while processing options"
        ;;
    esac
    echo "OPTIND is now $OPTIND"
  done

   The getopts command uses a couple of predetermined variables. The
   OPTIND variable is initially set to 1. Thereafter it contains the index
   of the next parameter to be processed. The getopts command returns true
   if an option is found, so a common option processing paradigm uses a
   while loop with a case statement as in this example. The first argument
   to getopts is a list of option letters to be recognized, in this case,
   p and r. A colon (:) after an option letter indicates that the option
   requires a value; for example, a -f option might be used to indicate a
   file name, as in the tar command. The leading colon in this example
   tells getopts to be silent and suppress the normal error messages, as
   this script will provide its own error handling.

   The second parameter, optname in this example, is the name of a
   variable which will receive the name of the option found. If an option
   is expected to have a value, the value, if present, will be placed in
   the variable OPTARG. In silent mode, either of the following two error
   conditions may occur.
    1. If an unrecognized option is found, then optname will contain a ?
       and OPTARG will contain the unknown option.
    2. If an options that requires a value is found but the value is not,
       then optname will contain a : and OPTARG will contain the name of
       the option whose argument is missing.

   If not in silent mode, these errors cause a diagnostic error message
   and OPTARG is unset. The script may use the values of ? or : in optname
   to detect and possibly handle the error.

   Listing 6 shows two examples of running this simple script.

Listing 6. Running the testopt.sh script

[ian@pinguino ~]$ ./testopt.sh -p -q
OPTIND starts at 1
Option p is specified
OPTIND is now 2
No argument value for option q
OPTIND is now 3
[ian@pinguino ~]$ ./testopt.sh -p -q -r -s tuv
OPTIND starts at 1
Option p is specified
OPTIND is now 2
Option q has value -r
OPTIND is now 4
Unknown option s
OPTIND is now 5

   If you need to do so, you may pass a set of arguments to getopts for
   evaluation. You will need to reset OPTIND to 1 yourself if you call
   getopts for a new set of arguments in a script where you have already
   used it with other arguments. See the man or info pages for bash for
   additional details.
     __________________________________________________________________

   [38]Back to top

Parameter expansions

   So now you have looked at how parameters are passed into a function or
   script and how to identify options. Now to start processing the options
   and parameters. It would be nice to know what arguments are left after
   processing the options. Perhaps then you will need to validate
   parameter values, or assign defaults to missing parameters. This
   section will introduce some of the parameter expansions that are
   available in bash. Of course, you also have the full power of the Linux
   or UNIX commands such as sed or awk for more complex jobs, but you
   should also know how to use shell expansions.

   Let's start off by building a script from the option analysis and
   parameter analysis functions that you saw above. Our testargs.sh script
   is shown in Listing 7.

Listing 7. The testargs.sh script

#!/bin/bash

showopts () {
  while getopts ":pq:" optname
    do
      case "$optname" in
        "p")
          echo "Option $optname is specified"
          ;;
        "q")
          echo "Option $optname has value $OPTARG"
          ;;
        "?")
          echo "Unknown option $OPTARG"
          ;;
        ":")
          echo "No argument value for option $OPTARG"
          ;;
        *)
        # Should not occur
          echo "Unknown error while processing options"
          ;;
      esac
    done
  return $OPTIND
}

showargs () {
  for p in "$@"
    do
      echo "[$p]"
    done
}

optinfo=$(showopts "$@")
argstart=$?
arginfo=$(showargs "${@:$argstart}")
echo "Arguments are:"
echo "$arginfo"
echo "Options are:"
echo "$optinfo"

   Try running this script a few times to see how it works, then we'll
   examine it in more detail. Listing 8 shows some sample output.

Listing 8. Running the testargs.sh script

[ian@pinguino ~]$ ./testargs.sh -p -q qoptval abc "def ghi"
Arguments are:
[abc]
[def ghi]
Options are:
Option p is specified
Option q has value qoptval
[ian@pinguino ~]$ ./testargs.sh -q qoptval -p -r abc "def ghi"
Arguments are:
[abc]
[def ghi]
Options are:
Option q has value qoptval
Option p is specified
Unknown option r
[ian@pinguino ~]$ ./testargs.sh "def ghi"
Arguments are:
[def ghi]
Options are:

   Notice how the arguments are separated from the options. The showopts
   function analyzes the options as before, but uses the return statement
   to return the value of the OPTIND variable to the calling statement.
   The calling process assigns this value to a variable, argstart. This
   value is then used to select a subset of the original parameters,
   consisting of those parameters that were not processed as options. This
   is done using the parameter expansion
   ${@:$argstart}
   Remember to use quotes around this expression to keep parameters with
   embedded spaces together as you saw back in Listing 2.

   If you're new to scripts and functions, note the following:
    1. The return statement returns an exit value from the showopts
       function which is accessed from the caller using $?. You might also
       use return values from functions with command such as test or while
       to control branching or looping.
    2. Bash functions can include the optional word "function", for
       example:
       function showopts ()
       This is not part of the POSIX standard and is not supported on
       shells such as dash, so if you use it, don't make your shebang line
       #!/bin/sh
       as this will give you the system's default shell which might not
       work as you wish.
    3. Function output, for example the output produced by the echo
       statements in the two functions here, is not printed, but made
       accessible to the caller. If it is not assigned to a variable, or
       it is not otherwise used as part of the calling statement, then the
       shell will attempt to execute it rather than display it.

Subsets and substrings

   The general form of this expansion is ${PARAMETER:OFFSET:LENGTH}, where
   the LENGTH argument is optional. So, if you only want to select a
   specific subset of the script arguments, you can use the full version
   to say how many arguments to select. For example, ${@:4:3} refers to
   the three arguments starting at argument 4, namely arguments 4, 5 and
   6. You can use this expansion to select individual parameters beyond
   those immediately accessible using $1 through $9. ${@:15:1} is a way of
   accessing parameter 15 directly.

   You can use this expansion with individual parameters as well as the
   whole parameter set represented by $* or $@. In this case, the
   parameter is treated as a string and the number refer to offset and
   length. For example, if the variable x has the value "some value" then
   ${x:3:5}
   would have the value "e val", as shown in Listing 9.

Listing 9. Substrings of shell parameter values

[ian@pinguino ~]$ x="some value"
[ian@pinguino ~]$ echo "${x:3:5}"
e val

Lengths

   You have already seen that $# refers to the number of parameters and
   that the ${PARAMETER:OFFSET:LENGTH} expansion applies to both
   individual parameters as well as $* and $@, so it should come as no
   surprise that an analogous construct, ${#PARAMETER} is available to
   determine the length of an individual parameter. The simple testlength
   function shown in Listing 10 illustrates this. Try it out yourself.

Listing 10. Parameter lengths

[ian@pinguino ~]$ testlength () { for p in "$@"; do echo ${#p};done }
[ian@pinguino ~]$ testlength 1 abc "def ghi"
1
3
7

Pattern matching

   Parameter expansion also includes some pattern matching capabilities
   with the same wild card capabilities as used in filename expansion or
   globbing. Note that this is not regular expression matching as used by
   grep.

   CAPTION: Table 2. Shell expansion pattern matching

   Expansion Purpose
   ${PARAMETER#WORD} The shell expands WORD as in filename expansion and
   removes the shortest matching pattern, if any, from the beginning of
   the expanded value of PARAMETER. Using '@' or '$' results in the
   pattern removal for each parameter in the list.
   ${PARAMETER##WORD} Results in removal of the longest matching pattern
   from the beginning rather than the shortest.
   ${PARAMETER%WORD} The shell expands WORD as in filename expansion and
   removes the shortest matching pattern, if any, from the end of the
   expanded value of PARAMETER. Using '@' or '$' results in the pattern
   removal for each parameter in the list.
   ${PARAMETER%%WORD} Results in removal of the longest matching pattern
   from the end rather than the shortest.
   ${PARAMETER/PATTERN/STRING} The shell expands PATTERN as in filename
   expansion and replaces the longest matching pattern, if any, in the
   expanded value of PARAMETER. To match patterns at the beginning of the
   expanded value of PARAMETER, prefix PATTERN with # or prefix it with %
   if the match should be done at the end. If STRING is empty, the
   trailing / may be omitted and the matches are deleted. Using '@' or '$'
   results in the pattern substitution for each parameter in the list.
   ${PARAMETER//PATTERN/STRING} Performs the substitution for all matches
   instead of just the first.

   Listing 11 shows some basic usage of the pattern matching expansions.

Listing 11. Pattern matching examples

[ian@pinguino ~]$ x="a1 b1 c2 d2"
[ian@pinguino ~]$ echo ${x#*1}
b1 c2 d2
[ian@pinguino ~]$ echo ${x##*1}
c2 d2
[ian@pinguino ~]$ echo ${x%1*}
a1 b
[ian@pinguino ~]$ echo ${x%%1*}
a
[ian@pinguino ~]$ echo ${x/1/3}
a3 b1 c2 d2
[ian@pinguino ~]$ echo ${x//1/3}
a3 b3 c2 d2
[ian@pinguino ~]$ echo ${x//?1/z3}
z3 z3 c2 d2
     __________________________________________________________________

   [39]Back to top

Putting it together

   Before we cover a few remaining points, let's look at a real world
   example of parameter handling. I build the developerWorks author
   package (see [40]Resources on a Linux system using a bash script. We
   store the various files I need in subdirectories of a library we'll
   call developerworks/library. The most recent release was version 5.7,
   so the schema files are found in developerworks/library/schema/5.7, the
   XSL files are found in developerworks/library/xsl/5.7, and the sample
   templates are in developerworks/library/schema/5.7/templates. Clearly,
   a single parameter providing the version, 5.7 in this case, would be
   sufficient for the script to build paths to all these files. So the
   script takes a -v parameter which must have a value. Validation of this
   parameter is performed later by constructing the path and then checking
   that it exists using [ -d "$pathname" ]

   This works fine for production builds, but during development, the
   files are stored in different directories:
     * developerworks/library/schema/5.8/archive/test-5.8/merge-0430
     * developerworks/library/xsl/5.8/archive/test-5.8/merge-0430 and
     * developerworks/library/schema/5.8/archive/test-5.8/merge-0430/templ
       ates-0430

   where the version is now 5.8, and the 0430 represents month and day of
   the latest test version.

   To handle this, I added a parameter, -p, which contains the
   supplemental piece of path information—archive/test-5.8/merge-0430. Now
   I, or someone else might forget the leading or trailing slash and some
   Windows user might use back slashes instead of regular slashes, so I
   decided to just handle that in the script. Also, you'll notice that the
   path to the template directory contains the date twice, so I needed to
   somehow pick off the date, -0430 in this run.

   Listing 12 shows the code I used to handle the two parameters and
   cleanse the partial path according to these requirements. The value of
   the -v option is stored in the ssversion variable while the cleansed
   version of the -p variable is stored in pathsuffix and the date,
   complete with leading hyphen is stored in datesuffix. The comments
   explain what is happening at each step. You'll recognize several
   parameter expansions, including length, substring, pattern matching,
   and pattern replacement in even this short piece of script.

Listing 12. Analyzing parameters for the developerWorks author package build

while getopts ":v:p:" optval "$@"
  do
    case $optval in
      "v")
        ssversion="$OPTARG"
      ;;
      "p")
        # Convert any backslashes to forward slashes
        pathsuffix="${OPTARG//\\//}"
        # Ensure this is a leading / and no trailing one
        [ ${pathsuffix:0:1} != "/" ] && pathsuffix="/$pathsuffix"
        pathsuffix=${pathsuffix%/}
        # Strip off the last hyphen and what follows
        dateprefix=${pathsuffix%-*}
        # Use the length of what remains to get the hyphen and what follows
        [ "$dateprefix" != "$pathsuffix" ] && datesuffix="${pathsuffix:${#datepr
efix}}"
        ;;
      *)
        errormsg="Unknown parameter or option error with option - $OPTARG"
        ;;
    esac
  done

   As with most things in Linux, and perhaps programming in general, this
   is not the only solution for this problem, but it does illustrate a
   more practical use of the expansions you have learned about.
     __________________________________________________________________

   [41]Back to top

Default values

   In the last section you saw how to assign option values to variables
   such as ssversion or pathsuffix. In this case, an empty version will be
   detected later and an empty path suffix is what happens for production
   builds, so that's acceptable. What if you need to assign default values
   for parameters that aren't specified? The shell expansions shown in
   Table 3 will help you with this task.

   CAPTION: Table 3. Shell expansion related to default values

   Expansion Purpose
   ${PARAMETER:-WORD} If PARAMETER is unset or null, the shell expands
   WORD and substitutes the result. The value of PARAMETER is not changed.
   `${PARAMETER:=WORD} If PARAMETER is unset or null, the shell expands
   WORD and assigns the result to PARAMETER. This value is then
   substituted. You cannot assign values to positional parameters or
   special parameters this way.
   ${PARAMETER:?WORD} If PARAMETER is unset or null, the shell expands
   WORD and writes the result to standard error. If WORD is not present a
   message is written instead. If the shell is not interactive, it exits.
   ${PARAMETER:+WORD} If PARAMETER is unset or null, nothing is
   substituted. Otherwise the shell expands WORD and substitutes the
   result.

   Listing 13 illustrates these expansions and the differences between
   them.

Listing 13. Substituting for null or unset variables.

[ian@pinguino ~]$ unset x;y="abc def"; echo "/${x:-'XYZ'}/${y:-'XYZ'}/$x/$y/"
/'XYZ'/abc def//abc def/
[ian@pinguino ~]$ unset x;y="abc def"; echo "/${x:='XYZ'}/${y:='XYZ'}/$x/$y/"
/'XYZ'/abc def/'XYZ'/abc def/
[[ian@pinguino ~]$ ( unset x;y="abc def"; echo "/${x:?'XYZ'}/${y:?'XYZ'}/$x/$y/"
 )\
>  >so.txt 2>se.txt
[ian@pinguino ~]$ cat so.txt
[ian@pinguino ~]$ cat se.txt
-bash: x: XYZ
[[ian@pinguino ~]$ unset x;y="abc def"; echo "/${x:+'XYZ'}/${y:+'XYZ'}/$x/$y/"
//'XYZ'//abc def/
     __________________________________________________________________

   [42]Back to top

Passing parameters

   There are some subtleties to parameter passing that can trip you if you
   are not careful. You already know about the importance of quoting and
   how quoting affects use of $* and $@, but consider the following case.
   Suppose you want a script or function that operates on all files or
   perhaps directories in the current working directory. For this
   illustration, consider the ll-1.sh and ll-2.sh scripts shown in Listing
   14.

Listing 14. Two simple scripts

#!/bin/bash
# ll-1.sh
for f in "$@"
  do
    ll-2.sh "$f"
  done

#!/bin/bash
ls -l "$@"

   The script ll-1.sh simply passes each of its parameters in turn to the
   script ll-2.sh and ll-2.sh does a long directory listing of the passed
   parameter. My test directory contains a pair of empty files, "file1"
   and "file 2". Listing 15 shows the output of the scripts.

Listing 15. Running the scripts - 1

[ian@pinguino test]$ ll-1.sh *
-rw-rw-r-- 1 ian ian 0 May 16 15:15 file1
-rw-rw-r-- 1 ian ian 0 May 16 15:15 file 2

   So far, so good. But if you forget to use the * parameter, the script
   doesn't do anything. It doesn't automatically work on the contents of
   the current working directory as, for example, the ls command does. A
   simple fix might be to add a check for this condition in ll-1.sh and
   use the output of the ls command to generate the input for ll-2.sh when
   nothing is provided to ll1-sh. A possible solution is shown in Listing
   16.

Listing 16. Revised version of ll-1.sh

#!/bin/bash
# ll-1.sh - revision 1
for f in "$@"
  do
    ll-2.sh "$f"
  done
[ $# -eq 0 ] && for f in "$(ls)"
  do
    ll-2.sh "$f"
  done

   Note that we carefully quoted the output of the ls command to make sure
   that we handled "file 2" correctly. Listing 17 shows the result of
   running the new ll-1.sh with the * and without.

Listing 17. Running the scripts - 2

[ian@pinguino test]$ ll-1.sh *
-rw-rw-r-- 1 ian ian 0 May 16 15:15 file1
-rw-rw-r-- 1 ian ian 0 May 16 15:15 file 2
[ian@pinguino test]$ ll-1.sh
ls: file1
file 2: No such file or directory

   Are you surprised? When you are passing parameters, particularly if
   they are the result of command output, things can be tricky. The clue
   here is in the error message which shows that the filenames are
   separated by newline characters. There are many ways of handling this
   problem, but one simple way is to use the read builtin as shown in
   Listing 18. Try it for yourself.

Listing 17. Running the scripts - 2

#!/bin/bash
# ll-1.sh - revision 2
for f in "$@"
  do
    ll-2.sh "$f"
  done
[ $# -eq 0 ] && ls | while read f
  do
    ll-2.sh "$f"
  done

   The moral of the story is that attention to detail and testing with odd
   inputs will make your scripts more reliable. Good luck!
     __________________________________________________________________

   [43]Back to top

Learn more

   If you'd like to know more about bash scripting in Linux, read the
   tutorial "[44]LPI exam 102 prep: Shells, scripting, programming, and
   compiling," from which part of this article was excerpted. To learn
   about other commands that you can use to analyze text such as parameter
   values, see the tutorial "[45]LPI exam 101 prep: GNU and UNIX
   commands," You'll find other [46]Resources below. Finally, don't forget
   to [47]rate this page.

Resources

Learn

     * Review the tutorial "[48]LPI exam 102 prep: Shells, scripting,
       programming, and compiling" (developerWorks, Jan 2007) for more
       information on bash shell customization and scripting in Linux. It
       is part of a larger [49]LPI exam prep tutorial series covering
       Linux fundamentals and preparing you for system administrator
       certification.
     * Read these developerWorks articles for other ways to work with
       bash:
          + [50]Bash by example, Part 1: Fundamental programming in the
            Bourne again shell (bash)
          + [51]Bash by example, Part 2: More bash programming
            fundamentals
          + [52]Bash by example, Part 3: Exploring the ebuild system
          + [53]System Administration Toolkit: Get the most out of bash
          + [54]Working in the bash shell
     * "[55]Shell Command Language" defines the shell command language as
       specified by The Open Group and IEEE.
     * In the [56]developerWorks Linux zone, find more resources for Linux
       developers, including [57]our readers' favorite Linux articles and
       tutorials over the last month.
     * Stay current with [58]developerWorks technical events and Webcasts.

Get products and technologies

     * With [59]IBM trial software, available for download directly from
       developerWorks, build your next development project on Linux.

Discuss

     * [60]Participate in the discussion forum.
     * Get involved in the [61]developerWorks community through our
       developer blogs, forums, podcasts, and community topics in our new
       [62]developerWorks spaces.

Comments

   [63]Close [x]

developerWorks: Sign in

   Required fields are indicated with an asterisk (*).

   IBM ID:* _________________________
   [64]Need an IBM ID?
   [65]Forgot your IBM ID?

   Password:* _________________________
   [66]Forgot your password?
   [67]Change your password

   [ ] Keep me signed in.

   By clicking Submit, you agree to the [68]developerWorks terms of use.

   Submit  [BUTTON Input] (not implemented)______
     __________________________________________________________________

   The first time you sign into developerWorks, a profile is created for
   you. Information in your profile (your name, country/region, and
   company name) is displayed to the public and will accompany any content
   you post, unless you opt to hide your company name. You may update your
   IBM account at any time.

   All information submitted is secure.

   [69]Close [x]

Choose your display name

   The first time you sign in to developerWorks, a profile is created for
   you, so you need to choose a display name. Your display name
   accompanies the content you post on developerWorks.

   Please choose a display name between 3-31 characters. Your display name
   must be unique in the developerWorks community and should not be your
   email address for privacy reasons.

   Required fields are indicated with an asterisk (*).

   Display name:* _________________________(Must be between 3 – 31
   characters.)

   By clicking Submit, you agree to the [70]developerWorks terms of use.

   Submit  [BUTTON Input] (not implemented)______
     __________________________________________________________________

   All information submitted is secure.

Dig deeper into Linux on developerWorks

     * [71]Overview
     * [72]New to Linux
     * [73]Technical library (tutorials and more)
     * [74]Forums
     * [75]Open source projects
     * [76]Events
     __________________________________________________________________

     * [77]developerWorks Premium
       Exclusive tools to build your next great app. Learn more.
     * [78]developerWorks Labs
       Technical resources for innovators and early adopters to experiment
       with.
     * [79]IBM evaluation software
       Evaluate IBM software and solutions, and transform challenges into
       opportunities.
     __________________________________________________________________

   [80]Back to top
   static.content.url=http://www.ibm.com/developerworks/js/artrating/
   SITE_ID=1
   Zone=Linux, AIX and UNIX, Open source
   ArticleID=223611
   ArticleTitle=Linux tip: Bash parameters and parameter expansions
   publish-date=05162007
     * [81]About
     * [82]Help
     * [83]Contact us
     * [84]Submit content

     * [85]Feeds
     * [86]Newsletters
     * [87]Follow
     * [88]Like

     * [89]Report abuse
     * [90]Terms of use
     * [91]Third party notice
     * [92]IBM privacy
     * [93]IBM accessibility

     * [94]Faculty
     * [95]Students
     * [96]Business Partners

     * Select a language:
     * [97]English
     * [98]中文
     * [99]日本語
     * [100]Русский
     * [101]Português (Brasil)
     * [102]Español
     * [103]Việt

   IBM®

Références

   Liens visibles
   1. file://www.ibm.com/marketplace/cloud/developer-program/us/en-us
   2. http://www.ibm.com/developerworks/
   3. file:///tmp/lynxXXXXA3BQZr/L19383-9998TMP.html
   4. file:///tmp/lynxXXXXA3BQZr/L19383-9998TMP.html
   5. https://developer.ibm.com/premium/
   6. file:///developerworks/community/profiles/html/myProfileView.do?lang=en
   7. file:///developerworks/community/groups/service/html/mycommunities?lang=en
   8. file:///developerworks/community/news/?lang=en
   9. file:///tmp/lynxXXXXA3BQZr/L19383-9998TMP.html
  10. http://www.ibm.com/
  11. http://www.ibm.com/developerworks/
  12. http://www.ibm.com/developerworks/topics/
  13. http://www.ibm.com/developerworks/downloads/
  14. http://www.ibm.com/developerworks/community/index.html
  15. http://www.ibm.com/developerworks/events/
  16. http://www.ibm.com/developerworks/
  17. http://www.ibm.com/developerworks/topics/
  18. http://www.ibm.com/developerworks/linux/
  19. http://www.ibm.com/developerworks/linux/library/
  20. http://www.ibm.com/developerworks/views/linux/libraryview.jsp?topic_by=All+topics+and+related+products&sort_order=asc&lcl_sort_order=asc&search_by=linux+tip:&search_flag=true&type_by=Articles&show_abstract=true&start_no=1&sort_by=Title&end_no=100&show_all=false
  21. file:///tmp/lynxXXXXA3BQZr/L19383-9998TMP.html#authorN10026
  22. file:///tmp/lynxXXXXA3BQZr/L19383-9998TMP.html#close
  23. mailto:ishields@us.ibm.com
  24. http://www.ibm.com/developerworks/ru/library/l-bash-parameters/
  25. file:///tmp/lynxXXXXA3BQZr/L19383-9998TMP.html#toggle
  26. file:///tmp/lynxXXXXA3BQZr/L19383-9998TMP.html#N10058
  27. file:///tmp/lynxXXXXA3BQZr/L19383-9998TMP.html#N100C1
  28. file:///tmp/lynxXXXXA3BQZr/L19383-9998TMP.html#N10124
  29. file:///tmp/lynxXXXXA3BQZr/L19383-9998TMP.html#N101E0
  30. file:///tmp/lynxXXXXA3BQZr/L19383-9998TMP.html#N1020F
  31. file:///tmp/lynxXXXXA3BQZr/L19383-9998TMP.html#N10246
  32. file:///tmp/lynxXXXXA3BQZr/L19383-9998TMP.html#N10289
  33. file:///tmp/lynxXXXXA3BQZr/L19383-9998TMP.html#resources
  34. file:///tmp/lynxXXXXA3BQZr/L19383-9998TMP.html#icomments
  35. http://www.ibm.com/developerworks/linux/library/l-bash-test.html
  36. http://www.ibm.com/developerworks/linux/edu/l-dw-linux-lpic1109-i.html?S_TACT=105AGX03&S_CMP=art2tut
  37. file:///tmp/lynxXXXXA3BQZr/L19383-9998TMP.html#ibm-content
  38. file:///tmp/lynxXXXXA3BQZr/L19383-9998TMP.html#ibm-content
  39. file:///tmp/lynxXXXXA3BQZr/L19383-9998TMP.html#ibm-content
  40. file:///tmp/lynxXXXXA3BQZr/L19383-9998TMP.html#resources
  41. file:///tmp/lynxXXXXA3BQZr/L19383-9998TMP.html#ibm-content
  42. file:///tmp/lynxXXXXA3BQZr/L19383-9998TMP.html#ibm-content
  43. file:///tmp/lynxXXXXA3BQZr/L19383-9998TMP.html#ibm-content
  44. http://www.ibm.com/developerworks/linux/edu/l-dw-linux-lpic1109-i.html?S_TACT=105AGX03&S_CMP=art2tut
  45. http://www.ibm.com/developerworks/linux/edu/l-dw-linux-lpic1103-i.html?S_TACT=105AGX03&S_CMP=art2tut
  46. file:///tmp/lynxXXXXA3BQZr/L19383-9998TMP.html#resources
  47. file:///tmp/lynxXXXXA3BQZr/L19383-9998TMP.html#icomments
  48. http://www.ibm.com/developerworks/linux/edu/l-dw-linux-lpic1109-i.html?S_TACT=105AGX03&S_CMP=art2tut
  49. http://www.ibm.com/developerworks/linux/lpi/index.html?S_TACT=105AGX03&S_CMP=art2tut
  50. http://www.ibm.com/developerworks/linux/library/l-bash.html
  51. http://www.ibm.com/developerworks/linux/library/l-bash2.html
  52. http://www.ibm.com/developerworks/linux/library/l-bash3.html
  53. http://www.ibm.com/developerworks/aix/library/au-satbash.html
  54. http://www.ibm.com/developerworks/edu/au-dw-au-bash-i.html
  55. http://www.opengroup.org/onlinepubs/009695399/utilities/xcu_chap02.html
  56. http://www.ibm.com/developerworks/linux/
  57. http://www.ibm.com/developerworks/linux/library/l-top-10.html
  58. http://www.ibm.com/developerworks/offers/techbriefings/?S_TACT=105AGX03&S_CMP=art
  59. http://www.ibm.com/developerworks/downloads/?S_TACT=105AGX03&S_CMP=art
  60. http://www.ibm.com/developerworks/forums/dw_forum.jsp?forum=160&cat=5
  61. http://www.ibm.com/developerworks/community
  62. http://www.ibm.com/developerworks/spaces/
  63. file:///tmp/lynxXXXXA3BQZr/L19383-9998TMP.html
  64. file:///tmp/lynxXXXXA3BQZr/L19383-9998TMP.html
  65. file:///developerworks/dwwi/jsp/WSHelp.jsp?lang=en_US
  66. file:///tmp/lynxXXXXA3BQZr/L19383-9998TMP.html
  67. file:///tmp/lynxXXXXA3BQZr/L19383-9998TMP.html
  68. https://www.ibm.com/developerworks/community/terms/
  69. file:///tmp/lynxXXXXA3BQZr/L19383-9998TMP.html
  70. https://www.ibm.com/developerworks/community/terms/
  71. http://www.ibm.com/developerworks/linux/
  72. http://www.ibm.com/developerworks/linux/newto/
  73. http://www.ibm.com/developerworks/linux/library/
  74. https://www.ibm.com/developerworks/community/forums/html/category?id=33333333-0000-0000-0000-000000000005
  75. http://www.ibm.com/developerworks/linux/find/projects/
  76. http://www.ibm.com/developerworks/linux/find/events/
  77. https://www.ibm.com/marketplace/cloud/developerworks/us/en-us/?cm_sp=dwpremium-_-classicarticle-_-tile
  78. http://www.ibm.com/developerworks/labs/?ca=dti-tiles-labs
  79. http://www.ibm.com/developerworks/downloads/?ca=dti-tiles-evaluate
  80. file:///tmp/lynxXXXXA3BQZr/L19383-9998TMP.html#ibm-content
  81. http://www.ibm.com/developerworks/aboutdw/
  82. https://www.ibm.com/developerworks/feedback
  83. http://www.ibm.com/developerworks/aboutdw/contacts.html
  84. https://www.ibm.com/developerworks/ideas
  85. http://www.ibm.com/developerworks/feeds/
  86. http://www.ibm.com/developerworks/newsletter/
  87. http://twitter.com/developerWorks
  88. http://www.facebook.com/developerworks
  89. https://www.ibm.com/developerworks/community/report/
  90. https://www.ibm.com/developerworks/community/terms/use/
  91. https://www.ibm.com/developerworks/community/terms/thirdparty/
  92. http://www.ibm.com/privacy/
  93. http://www.ibm.com/accessibility/
  94. http://www.ibm.com/ibm/university/academic/pub/page/academic_initiative
  95. http://asmarterplanet.com/studentsfor/
  96. http://www.ibm.com/isv/
  97. http://www.ibm.com/developerworks/
  98. http://www.ibm.com/developerworks/cn/
  99. http://www.ibm.com/developerworks/jp/
 100. http://www.ibm.com/developerworks/ru/
 101. http://www.ibm.com/developerworks/br/
 102. http://www.ibm.com/developerworks/ssa/
 103. http://www.ibm.com/developerworks/vn/

   Liens cachés :
 105. file://localhost/tmp/lynxXXXXA3BQZr/L19383-9998TMP.html
