Q. How do I format date to display on screen on for my scripts as per my requirements?

A. You need to use standard date command to format date or time for output or to use in a shell script.

Syntax to specify format
date +FORMAT
Task: Display date in mm-dd-yy format
Type the command as follows:
$ date +"%m-%d-%y"
Output:
02-27-07     
Turn on 4 digit year display:
$ date +"%m-%d-%Y"
Just display date as mm/dd/yy format:
$ date +"%D"
Task: Display time only
Type the command as follows:
$ date +"%T"
Output:
19:55:04
Display locale’s 12-hour clock time
$ date +"%r"
Output:
07:56:05 PM
Display time in HH:MM format:
$ date +"%H-%M"
How do I save time/date format to a variable?
Simply type command as follows at a shell prompt:
$ NOW=$(date +"%m-%d-%Y")
To display a variable use echo / printf command:
$ echo $NOW
Sample shell script:
#!/bin/bash
NOW=$(date +"%m-%d-%Y")
FILE="backup.$NOW.tar.gz"
# rest of script Complete list of FORMAT control characters supported by date command
FORMAT controls the output.It can be the combination of any one of the following:
%%
a literal %
%a
locale's abbreviated weekday name (e.g., Sun)
%A
locale's full weekday name (e.g., Sunday)
%b
locale's abbreviated month name (e.g., Jan)
%B
locale's full month name (e.g., January)
%c
locale's date and time (e.g., Thu Mar 3 23:05:25 2005)
%C
century; like %Y, except omit last two digits (e.g., 21)
%d
day of month (e.g, 01)
%D
date; same as %m/%d/%y
%e
day of month, space padded; same as %_d
%F
full date; same as %Y-%m-%d
%g
last two digits of year of ISO week number (see %G)
%G
year of ISO week number (see %V); normally useful only with %V
%h
same as %b
%H
hour (00..23)
%I
hour (01..12)
%j
day of year (001..366)
%k
hour ( 0..23)
%l
hour ( 1..12)
%m
month (01..12)
%M
minute (00..59)
%n
a newline
%N
nanoseconds (000000000..999999999)
%p
locale's equivalent of either AM or PM; blank if not known
%P
like %p, but lower case
%r
locale's 12-hour clock time (e.g., 11:11:04 PM)
%R
24-hour hour and minute; same as %H:%M
%s
seconds since 1970-01-01 00:00:00 UTC
%S
second (00..60)
%t
a tab
%T
time; same as %H:%M:%S
%u
day of week (1..7); 1 is Monday
%U
week number of year, with Sunday as first day of week (00..53)
%V
ISO week number, with Monday as first day of week (01..53)
%w
day of week (0..6); 0 is Sunday
%W
week number of year, with Monday as first day of week (00..53)
%x
locale's date representation (e.g., 12/31/99)
%X
locale's time representation (e.g., 23:13:48)
%y
last two digits of year (00..99)
%Y
year
%z
+hhmm numeric timezone (e.g., -0400)
%:z
+hh:mm numeric timezone (e.g., -04:00)
%::z
+hh:mm:ss numeric time zone (e.g., -04:00:00)
%:::z
numeric time zone with : to necessary precision (e.g., -04, +05:30)
%Z

Fun with Date Arithmetic
We all know that the date command tells you the current time. Occasionally, you use the same command to set the time. That however becomes rarer these days with the advent of the ntp service that automatically synchronizes your computer's time with a super accurate public time server of your choice.

Various implementations of the date command are in use today. This article discusses the date command of the GNU coreutils package.

By default, the date command tells you the time now. The date command also lets you do some basic date addition and subtraction. This is achieved by specifying the -d option which displays a time that you entered as a parameter rather than now.

How many times have you asked yourself what the calendar date is N days ago? Just the other day, I needed to find out the precise date of 30 days ago in order to locate the proper log file.

$ date
Sat Nov 14 17:54:51 PST 2009
$ date -d -30days
Thu Oct 15 18:54:56 PDT 2009


Just like you use subtraction to calculate a back date, you use addition to calculate a forward date. The example below displays the date 30 days from today.
$ date -d +30days
Thu Oct 15 18:54:56 PDT 2009


Besides days as the unit, you can also manipulate years, months, hours, minutes, and seconds.
peter@tiger:~$ date -d +2months
Thu Jan 14 18:48:43 PST 2010


You can combine them together like this:
$ date -d +2months17days
Sun Jan 31 18:49:45 PST 2010


Note that all the above are calculated relative to today's date. What about queries like 10 days tomorrow?
$ date -d tomorrow+10days
date -d tomorrow+10days
Wed Nov 25 18:52:03 PST 2009


10 days yesterday?
$ date -d yesterday-10days
Tue Nov  3 18:53:07 PST 2009


You can also perform your arithmetic relative to a specific day, say January 21, 2010.
$ date -d '2010-01-21 + 2 weeks 3 days'
Sun Feb  7 00:00:00 PST 2010


Lastly, the date command also recognizes the day of weeks (Sunday, Monday, ...) and the 2 keywords "last" and "next".
$ date -d 'next tuesday + 1 day'
Wed Nov 18 00:00:00 PST 2009


I hope you have fun with this versatile tool.
