---- Installation User Guide ----
=================================
[ToDO] 
  - enrichir ce help avec [aptitude](https://doc.ubuntu-fr.org/aptitude)


apt
---

### what is it ?
apt is a tool for package management on ubuntu.
It reads configuration from '/etc/apt/sources.list' to do it's work.


### use 

#### package install 
  ```sh
  $ sudo apt-get install <package-name>                   # installs <package-name> and its dependencies from one of the source repository 
  $ sudo apt-get build-dep <package-name>                 # install dependencies of <package-name>
  $ sudo aptitude install <package-name>                  # apt with an easier insterface
  $ auto-apt run ./configure                              # when called with a command auto-apt will run the command (here 'run ./configure') and install any missing dependency 
                                                          # without auto-apt, the command would simply fail. 
  ```


#### package uninstall
  ```sh
  $ apt-get remove <package-name>                         # uninstall package 
                                                          # doesn't touch configuration files
  $ apt-get purge <package-name>                          # uninstall package 
                                                          # deletes configuration files (except those residing in 'home')

  $ apt-get auto-remove <package-name>                    # uninstall package and auto-remove it's dependencies if there no longer used
  $ apt-get auto-remove                                   # remove packages that were installed as dependencies by other packages and that are no longer used
  ```

#### packages maintenance
  ```sh
  $ apt-cache policy <package>                            # get available package version on installed repos
  $ apt-get update                                        # refreshes local package list 
                                                          # always 'apt-get update' before installing or upgrading packages
  $ apt-get update && apt-get upgrade                     # upgrade all packages. In case of dependency conflict, preserve current state

  $ apt-get update && apt-get upgrade && apt-get dist-upgrade     # same as upgrade but will try to be smart in conflict resolution
                                                                  # tries to upgrade important packages at the exepense of unimportant ones.

  $ apt-get check                                         # diagnostic: refresh local package list and check for broken dependencies
  $ apt-get -f install                                    # auto healing in case of broken dependencies
  $ apt-get autoclean                                     # same as 'apt-get -f install' but first erase package cache in '/var/cache/apt/archives'
  $ dpkg-reconfigure <package_name>                       # reconfigures a package asking for advanced options decisions
  $ echo "<package_name> hold" | dpkg --set-selections    # freeze package and prevent any update
  $ echo "<package_name> install" | dpkg --set-selections # unfreeze package after a '<package-name> hold'
  ```


#### package search

  ```sh
  $ apt-cache search <search_term>                             # This command will find packages that include <search_term>.
  $ dpkg -l *<search_term>*                                    # This will find packages whose names contain <search_term>.
                                                               # Similar to apt-cache search, but also marks it with ii (installed) and un (not installed).
    
  $ apt-cache show <package_name>                              # shows the description of package  and other relevant information including version, size, dependencies and conflicts.
  $ dpkg --print-avail <package_name>                          # This command is similar to "apt-cache show".
  $ dpkg -L <package_name>                                     # This command will list files in package <package_name>.
  $ dpkg -c foo.deb                                           # This command lists files in the package "foo.deb".
  $                                                           # Note that foo.deb is a pathname. Use this command on .deb packages that you have manually downloaded.
    
  $ dlocate <package_name>                                    # This command determines which installed package owns <package_name>.i
  $                                                           # It shows files from installed packages that match <package_name>, with the name of the package they came from.
  $                                                           # Consider this to be a "reverse lookup" utility.
    
  $ dpkg -S <filename_search_pattern>                         # This command does the same as dlocate, but does not require the installation of any additional packages.
  $                                                           # It is slower than dlocate but has the advantage of being installed by default on all Debian and Ubuntu systems.
    
  $ apt-file search <filename_search_pattern>                 # This command acts like dlocate and dpkg -S, but searches all available packages.
  $                                                           # It answers the question, "what package provides this file?".
    
  $ apt-file update                                          # apt-file needs to be updated regularly like apt-get. Use the command:
  $ apt-cache pkgnames                                       # This command provides a listing of every package in the system
  ```



#### examples

  ```sh
  $ apt-cache search racing game                            # what racing games are available?
  $ apt-cache show torcs                                    # get some more information on torcs racing game
  $ apt-cache policy torcs                                  # is it already installed ? And what is the available version? Is it from Universe or main?
  $ apt-get install torcs                                   # install torcs package
  $ apt-cache depends torcs                                 # list dependencies of torcs package
  $ apt-cache search torcs                                  # are there any related package ? 
  $ apt-get remove torcs                                    # removes torcs but keep configuration file for a futur reinstallation
  $ apt-get purge torcs                                     # get ride of torcs and it's config
  ```




dpkg 
----

### install package
  ```sh
  $ dpkg -i file.deb
  $ apt-get -f install     # Install broken dependencies if `dpkg -i` complained about missing dependencies
  ```
### list package dependencies
  $ dpkg -I file.deb 

### examples
  $ dpkg -L torcs | grep /usr/bin/                          # what's the command for this package ? 
  $ dpkg -L torcs | grep /usr/sbin/                         # what's the command for this package ? (if not found in /usr/bin/)
