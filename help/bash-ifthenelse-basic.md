---- BASH Conditionnal statements CheatSheet ----
=====================================



Syntax
------

### original
  ```
  if [ $1 -gt 100 ]
  then
    echo "Hey that's a large number."
    pwd
  else
    echo "No more ?"
  fi
  ```
### popular idiom

  ```
  if [ $1 -gt 100 ]; then
    echo Hey that's a large number.
    pwd
  fi
  ```

### onliner 

  ```
  if [ 1 = 001 ]; then echo true ; else ; echo false; fi
  ```
- compact onliner 

  ```
  [ -f unixfile ] && rm unixfile || print "unixfile was not found, or is not a regular file"
  ```


Test
----

The square brackets ( [ ] ) in the **if** statement above are actually a reference to the command **test**.
Look up the man page for test to see all of the possible operators.

Operator              | Description
---                   | ---
! EXPRESSION          | The EXPRESSION is false.
-n STRING             | The length of STRING is greater than zero.
-z STRING             | The lengh of STRING is zero (ie it is empty).
STRING1 = STRING2     | STRING1 is equal to STRING2
STRING1 != STRING2    | STRING1 is not equal to STRING2
INTEGER1 -eq INTEGER2 | INTEGER1 is numerically equal to INTEGER2
INTEGER1 -gt INTEGER2 | INTEGER1 is numerically greater than INTEGER2
INTEGER1 -lt INTEGER2 | INTEGER1 is numerically less than INTEGER2
-d FILE               | FILE exists and is a directory.
-e FILE               | FILE exists.
-r FILE               | FILE exists and the read permission is granted.
-s FILE               | FILE exists and it's size is greater than zero (ie. it is not empty).
-w FILE               | FILE exists and the write permission is granted.
-x FILE               | FILE exists and the execute permission is granted.

**notes**
  + **=** is slightly different to **-eq**:
    - `[ 001 = 1 ]` is false (String comparison)
    - `[ 001 -eq 1 ]`-eq is true (numerical comparison)
  + We may experiment  on the command line :

  ```
  $ [ 001 = 1 ]  && echo true || echo false   # -> false
  $ [ 001 -eq 1 ] && echo true || echo false   # -> true
  $ touch myfile && [  -s myfile ] && echo true || echo false   # -> false
  $ ls /etc \> myfile && [  -s myfile ] && echo true || echo false   # -> true
  ```

Nested If statements
-----------------------------

### nested ifs

  ```
  if [ \$1 -gt 100 ]
  then
    echo Hey that's a large number.
    if (( \$1 % 2 == 0 ))
    then
      echo And is also an even number.
    fi
  fi
  ```


If Elif Else 
-------------

Sometimes we may have a series of conditions that may lead to different paths.


  ```
  if [ \$1 -ge 18 ]
  then
    echo You may go to the party.
  elif [ \$2 == 'yes' ]
  then
    echo You may go to the party but be back before midnight.
  else
    echo You may not go to the party.
  fi
  ```

Boolean Operations 
------------------

### and

  ```
  if [ -r \$1 ] && [ -s \$1 ]
  then
    echo This file is useful.
  fi
  ```

#### or

  ```
  if [ \$USER == 'bob' ] || [ \$USER == 'andy' ]
  then
    ls -alh
  else
    ls
  fi
  ```

Case Statements 
---------------

Sometimes we may wish to take different paths based upon a variable matching a series of patterns.
We could use a series of **if** and **elif** statements but that would soon grow to be unweildly.
Fortunately there is a **case** statement which can make things cleaner.
It's a little hard to explain so here are some examples to illustrate:

### Syntax
  ```
  case \$1 in
  start)
    echo starting
    ;;
  stop)
    echo stoping
    ;;
  restart)
    echo restarting
    ;;
  \*)
    echo don\\'t know
    ;;
  esac
  ```

### Example
 A disk usage script: a disk usage script

  ```
  #!/bin/bash
  # Print a message about disk useage.

  space_free=$( df -h | awk '{ print $5 }' | sort -n | tail -n 1 | sed 's/%//' )

  case $space_free in
    [1-5]*)
      echo Plenty of disk space available
      ;;
    [6-7]*)
      echo There could be a problem in the near future
      ;;
    8*)
      echo Maybe we should look at clearing out old files
      ;;
    9*)
      echo We could have a serious problem on our hands soon
      ;;
    *)
      echo Something is not quite right here
      ;;
 esac
 ```

