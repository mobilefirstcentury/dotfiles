###Find command


Typical use
-------------
find /path/to/search/ -type f -name "regular-expression-to-find-files" | xargs cp -t /target/path/

Basic find command examples
=================================================================
find / -name Chapter1 -type f					#find files by name in a directory 
find /usr /home -name Chapter1.txt -type f			#find files by name multiple directories
find . -name Chapter1 -type f					#find files by name in current directory 
find /usr -name "Chapter*" -type f				#find files by expression in a directory  
find . -type d -name build					#find directories by name in a directory 
find . -type f -not -name "*.html"				#find files not in expression
find . -type f -name "*.java" -exec grep StringBuffer {} \;	#find with grep 
find . -type f -name "*.java" -exec grep -i string {} \;	#find with grep ignore case
find /usr/local -name "*.html" -type f -exec chmod 644 {} \;    #find with change permissions
find . -name "*.pl" -exec ls -dal {} \;				#find with ls. "d" option is obligatory to have the same info printed for directories and files
find . -type f -name "Foo*" -exec rm {} \;			#find with remove
find . -type f \( -name "*.c" -o -name "*.sh" \)		#find with or condition
find . -iname foo -type f					#find with case insensitive name
find . -mtime -7  -type f					#find files by modifcation (7 last days)


Advanced find command examples
=================================================================
find / -type f -name *.jpg  -exec cp {} . \;
find /dir -type f -size 0 -print
find . -type f -size +10000 -exec ls -al {} \;
find /var/nmon -mtime +30 | xargs -i rm {}
find /var/nmon -mtime +1 -exec gzip -9 {} \;
find . -atime +1 -type f -exec mv {} TMP \; # mv files older then 1 day to dir TMP
find . -name "-F" -exec rm {} \;   # a script error created a file called -F 
find . -exec grep -i "vds admin" {} \;
find . \! -name "*.Z" -exec compress -f {} \;
find . -type f \! -name "*.Z" \! -name ".comment" -print | tee -a /tmp/list
find . -name *.ini
find . -exec chmod 775 {} \;
find . -user xuser1 -exec chown -R user2 {} \;
find . -user psoft  -exec rm -rf  {} \;
find . -name ebtcom*
find . -name mkbook
find . -exec grep PW0 {} \;
find . -exec grep -i "pw0" {} \;
find . -atime +6
find . -atime +6 -exec ll | more
find . -atime +6 -exec ll | more \;
find . -atime +6 -exec ll \;
find . -atime +6 -exec ls \;
find . -atime +30 -exec ls \;
find . -atime +30 -exec ls \; | wc -l
find . -name auth*
find . -exec grep -i plotme10 {};
find . -exec grep -i plotme10 {} \;
find . -ls -exec grep 'PLOT_FORMAT 22' {} \;
find . -print -exec grep 'PLOT_FORMAT 22' {} \;
find . -print -exec grep 'PLOT_FORMAT' {} \;
find . -print -exec grep 'PLOT_FORMAT' {} \;
find ./machbook -exec chown 184 {} \;
find . \! -name '*.Z' -exec compress {} \;
find . \! -name "*.Z" -exec compress -f {} \;
find /raid/03c/ecn -xdev -type f -print
find /raid/03c/ecn -xdev -path -type f -print
find / -name .ssh* -print | tee -a ssh-stuff
find . -name "*font*"
find . -name hpmcad*
find . -name *fnt*
find . -name hp_mcad* -print
find . -grep Pld {} \;
find . -exec grep Pld {} \;
find . -exec grep Pld {} \;
find . -exec grep PENWIDTH {} \; | more
find . -name config.pro
find . -name config.pro
find /raid -type d ".local_sd_customize" -print
find /raid -type d -name ".local_sd_customize" -print
find /raid -type d -name ".local_sd_customize" -ok cp /raid/04d/MCAD-apps/I_Custom/SD_custom/site_sd_customize/user_filer_project_dirs {} \;
find /raid -type d -name ".local_sd_customize" -exec cp /raid/04d/MCAD-apps/I_Custom/SD_custom/site_sd_customize/user_filer_project_dirs {} \;
find . -name xeroxrelease
find . -exec grep xeroxrelease {} \;
find . -name xeroxrelease
find . -name xeroxrelease* -print 2>/dev/null
find . -name "*release*" 2>/dev/null
find / -name "*xerox*" 2>/dev/null
find . -exec grep -i xeroxrelease {} \;
find . -print -exec grep -i xeroxrelease {} \;
find . -print -exec grep -i xeroxrelease {} \; > xeroxrel.lis
find . -exec grep -i xeroxrel {} \;
find . -print -exec grep -i xeroxrel {} \;
find . -print -exec grep -i xeroxrel {} \; | more
find /raid/03c/inwork -xdev -type f -print >> /raid/04d/user_scripts/prt_list.tmp
find . -exec grep '31.53' {} \;
find . -ls -exec grep "31/.53" {} \; > this.lis
find . -print -exec grep "31/.53" {} \; > this.lis
find . -print -exec grep 31.53 {} \; > this.lis
find . -exec grep -i pen {} /;
find . -exec grep -i pen {} \;
find . -print -exec grep -i pen {} \; | more
find . -exec grep -i pen {} \;
find . -atime +6 -exec ll | more \;
find . -atime +6 -exec ll \;
find . -atime +6 -exec ls \;
find . -atime +30 -exec ls \;
find . -atime +30 -exec ls \; | wc -l
find . \! -name '*.Z' -exec compress -f {} \;
find . -name 'cache*' -depth -exec rm {} \;
find . -name 'cache*' -depth -print | tee -a /tmp/cachefiles
find . -name 'cache[0-9][0-9]*' -depth -print | tee -a /tmp/cachefiles
find . -name 'hp_catfile' 'hp_catlock' -depth -print | tee -a /tmp/hp.cats
find . -name 'hp_catfile' -name 'hp_catlock' -depth -print | tee -a /tmp/hp.cats
find . -name 'hp_cat*' -depth -print | tee -a /tmp/hp.cats
find . -name 'hp_cat[fl]*' -depth -print | tee -a /tmp/hp.cats
find /raid -name 'hp_cat[fl]*' -depth -print
find . \! -name '*.Z' -exec compress -f {} \;
find . -name '*' -exec compress -f {} \;
find . -xdev -name "wshp1*" -print
find . -xdev -name "wagoneer*" -print
find . -name "xcmd" -depth -print
find /usr/contrib/src -name "xcmd" -depth -print
find /raid -type d -name ".local_sd_customize" -exec ls {} \; 
find /raid -type d -name ".local_sd_customize" \
   -exec cp /raid/04d/MCAD-apps/I_Custom/SD_custom/site_sd_customize/user_filer_project_dirs {} \;
