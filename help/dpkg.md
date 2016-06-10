---- dpkg cheatsheet ---
========================

What is it i?
-------------

  **dpkg** is the main package management program in **Debian** and **Debian** based System. It is used to **install**, **build**, **remove**, and **manage** packages. **Aptitude** is the
  primary front-end to **dpkg**.


Commands
-----------------

Syntax                   | Explanation                                                                      | Example
---                      | ---                                                                              | ---
dpkg -i {.deb package}   | Install the package                                                              | dpkg -i zip_2.31-3_i386.deb
dpkg -i {.deb package}   | Upgrade package if it is installed else install a fresh copy of package          | dpkg -i zip_2.31-3_i386.deb
dpkg -R {Directory-name} | Install all packages recursively from directory                                  | dpkg -R /tmp/downloads
dpkg -r {package}        | Remove/Delete an installed package  except configuration files                   | dpkg -r zip
dpkg -P {package}        | Remove/Delete everything including configuration files                           | dpkg -P apache-perl
dpkg -l                  | List all installed packages, along with package version and short desscription   | dpkg -l '*apache*'
dpkg -l {package}        | List individual installed packages, along with package version and short desc.   | dpkg -l apache-perl
dpkg -L {package}        | Find out files provided by the intalled package                                  | dpkg -L apache-perl,dpkg -L perl
dpkg -c {.Deb package}   | List files provided (or owned) by  the package. List files inside .deb packages. | dpkg -c dc_1.06-19_i386.deb
dpkg -S {/path/to/file}  | Find what package owns the file                                                  | dpkg -S /bin/netstat
dpkg -p {package}        | Display details about package                                                    | dpkg -p lsof
dpkg -s {package}        | grep Status Find out if Debian package is installed                              | dpkg -s lsof                     | grep Status


Howto
-----

### Search files among installed packages

**command**

  ```sh
  $ dpkg -S <pattern>   # Searches among installed packages files with name containing pattern 
  ```
**examples**

  ```sh
  $ dpkg -S iostat
      ->
      sysstat: /usr/share/man/man1/iostat.1.gz
      sysstat: /usr/bin/nfsiostat
      sysstat: /usr/share/man/man1/nfsiostat.1.gz
      linux-headers-3.2.0-4-common: /usr/src/linux-headers-3.2.0-4-common/include/linux/nfs_iostat.h
      sysstat: /usr/bin/iostat
      sysstat: /usr/share/man/man1/cifsiostat.1.gz
      sysstat: /usr/bin/cifsiostat
      nfs-common: /usr/sbin/nfsiostatg
      nfs-common: /usr/share/man/man8/nfsiostat.8.gz
  ```

  ```sh
  $ dpkg -S */iostat$*    # Searches among installed packages for files named __exactly__ 'iotstat'.
    ->
    sysstat: /usr/bin/iostat
  ```

### Search for packages online repos

**command**
  ```sh
  $ apt-file <pattern>   # apt-file builds its own searchable database to index files provided by packages.
  ```

**install**
  ```sh
  $ sudo apt-get update
  $ sudo apt-get install apt-file
  ```
**use**

  ```sh
  $ apt-file update    # Reads list of repos from  /etc/apt/sources and download package's files database. Use to periodically to update the database
  ``` 

  ```sh
  $ apt-file search -x /pdfcrop$   # searches for file name __exactly__ pdfcrops among existing packages. '-x' options allows regex argument.
  ```
### Search installed packages 

**command**
```sh
apt-cache search <pattern>    # The apt-cache search command searches the apt cache database for the given pattern (matches package name and package description)
                              # Before the search, update the apt cache database with apt-get update.
                              # The update command reads the /etc/apt/sources.list file, and updates package information for the repositories specified in the file.
```

