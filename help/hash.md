---- file and data integrity user guide -----
============================================



file integrity check
--------------------

### file vs hash file
  ```sh
  $ hsh file `<file.md5)`                                    # hsh recognize automaticallyt the hash algorithm 
  $ hsh file `<file.md5 | sed -n 2p | awf '{print $1}'`      # sometimes the hash as to be extracted from a file
                                                             # here we extract the first word in the second line
  ```

### file vs hash
  ```sh
  $ hsh file 0e1fb609e951c85e01f4048f01f0b51256bb3917   # hsh detects automatically hash algorithm
  ```

### md5sum file (properly formated)
**note** works only if 
  - md5sum file is in the same directory as the file check
  - md5sum file is appropriately formated: <md5sum><space><space><path/to/file/name>

  $ md5sum -c <md5sum-file>

### sha256 file (properly formated)
**note** works only if 
  - sha256sum file is in the same directory as the file check
  - sha256sum file is appropriately formated: <sha256sum><space><space><path/to/file/name>

  $ sha256sum -c <sha256sum-file>


hash vs hash
------------

  ```sh
  $ hsh da24f4932321286ac849f9145707f0e8 da24f4932321286ac849f9145707f0e9
  ```

file to file Comparisons
------------------------

  ```sh
  $ hsh firstfile.txt secondfile.txt
  ```


hash file
---------


  ```sh
  $ md5sum file
  $ sha256sum file
  $ hsh somefile.txt              #  default to sha256
  $ hsh md5 somefile.txt          #  other hash algos: sha1, sha224, sha384, sha512
  ```
   
