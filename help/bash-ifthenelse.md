---- Conditionnal Statement in Bash ----
========================================

Syntax
------
  # original syntax
  `
    if conditional-boolean
    then
      command
      command
    else
      command
      command
    fi
  `
  
  # favorite idiom
 `
    if conditional-booleani; then
      command
      command
    else
      command
      command
    fi
  `     

Bash test and comparison functions: test, [, [[, ((, and if-then-else
-------------------------------------------------------------------------------

### Tests

   In any programming language, after you learn how to assign values to
   variables and pass parameters, you need to test those values and
   parameters. In shells, the tests set the return status, which is the
   same thing that other commands do. In fact, test is a builtin command!

test and [

   The test builtin command returns 0 (True) or 1 (False), depending on
   the evaluation of an expression, expr. You can also use square
   brackets: test expr and [ expr ] are equivalent. You can examine the
   return value by displaying $?; you can use the return value with && and
   ||; or you can test it using the various conditional constructs that
   are covered later in this tip.

Listing 1. Some simple tests

[ian@pinguino ~]$ test 3 -gt 4 && echo True || echo false
false
[ian@pinguino ~]$ [ "abc" != "def" ];echo $?
0
[ian@pinguino ~]$ test -d "$HOME" ;echo $?
0

   In the first example in Listing 1, the -gt operator performs an
   arithmetic comparison between two literal values. In the second
   example, the alternate [ ] form compares two strings for inequality. In
   the final example, the value of the HOME variable is tested to see if
   it is a directory using the -d unary operator.

   You can compare arithmetic values using one of -eq, -ne, -lt, -le, -gt,
   or -ge, meaning equal, not equal, less than, less than or equal,
   greater than, and greater than or equal, respectively.

   You can compare strings for equality, inequality, or whether the first
   string sorts before or after the second one using the operators =, !=,
   <, and >, respectively. The unary operator -z tests for a null string,
   while -n or no operator at all returns True if a string is not empty.

   Note: the < and > operators are also used by the shell for redirection,
   so you must escape them using \< or \>. Listing 2 shows more examples
   of string tests. Check that they are as you expect.

Listing 2. Some string tests

[ian@pinguino ~]$ test "abc" = "def" ;echo $?
1
[ian@pinguino ~]$ [ "abc" != "def" ];echo $?
0
[ian@pinguino ~]$ [ "abc" \< "def" ];echo $?
0
[ian@pinguino ~]$ [ "abc" \> "def" ];echo $?
1
[ian@pinguino ~]$ [ "abc" \<"abc" ];echo $?
1
[ian@pinguino ~]$ [ "abc" \> "abc" ];echo $?
1

   Some of the more common file tests are shown in Table 1. The result is
   True if the file tested is a file that exists and that has the
   specified characteristic.

   CAPTION: Table 1. Some common file tests

   Operator             Characteristic
   -d       Directory
   -e       Exists (also -a)
   -f       Regular file
   -h       Symbolic link (also -L)
   -p       Named pipe
   -r       Readable by you
   -s       Not empty
   -S       Socket
   -w       Writable by you
   -N       Has been modified since last being read

   In addition to the unary tests above, you can compare two files with
   the binary operators shown in Table 2.

   CAPTION: Table 2. Testing pairs of files

   Operator                             True if
   -nt      Test if file1 is newer than file 2. The modification date is used
            for this and the next comparison.
   -ot      Test if file1 is older than file 2.
   -ef      Test if file1 is a hard link to file2.

   Several other tests allow you to check things such as the permissions
   of the file. See the man pages for bash for more details or use
   help test to see brief information on the test builtin. You can use the
   help command for other builtins too.

   The -o operator allows you to test various shell options that may be
   set using set -o option, returning True (0) if the option is set and
   False (1) otherwise, as shown in Listing 3.

Listing 3. Testing shell options

[ian@pinguino ~]$ set +o nounset
[ian@pinguino ~]$ [ -o nounset ];echo $?
1
[ian@pinguino ~]$ set -u
[ian@pinguino ~]$ test  -o nounset; echo $?
0

   Finally, the -a and -o options allow you to combine expressions with
   logical AND and OR, respectively, while the unary ! operator inverts
   the sense of the test. You may use parentheses to group expressions and
   override the default precedence. Remember that the shell will normally
   run an expression between parentheses in a subshell, so you will need
   to escape the parentheses using \( and \) or enclosing these operators
   in single or double quotes. Listing 4 illustrates the application of de
   Morgan's laws to an expression.

Listing 4. Combining and grouping tests

[ian@pinguino ~]$ test "a" != "$HOME" -a 3 -ge 4 ; echo $?
1
[ian@pinguino ~]$ [ ! \( "a" = "$HOME" -o 3 -lt 4 \) ]; echo $?
1
[ian@pinguino ~]$ [ ! \( "a" = "$HOME" -o '(' 3 -lt 4 ')' ")" ]; echo $?
1
     __________________________________________________________________

   [35]Back to top

(( and [[

   The test command is very powerful, but somewhat unwieldy given its
   requirement for escaping and given the difference between string and
   arithmetic comparisons. Fortunately, bash has two other ways of testing
   that are somewhat more natural for people who are familiar with C, C++,
   or Java® syntax.

   The (( ))compound command evaluates an arithmetic expression and sets
   the exit status to 1 if the expression evaluates to 0, or to 0 if the
   expression evaluates to a non-zero value. You do not need to escape
   operators between (( and )). Arithmetic is done on integers. Division
   by 0 causes an error, but overflow does not. You may perform the usual
   C language arithmetic, logical, and bitwise operations. The let command
   can also execute one or more arithmetic expressions. It is usually used
   to assign values to arithmetic variables.

Listing 5. Assigning and testing arithmetic expressions

[ian@pinguino ~]$ let x=2 y=2**3 z=y*3;echo $? $x $y $z
0 2 8 24
[ian@pinguino ~]$ (( w=(y/x) + ( (~ ++x) & 0x0f ) )); echo $? $x $y $w
0 3 8 16
[ian@pinguino ~]$ (( w=(y/x) + ( (~ ++x) & 0x0f ) )); echo $? $x $y $w
0 4 8 13

   As with (( )), the [[ ]] compound command allows you to use more
   natural syntax for filename and string tests. You can combine tests
   that are allowed for the test command using parentheses and logical
   operators.

Listing 6. Using the [[ compound

[ian@pinguino ~]$ [[ ( -d "$HOME" ) && ( -w "$HOME" ) ]] &&
>  echo "home is a writable directory"
home is a writable directory

   The [[ compound can also do pattern matching on strings when the = or
   != operators are used. The match behaves as for wildcard globbing as
   illustrated in Listing 7.

Listing 7. Wildcard tests with [[

[ian@pinguino ~]$ [[ "abc def .d,x--" == a[abc]*\ ?d* ]]; echo $?
0
[ian@pinguino ~]$ [[ "abc def c" == a[abc]*\ ?d* ]]; echo $?
1
[ian@pinguino ~]$ [[ "abc def d,x" == a[abc]*\ ?d* ]]; echo $?
1

   You can even do arithmetic tests within [[ compounds, but be careful.
   Unless within a (( compound, the < and > operators will compare the
   operands as strings and test their order in the current collating
   sequence. Listing 8 illustrates this with some examples.

Listing 8. Including arithmetic tests with [[

[ian@pinguino ~]$ [[ "abc def d,x" == a[abc]*\ ?d* || (( 3 > 2 )) ]]; echo $?
0
[ian@pinguino ~]$ [[ "abc def d,x" == a[abc]*\ ?d* || 3 -gt 2 ]]; echo $?
0
[ian@pinguino ~]$ [[ "abc def d,x" == a[abc]*\ ?d* || 3 > 2 ]]; echo $?
0
[ian@pinguino ~]$ [[ "abc def d,x" == a[abc]*\ ?d* || a > 2 ]]; echo $?
0
[ian@pinguino ~]$ [[ "abc def d,x" == a[abc]*\ ?d* || a -gt 2 ]]; echo $?
-bash: a: unbound variable
     __________________________________________________________________

   [36]Back to top

Conditionals

   While you could accomplish a huge amount of programming with the above
   tests and the && and || control operators, bash includes the more
   familiar "if, then, else" and case constructs. After you learn about
   these, you will learn about looping constructs and your toolbox will
   really expand.

If, then, else statements

   The bash if command is a compound command that tests the return value
   of a test or command ($?) and branches based on whether it is True (0)
   or False (not 0). Although the tests above returned only 0 or 1 values,
   commands may return other values. Learn more about these in the [37]LPI
   exam 102 prep: Shells, scripting, programming, and compiling tutorial.

   The if command in bash has a then clause containing a list of commands
   to be executed if the test or command returns 0, one or more optional
   elif clauses, each with an additional test and then clause with an
   associated list of commands, an optional final else clause and list of
   commands to be executed if neither the original test, nor any of the
   tests used in the elif clauses was true, and a terminal fi to mark the
   end of the construct.

   Using what you have learned so far, you could now build a simple
   calculator to evaluate arithmetic expressions as shown in Listing 9.

Listing 9. Evaluating expressions with if, then, else

[ian@pinguino ~]$ function mycalc ()
> {
>   local x
>   if [ $# -lt 1 ]; then
>     echo "This function evaluates arithmetic for you if you give it some"
>   elif (( $* )); then
>     let x="$*"
>     echo "$* = $x"
>   else
>     echo "$* = 0 or is not an arithmetic expression"
>   fi
> }
[ian@pinguino ~]$ mycalc 3 + 4
3 + 4 = 7
[ian@pinguino ~]$ mycalc 3 + 4**3
3 + 4**3 = 67
[ian@pinguino ~]$ mycalc 3 + (4**3 /2)
-bash: syntax error near unexpected token `('
[ian@pinguino ~]$ mycalc 3 + "(4**3 /2)"
3 + (4**3 /2) = 35
[ian@pinguino ~]$ mycalc xyz
xyz = 0 or is not an arithmetic expression
[ian@pinguino ~]$ mycalc xyz + 3 + "(4**3 /2)" + abc
xyz + 3 + (4**3 /2) + abc = 35

   The calculator makes use of the local statement to declare x as a local
   variable that is available only within the scope of the mycalc
   function. The let function has several possible options, as does the
   declare function to which it is closely related. Check the man pages
   for bash, or use help let for more information.

   As you saw in Listing 9, you need to make sure that your expressions
   are properly escaped if they use shell metacharacters such as (, ), *,
   >, and <. Nevertheless, you have quite a handy little calculator for
   evaluating arithmetic as the shell does it.

   You may have noticed the else clause and the last two examples in
   Listing 9. As you can see, it is not an error to pass xyz to mycalc,
   but it evaluates to 0. This function is not smart enough to identify
   the character values in the final example of use and thus be able to
   warn the user. You could use a string pattern matching test such as
   [[ ! ("$*" == *[a-zA-Z]* ]]
   (or the appropriate form for your locale) to eliminate any expression
   containing alphabetic characters, but that would prevent using
   hexadecimal notation in your input, since you might use 0x0f to
   represent 15 using hexadecimal notation. In fact, the shell allows
   bases up to 64 (using base#value notation), so you could legitimately
   use any alphabetic character, plus _ and @ in your input. Octal and
   hexadecimal use the usual notation of a leading 0 for octal and leading
   0x or 0X for hexadecimal. Listing 10 shows some examples.

Listing 10. Calculating with different bases

[ian@pinguino ~]$ mycalc 015
015 = 13
[ian@pinguino ~]$ mycalc 0xff
0xff = 255
[ian@pinguino ~]$ mycalc 29#37
29#37 = 94
[ian@pinguino ~]$ mycalc 64#1az
64#1az = 4771
[ian@pinguino ~]$ mycalc 64#1azA
64#1azA = 305380
[ian@pinguino ~]$ mycalc 64#1azA_@
64#1azA_@ = 1250840574
[ian@pinguino ~]$ mycalc 64#1az*64**3 + 64#A_@
64#1az*64**3 + 64#A_@ = 1250840574

   Additional laundering of the input is beyond the scope of this tip, so
   use your calculator with care.

   The elif statement is very convenient. It helps you in writing scripts
   by allowing you to simplify the indenting. You may be surprised to see
   the output of the type command for the mycalc function as shown in
   Listing 11.

Listing 11. Type mycalc

[ian@pinguino ~]$ type mycalc
mycalc is a function
mycalc ()
{
    local x;
    if [ $# -lt 1 ]; then
        echo "This function evaluates arithmetic for you if you give it some";
    else
        if (( $* )); then
            let x="$*";
            echo "$* = $x";
        else
            echo "$* = 0 or is not an arithmetic expression";
        fi;
    fi
}

   Of course, you could just do shell arithmetic by using
   $(( expression )) with the echo command as shown in Listing 12. You
   wouldn't have learned anything about functions or tests that way, but
   do note that the shell does not interpret metacharacters, such as *, in
   their normal role when inside (( expression )) or [[ expression ]].

Listing 12. Direct calculation in the shell with echo and $(( ))

[ian@pinguino ~]$  echo $((3 + (4**3 /2)))
35
     __________________________________________________________________

   [38]Back to top

Learn more

   If you'd like to know more about Bash scripting in Linux, read the
   tutorial "[39]LPI exam 102 prep: Shells, scripting, programming, and
   compiling," from which this article was excerpted, or see the other
   [40]Resources below. Don't forget to [41]rate this page.

Resources

Learn

     * Review the tutorial "[42]LPI exam 102 prep: Shells, scripting,
       programming, and compiling" (developerWorks, Jan 2007) for more
       information on Bash shell customization and scripting in Linux. It
       is part of a larger [43]LPI exam prep tutorial series covering
       Linux fundamentals and preparing you for system administrator
       certification.
     * Read these developerWorks articles for other ways to work with
       Bash:
          + [44]Bash by example, Part 1: Fundamental programming in the
            Bourne again shell (bash)
          + [45]Bash by example, Part 2: More bash programming
            fundamentals
          + [46]Bash by example, Part 3: Exploring the ebuild system
          + [47]System Administration Toolkit: Get the most out of bash
          + [48]Working in the bash shell
     * "[49]Shell Command Language" defines the shell command language as
       specified by The Open Group and IEEE.
     * Find more [50]tutorials for Linux developers in the
       [51]developerWorks Linux zone.
     * Stay current with [52]developerWorks technical events and webcasts.

Get products and technologies

     * Download [53]IBM trial software directly from developerWorks.

Discuss

     * [54]Participate in the discussion forum.
     * Read [55]developerWorks blogs, and get involved in the
       developerWorks community.

Comments

   [56]Close [x]

developerWorks: Sign in

   Required fields are indicated with an asterisk (*).

   IBM ID:* _________________________
   [57]Need an IBM ID?
   [58]Forgot your IBM ID?

   Password:* _________________________
   [59]Forgot your password?
   [60]Change your password

   [ ] Keep me signed in.

   By clicking Submit, you agree to the [61]developerWorks terms of use.

   Submit  [BUTTON Input] (not implemented)______
     __________________________________________________________________

   The first time you sign into developerWorks, a profile is created for
   you. Information in your profile (your name, country/region, and
   company name) is displayed to the public and will accompany any content
   you post, unless you opt to hide your company name. You may update your
   IBM account at any time.

   All information submitted is secure.

   [62]Close [x]

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

   By clicking Submit, you agree to the [63]developerWorks terms of use.

   Submit  [BUTTON Input] (not implemented)______
     __________________________________________________________________

   All information submitted is secure.

Dig deeper into Linux on developerWorks

     * [64]Overview
     * [65]New to Linux
     * [66]Technical library (tutorials and more)
     * [67]Forums
     * [68]Open source projects
     * [69]Events
     __________________________________________________________________

     * [70]developerWorks Premium
       Exclusive tools to build your next great app. Learn more.
     * [71]developerWorks Labs
       Technical resources for innovators and early adopters to experiment
       with.
     * [72]IBM evaluation software
       Evaluate IBM software and solutions, and transform challenges into
       opportunities.
     __________________________________________________________________

   [73]Back to top
   static.content.url=http://www.ibm.com/developerworks/js/artrating/
   SITE_ID=1
   Zone=Linux, AIX and UNIX, Open source
   ArticleID=196938
   ArticleTitle=Linux tip: Bash test and comparison functions
   publish-date=02202007
     * [74]About
     * [75]Help
     * [76]Contact us
     * [77]Submit content

     * [78]Feeds
     * [79]Newsletters
     * [80]Follow
     * [81]Like

     * [82]Report abuse
     * [83]Terms of use
     * [84]Third party notice
     * [85]IBM privacy
     * [86]IBM accessibility

     * [87]Faculty
     * [88]Students
     * [89]Business Partners

     * Select a language:
     * [90]English
     * [91]中文
     * [92]日本語
     * [93]Русский
     * [94]Português (Brasil)
     * [95]Español
     * [96]Việt

   IBM®

Références

   Liens visibles
   1. file://www.ibm.com/marketplace/cloud/developer-program/us/en-us
   2. http://www.ibm.com/developerworks/
   3. file:///tmp/lynxXXXX155D67/L17098-8699TMP.html
   4. file:///tmp/lynxXXXX155D67/L17098-8699TMP.html
   5. https://developer.ibm.com/premium/
   6. file:///developerworks/community/profiles/html/myProfileView.do?lang=en
   7. file:///developerworks/community/groups/service/html/mycommunities?lang=en
   8. file:///developerworks/community/news/?lang=en
   9. file:///tmp/lynxXXXX155D67/L17098-8699TMP.html
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
  21. file:///tmp/lynxXXXX155D67/L17098-8699TMP.html#authorN10026
  22. file:///tmp/lynxXXXX155D67/L17098-8699TMP.html#close
  23. https://www.ibm.com/developerworks/mydeveloperworks/profiles/user/ishields
  24. http://www.ibm.com/developerworks/cn/linux/l-bash-test.html
  25. http://www.ibm.com/developerworks/ru/library/l-bash-test/
  26. http://www.ibm.com/developerworks/jp/linux/library/l-bash-test.html
  27. file:///tmp/lynxXXXX155D67/L17098-8699TMP.html#toggle
  28. file:///tmp/lynxXXXX155D67/L17098-8699TMP.html#N10069
  29. file:///tmp/lynxXXXX155D67/L17098-8699TMP.html#N1017D
  30. file:///tmp/lynxXXXX155D67/L17098-8699TMP.html#N101DE
  31. file:///tmp/lynxXXXX155D67/L17098-8699TMP.html#N10282
  32. file:///tmp/lynxXXXX155D67/L17098-8699TMP.html#resources
  33. file:///tmp/lynxXXXX155D67/L17098-8699TMP.html#icomments
  34. http://www.ibm.com/developerworks/linux/edu/l-dw-linux-lpic1109-i.html?S_TACT=105AGX03&S_CMP=art2tut
  35. file:///tmp/lynxXXXX155D67/L17098-8699TMP.html#ibm-content
  36. file:///tmp/lynxXXXX155D67/L17098-8699TMP.html#ibm-content
  37. http://www.ibm.com/developerworks/linux/edu/l-dw-linux-lpic1109-i.html?S_TACT=105AGX03&S_CMP=art2tut
  38. file:///tmp/lynxXXXX155D67/L17098-8699TMP.html#ibm-content
  39. http://www.ibm.com/developerworks/linux/edu/l-dw-linux-lpic1109-i.html?S_TACT=105AGX03&S_CMP=art2tut
  40. file:///tmp/lynxXXXX155D67/L17098-8699TMP.html#resources
  41. file:///tmp/lynxXXXX155D67/L17098-8699TMP.html#icomments
  42. http://www.ibm.com/developerworks/linux/edu/l-dw-linux-lpic1109-i.html?S_TACT=105AGX03&S_CMP=art2tut
  43. http://www.ibm.com/developerworks/linux/lpi/index.html?S_TACT=105AGX03&S_CMP=art2tut
  44. http://www.ibm.com/developerworks/linux/library/l-bash.html
  45. http://www.ibm.com/developerworks/linux/library/l-bash2.html
  46. http://www.ibm.com/developerworks/linux/library/l-bash3.html
  47. http://www.ibm.com/developerworks/aix/library/au-satbash.html
  48. http://www.ibm.com/developerworks/edu/au-dw-au-bash-i.html
  49. http://www.opengroup.org/onlinepubs/009695399/utilities/xcu_chap02.html
  50. http://www.ibm.com/developerworks/views/linux/libraryview.jsp?type_by=Tutorials&S_TACT=105AGX03&S_CMP=art
  51. http://www.ibm.com/developerworks/linux/
  52. http://www.ibm.com/developerworks/offers/techbriefings/?S_TACT=105AGX03&S_CMP=art
  53. http://www.ibm.com/developerworks/downloads/?S_TACT=105AGX03&S_CMP=art
  54. http://www.ibm.com/developerworks/forums/dw_forum.jsp?forum=160&cat=5
  55. http://www.ibm.com/developerworks/blogs/
  56. file:///tmp/lynxXXXX155D67/L17098-8699TMP.html
  57. file:///tmp/lynxXXXX155D67/L17098-8699TMP.html
  58. file:///developerworks/dwwi/jsp/WSHelp.jsp?lang=en_US
  59. file:///tmp/lynxXXXX155D67/L17098-8699TMP.html
  60. file:///tmp/lynxXXXX155D67/L17098-8699TMP.html
  61. https://www.ibm.com/developerworks/community/terms/
  62. file:///tmp/lynxXXXX155D67/L17098-8699TMP.html
  63. https://www.ibm.com/developerworks/community/terms/
  64. http://www.ibm.com/developerworks/linux/
  65. http://www.ibm.com/developerworks/linux/newto/
  66. http://www.ibm.com/developerworks/linux/library/
  67. https://www.ibm.com/developerworks/community/forums/html/category?id=33333333-0000-0000-0000-000000000005
  68. http://www.ibm.com/developerworks/linux/find/projects/
  69. http://www.ibm.com/developerworks/linux/find/events/
  70. https://www.ibm.com/marketplace/cloud/developerworks/us/en-us/?cm_sp=dwpremium-_-classicarticle-_-tile
  71. http://www.ibm.com/developerworks/labs/?ca=dti-tiles-labs
  72. http://www.ibm.com/developerworks/downloads/?ca=dti-tiles-evaluate
  73. file:///tmp/lynxXXXX155D67/L17098-8699TMP.html#ibm-content
  74. http://www.ibm.com/developerworks/aboutdw/
  75. https://www.ibm.com/developerworks/feedback
  76. http://www.ibm.com/developerworks/aboutdw/contacts.html
  77. https://www.ibm.com/developerworks/ideas
  78. http://www.ibm.com/developerworks/feeds/
  79. http://www.ibm.com/developerworks/newsletter/
  80. http://twitter.com/developerWorks
  81. http://www.facebook.com/developerworks
  82. https://www.ibm.com/developerworks/community/report/
  83. https://www.ibm.com/developerworks/community/terms/use/
  84. https://www.ibm.com/developerworks/community/terms/thirdparty/
  85. http://www.ibm.com/privacy/
  86. http://www.ibm.com/accessibility/
  87. http://www.ibm.com/ibm/university/academic/pub/page/academic_initiative
  88. http://asmarterplanet.com/studentsfor/
  89. http://www.ibm.com/isv/
  90. http://www.ibm.com/developerworks/
  91. http://www.ibm.com/developerworks/cn/
  92. http://www.ibm.com/developerworks/jp/
  93. http://www.ibm.com/developerworks/ru/
  94. http://www.ibm.com/developerworks/br/
  95. http://www.ibm.com/developerworks/ssa/
  96. http://www.ibm.com/developerworks/vn/

   Liens cachés :
  98. file://localhost/tmp/lynxXXXX155D67/L17098-8699TMP.html
