---- tar cheatsheet ----
=======================

# create an compressed archive 
  $ tar czf foder.to.encrypt.tar.gz folder.to.encrypt

# extract an encrypted archive (with tar and 7z)
  $ sudo tar xf folder.to.encrypt.tar.gz  // Preserving owners and permissions needs priviledges


#tar -czvf myarchive.tgz mydirectory/'
#tar -czvf myarchive.tgz myfile1 myfile2 mydir1

We use the -t option to create an linux tar archive
-c, –create create a new archive
Note that .tgz is the same thing as .tar.gz
Create linux simple tar archive (withouth compresion)
#tar -cvf myarchive.tar mydirectory/
Extracting linux tar archive:


Extract linux tar gz (Gzip) archive

#tar -xzvf mystuff.tgz

Extract linux simple tar archive

#tar -xvf mystuff.tar

We use -x to extract the files form the tar archive
-x, –extract, –get extract files from an archive
Extract linux tar archive to speciefied directorytar -xvzf filename.tar.gz -C /desired/path

And now let us shortly explain this command

Usage: tar [OPTION]… [FILE]…
Let us check the option used in this example
-c, –create                      create a new archive
-z, –gzip, –ungzip        filter the archive through gzip
-v, –verbose                   verbosely list files processed
-f, –file=ARCHIVE          use archive file or device ARCHIVE
-C directory file Performs a chdir  operation on directory and performs the c (create) or r (replace) operation on file .

In c and r mode, these changes the directory before adding the following files. In x mode, change directories after opening the archive but before extracting entries from the archive.
You can extract to a defined location using:
#tar xvf yourstuff.tar -C your/path/here
Testing / viewing your archive

#tar -tvf myarchive.tar
#tar -tzvf myarchive.tgz
Here we used the – t opton
-t, –list                           list the contents of an archive


tar --exclude='./folder' --exclude='./upload/folder2' -zcvf /backup/filename.tgz .   # extract tar archive with pattern exclusion
————————————————-

# extract archive with a new directory name
mkdir pretty_name && tar xf ugly_name.tar -C pretty_name --strip-components 1


