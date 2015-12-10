How to count number of files in a directory
Now that I am back from vacation, I had to take care of some chores, like uploading the pictures taken with my digital camera.

I stepped out during the long upload process (400+ pictures). When I returned, it was already done. To just make sure all pictures are now on the server, I wanted to count the number of files in the targetdir directory.

$ ls -1 targetdir | wc -l
454
The above command reads ls dash one piped to wc dash letter l.

Note that if you had used ls dash letter l instead, the count is one greater than the actual number of files. This is because ls dash letter l outputs an extra total line:

$ ls -1 targetdir 
total 529436
-rw-r--r-- 1 peter peter  1510976 Jul 13  2008 DSCN1001.jpg
....
The above method will count symbolic links as well as subdirectories in targetdir (but not recursively into subdirectories).

If you want to exclude subdirectories, you need a heavier duty tool than ls.

$ find targetdir -maxdepth 1 -type f | wc -l
-type f ensures that the find command only returns regular files for counting (no subdirectories).

By default, the find command traverses into subdirectories for searching. -maxdepth 1 prevents find from traversing into subdirectories. If you do want to count files in the subdirectories, just remove -maxdepth 1 from the command line.

Note that the find command does NOT classify a symbolic link as a regular file. Therefore, the above find -type f command does not return symbolic links. As a result, the final count excludes all symbolic links.

To include symbolic links, add the -follow option to find.

$ find targetdir -follow  -maxdepth 1 -type f | wc -l 