find . -name "rc.conf" -print 
find . -name "rc.conf " -exec chmod o+r '{}' \; -print 
find . -not (\ -name "*.v" -o -name "*,v" \) '{}' \; -print



Creating an empty file in Linux is easy. If a-file does not exist, create the file and make it empty by simply:
$ touch a-file
$ ls -l a-file
-rw-r--r-- 1 peter peter 0 2009-05-02 20:15 a-file

Finding all empty files in a directory can also be done using a single command. Ditto for non-empty files.

Suppose you want to find all empty files in the directory /home/peter. The command is:
 $ find -L /home/peter -maxdepth 1  -type f -size 0

By default, the find command excludes symbolic files. Use the -L option to include them.

The expression -maxdepth 1 specifies that the maximum depth to which the search will drill is one only. By default, the find command will recursively go down the directory. A maximum depth of 1 means that you only want the files directly under /home/peter. Keep in mind that depth 0 is the level of the command line argument (/home/peter). You can use -maxdepth and -mindepth to finely control the depth levels you want included.

-type f means include regular files only. This is not strictly necessary for empty files (as opposed to non-empty ones) because all directories, even those with no files, are of non-empty size.

-size 0 is self-explanatory.

To find all non-empty files in the same directory, simply add ! before -size 0:
 $ find -L /home/peter -maxdepth 1  -type f ! -size 0

Note that -type f becomes necessary. Without this expression, subdirectories in /home/peter such as /home/peter/.Trash will appear in the output. 

Most of the time, you don't just want to find the files: you want to do something with them. Suppose you want to remove all empty files in the directory. For safety, first run the find command by itself to list the files. Then with the xargs command as below.
 $ find -L /home/peter -maxdepth 1  -type f  -size 0 
/home/peter/file1.txt
/home/peter/file2.txt
$ find -L /home/peter -maxdepth 1  -type f  -size 0 -print0 |xargs -0 -r rm -f 

$ find -L /home/peter -name *~ -print0 |xargs -0 -r rm # delete all files verifying a pattern

# while loop on find results.
$ find ~/music -name \*.wav | while read x; do lame -b 192 -h "$x" "`basename "$x" .wav`.mp3";done
