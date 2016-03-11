---- Date Cheatsheet ----
==========================

## syntax 
  $ date +FORMAT

## display date in mm-dd-yy format
  $ date +"%m-%d-%y" # Output: 02-27-07     

## turn on 4 digit year display:
  $ date +"%m-%d-%Y" 
  
## just display date as mm/dd/yy format
  $ date +"%D"

## display time only
  $ date +"%T" # Output: 19:55:04

## display locale’s 12-hour clock time
  $ date +"%r" # Output: 07:56:05 PM

## display time in HH:MM format:
  $ date +"%H-%M" 

## save time/date format to a variable
  $ NOW=$(date +"%m-%d-%Y")

## display a variable use echo / printf command
  $ echo $NOW

## use of date in script
  `
    #!/bin/bash
    NOW=$(date +"%m-%d-%Y")
    FILE="backup.$NOW.tar.gz"
  `

## date calculation
  $ date -d -30days
  $ date -d +30days
  $ date -d +2months
  $ date -d +2months17days
  $ date -d tomorrow+10days
  $ date -d tomorrow+10days
  $ date -d yesterday-10days
  $ date -d '2010-01-21 + 2 weeks 3 days'
  $ date -d 'next tuesday + 1 day'
  $ date -d 'last tuesday + 1 day'


## list of FORMAT control characters supported by date command
%% | a literal %
%a | locale's abbreviated weekday name (e.g., Sun)
%A | locale's full weekday name (e.g., Sunday)
%b | locale's abbreviated month name (e.g., Jan)
%B | locale's full month name (e.g., January)
%c | locale's date and time (e.g., Thu Mar 3 23:05:25 2005)
%C | century; like %Y, except omit last two digits (e.g., 21)
%d | day of month (e.g, 01)
%D | date; same as %m/%d/%y
%e | day of month, space padded; same as %_d
%F | full date; same as %Y-%m-%d
%g | last two digits of year of ISO week number (see %G)
%G | year of ISO week number (see %V); normally useful only with %V
%h | same as %b
%H | hour (00..23)
%I | hour (01..12)
%j | day of year (001..366)
%k | hour ( 0..23)
%l | hour ( 1..12)
%m | month (01..12)
%M | minute (00..59)
%n | a newline
%N | nanoseconds (000000000..999999999)
%p | locale's equivalent of either AM or PM; blank if not known
%P | like %p, but lower case
%r | locale's 12-hour clock time (e.g., 11:11:04 PM)
%R | 24-hour hour and minute; same as %H:%M
%s | seconds since 1970-01-01 00:00:00 UTC
%S | second (00..60)
%t | a tab
%T | time; same as %H:%M:%S
%u | day of week (1..7); 1 is Monday
%U | week number of year, with Sunday as first day of week (00..53)
%V | ISO week number, with Monday as first day of week (01..53)
%w | day of week (0..6); 0 is Sunday
%W | week number of year, with Monday as first day of week (00..53)
%x | locale's date representation (e.g., 12/31/99)
%X | locale's time representation (e.g., 23:13:48)
%y | last two digits of year (00..99)
%Y | year
%z | +hhmm numeric timezone (e.g., -0400)
%:z | +hh:mm numeric timezone (e.g., -04:00)
%::z | +hh:mm:ss numeric time zone (e.g., -04:00:00)
%:::z | numeric time zone with : to necessary precision (e.g., -04, +05:30)
%Z | ??


