Identify the Debian/Ubuntu package containing a command/filename
Consider this scenario: you read about this excellent Linux command that is new to you. You quickly try it out, and discover that the command is not found. Before you can install the command, you must first find the name of the package that provides it.

Below, we outline the instructions to search for a package in Debian/Ubuntu. My next post will do the same for Fedora/Red Hat.

Debian offers multiple command-line tools to search for a package, and which one to use depends on how wide you want to search.

Do you want to search in the installed package base only, or in the entire release repository? Do you want to match the keywords against the file path only, or against the package description as well?

dpkg

Given a file path pattern, the dpkg -S command searches among installed packages only. The pattern is used to match the file path, but not the package description.


$ dpkg -S iostat
sysstat: /usr/bin/nfsiostat
sysstat: /usr/share/man/man1/iostat.1.gz
sysstat: /usr/share/man/man1/nfsiostat.1.gz
linux-headers-3.2.0-4-common: /usr/src/linux-headers-3.2.0-4-common/include/linux/nfs_iostat.h
sysstat: /usr/bin/iostat
sysstat: /usr/share/man/man1/cifsiostat.1.gz
sysstat: /usr/bin/cifsiostat
nfs-common: /usr/sbin/nfsiostatg
nfs-common: /usr/share/man/man8/nfsiostat.8.gz
Note that the above search returns more results than we want. This is because the query automatically adds the wildcard character "*" before and after your search keyword iostat. Hence it matches /usr/bin/nfsiostat as well as /usr/share/man/man1/iostat.1.gz.

If you are sure about the command name, enter it with the following wildcard pattern to avoid the extra output:


$ dpkg -S */iostat$*
sysstat: /usr/bin/iostat
The above output concludes that the sysstat package contains the iostat command.

If the result is path not found matching pattern, it simply means that the command is not in the installed package base. Use apt-file or apt-cache to expand your search.

apt-file

To install apt-file:


$ sudo apt-get update
$ sudo apt-get install apt-file
apt-file builds its own database to index files provided by packages. Before your first search - and periodically after that - you must update the database as follows:

 
$ apt-file update
Downloading complete file http://deb.vanvps.com/debian/dists/wheezy/main/Contents-amd64.gz
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 20.4M  100 20.4M    0     0   372k      0  0:00:56  0:00:56 --:--:--  373k
Ignoring source without Contents File:
  http://security.debian.org/dists/wheezy/updates/main/Contents-amd64.gz
Downloading Index http://deb.vanvps.com/debian/dists/wheezy-updates/main/Contents-amd64.diff/Index:
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0  1057    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
Index is up-to-date.
The apt-file update command reads the /etc/apt/sources.list file to identify the repositories used by your system, and the corresponding mirror sites for downloading packages. For instance, the following line is in sources.list:

deb http://deb.vanvps.com/debian/ wheezy main 
Then, it downloads, from the chosen mirror site, the architecture-specific (amd64) Contents file (http://deb.vanvps.com/debian/dists/wheezy/main/Contents-amd64.gz). The Contents file lists all files in all packages of the selected release (wheezy) and archive area (main).

Now that the database is up-to-date, you are ready to do the actual search:


$ apt-file search -x /pdfcrop$
texlive-extra-utils: /usr/bin/pdfcrop
With the -x parameter, the search string is treated as a regular expression. Therefore, the "$" character is interpreted as "end of line" instead of literally as the dollar sign.

apt-cache


$ sudo apt-get update
$ apt-cache search 2ping
2ping - Ping utility to determine directional packet loss
texlive-extra-utils - TeX Live: TeX auxiliary programs
The apt-cache search command searches the apt cache database for the given pattern (2ping). Before the search, update the apt cache database with apt-get update. The update command reads the /etc/apt/sources.list file, and updates package information for the repositories specified in the file.

By default, apt-cache matches the input pattern (2ping) against both package names and package descriptions stored in the apt cache. Note that the above search returns the texlive-extra-utils package because a match is found in the package description. To view the package description, run the apt-cache show command:


$ apt-cache show texlive-extra-utils
If the --names-only parameter is specified to apt-cache search, only the package name is matched (and the description is not).


$ apt-cache search --names-only 2ping
2ping - Ping utility to determine directional packet loss
The next article discusses how you accomplish the same task in Fedora, and any RPM-based distribution.
