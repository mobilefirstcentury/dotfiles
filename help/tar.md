---- tar cheatsheet ----
=======================

**note** .tgz is the same thing as .tar.gz

cookbooks
---------

### backup
**note** 
  - this describes best practice for quick and dirty backup (more complexes backups are done with specialized tools) 
  - we insert a README.md file in each tarball explaining how to manipulate the archive
  - if the archive doesn't contain README.md, one should extract with relative paths by default

#### backup with relative paths
  ```sh
  # prepare a README.md in dir with extractions instructions
  # create a tarball with relative paths (-P)
  $ tar czvf tarball.tgz relative/path/to/dir  relative/path/to/file 

  # read README.md instructions with vim
  $ nvim tarball.tgz   # then type <enter> on 'README.md' entry  

  # extract files and directories in their relative path preserving ownership and permission (default behaviour for superuser)
  $ cd somewhere
  $ sudo tar xzvf tarball.tgz   # archive will be extracted in <somewhere>
  ```

#### backup with absolute paths
  ```sh
  # prepare a README.md in dir with extractions instructions
  # create a tarball with absolute paths (-P)
  $ tar czvf tarball.tgz absolute/path/to/dir  absolute/path/to/file README.md -P  

  # read README.md instructions with vim
  $ nvim tarball.tgz   # then type <enter> on 'README.md' entry  

  # If asked for README.md, extract files and directories in their absolute path (-P)  preserving ownership and permission (default behaviour for superuser)
  $ sudo tar xzvf tarball.tgz  -P     
  ```


create archive
--------------
### create a gzip compressed archive 
  $ tar czf foder.tar.gz folder
  $ tar czvf foder.tar.gz folder   # verbose

### create a compressed archive containing multiple files & folders
  $ tar -czvf myarchive.tgz myfile1 myfile2 mydir1

### create a tar archive (withouth compresion)
  $ tar -cvf myarchive.tar mydirectory/

### create tar archive with pattern exclusion
tar --exclude='./folder' --exclude='./upload/folder2' -zcvf /backup/filename.tgz .   


### create gpg encrypted tarball
[TODO] modifier pour avoir une encryption asymetrique

  $ tar -cz your_dir | gpg -c -o your_archive.tgz.gpg



extract archive
--------------
### extract a compressed archive
  $ sudo tar xf folder.tar.gz     # preserving owners and permissions needs priviledges
  $ sudo tar xf folder.tgz        # preserving owners and permissions needs priviledges


### extracting linux tar gzip compressed archive:
 $ tar -xzvf mystuff.tgz

### extract a tar archive (withouth compresion) 
  $ tar -xvf mystuff.tar

### extract linux tar archive to speciefied directory
  $ tar -xvzf filename.tar.gz -C /desired/path

### test / view an  archive
  $ tar -tvf myarchive.tar     # list archive content
  $ tar -tzvf myarchive.tgz    # list compressed archive content

### extract archive with a new directory name
mkdir pretty_name && tar xf ugly_name.tar -C pretty_name --strip-components 1

### extract gpg encrypted tarball
[TODO] modifier pour avoir une encryption asymetrique

  $ gpg -d your_archive.tgz.gpg | tar xz