**use**
  ```sh
  $ sudo apt-get update
  $ apt-cache search 2ping
    ->
    2ping - Ping utility to determine directional packet loss
    texlive-extra-utils - TeX Live: TeX auxiliary programs
  ```


  ```sh
  $ apt-cache search --names-only 2ping   # If the --names-only parameter is specified to apt-cache search, only the package name 
    ->
    2ping - Ping utility to determine directional packet loss
  ```

### view package description

**command**
  ```sh
  $ apt-cache show <command>
  ```

**use**

  ```sh
  $ apt-cache show texlive-extra-utils
  ```


Practical Examples of “dpkg commands” 
-------------------------------------------------------------------------------

### 1. Install a Package

For installing an “**.deb**” package, use the command with “**-i**” option. For example, to install an “**.deb**” package called “**flashpluginnonfree\_2.8.2+squeeze1\_i386.deb**” use the
following command.

    ```sh
    $ dpkg -i flashpluginnonfree_2.8.2+squeeze1_i386.deb
    ```

### 2. List all the installed Packages

To view and list all the installed packages, use the “**-l**” option along with the command.

    ```sh
    $ dpkg -l
    ```


To view a specific package installed or not use the option “**-l**” along with package-name. For example, check whether **apache2** package installed or not.

    ```sh
    $ dpkg -l apache2
    ```


### 3. Remove a Package

To remove the “**.deb**” package, we must specify the package name “**flashpluginnonfree**“, not the original name “**flashplugin-nonfree\_3.2\_i386.deb**“. The “**-r**” option is used to
**remove**/**uninstall** a package.

    ```sh
    $ dpkg -r flashpluginnonfree
    ```

You can also use ‘**p**‘ option in place of ‘**r’** which will remove the package along with configuration file. The ‘**r**‘ option will only remove the package and not configuration files.

    ```sh
    $ dpkg -p flashpluginnonfree
    ```

### 4. View the Content of a Package

To view the content of a particular package, use the “**-c**” option as shown. The command will display the contents of a “**.deb**” package in long-list format.

    ```sh
    $ dpkg -c flashplugin-nonfree_3.2_i386.deb
    ```


### 5. Check a Package is installed or not

Using “**-s**” option with package name, will display whether an deb package installed or not.

    ```sh
    $ dpkg -s flashplugin-nonfree
    ```

### 6. Check the location of Packages installed

To list location of files to be installed to your system from package-name.

    ```sh
    $ dpkg -L flashplugin-nonfree
    ```


### 7. Install all Packages from a Directory

Recursively, install all the regular files matching pattern “\***.deb**” found at specified directories and all of its subdirectories. This can be used with “**-R**” and “**–install**”
options. For example, I will install all the “**.deb**” packages from the directory called “**debpackages**“.

    ```sh
    $ dpkg -R --install debpackages/
    ```

### 8. Unpack the Package but dont’ Configure

Using action “**–unpack**” will unpack the package, but it will don’t install or configure it.

    ```sh
    $ dpkg --unpack flashplugin-nonfree_3.2_i386.deb
    ```


### 9. Reconfigure a Unpacked Package

The option “**–configure**” will reconfigure a already unpacked package.

    ```sh
    $ dpkg --configure flashplugin-nonfree
    ```

### 10. Replace available Package information

The “**–-update-avail**” option replace the old information with the available information in the Packages file.

    ```sh
    $ dpkg –-update-avail package_name
    ```

### 11. Erase Existing Available information of Package

The action “**–clear-avaial**” will erase the current information about what packages are available.

    ```sh
    $ dpkg –-clear-avail
    ```

### 12. Forget Uninstalled and Unavailable Packages

The dpkg command with option “**–forget-old-unavail**” will automatically forget uninstalled and unavailable packages .

    ```sh
    $ dpkg --forget-old-unavail
    ```

### 13. Display dpkg Version

The “**–version**” argument will display dpkg version information.

    $ dpkg –version


### 14. Get all the Help about dpkg

The “**–help**” option will display a list of available options of dpkg command.

    $  dpkg –help

