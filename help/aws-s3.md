---- AWS S3 CLI CHEATSHEET ----
==============================


Getting Help
-------------
  $ aws s3 [command] help    # where command is one of: cp, ls, mb, mv, rb, rm, sync, website

Create a new buckets in S3
---------------------------
  $ aws s3 mb s3://skipperkongen-test # creates a bucket called skipperkongen-test

List all your buckets in S3
---------------------------
  $ aws s3 ls

Copy to/from S3
--------------
  $ aws s3 cp testfile.txt s3://skipperkongen-test/testfile.txt       # Copy of file from local to s3
  $ aws s3 cp testfile.txt s3://skipperkongen-test/                   # Copy of file from local to s3 keeping its name
  $ aws s3 cp mydir s3://skipperkongen-test/testDir --recursive       # Copy of a directory from local to s3
  $ aws s3 cp s3://skipperkongen-test/testfile.txt testfile.txt       # Copy of file from s3 to local
  $ aws s3 cp s3://skipperkongen-test/testDir mydir  --recursive      # Copy of a directory from s3 to local
  $ aws s3 cp --recursive s3://my-bucket s3://my-second-bucket        # Copy a bucket to another bucket


Using filters
--------------
** note ** 

  - Filters are evaluated against source directory (testDir) of directory of source file (testfile.txt)
  - Before any filter evrything is included. So you have to exclude before including

  $ aws s3 cp testDir s3://skipperkongen-test/  --exclude "*" --include "*.txt"         # Copy of file from local to s3 respecting filter condition
  $ aws s3 cp testDir s3://skipperkongen-test/  --exlude  "*.v[123].???"                # Copy of file from local to s3 respecting filter condition
  $ aws s3 cp testfile.txt s3://skipperkongen-test/  --exlude  "*.v[!123].???"          # Copy of file from local to s3 respecting filter condition

Move a file to/from S3
-----------------
  $ aws s3 mv testfile.txt s3://skipperkongen-test/testfile.txt       # Move file from local to s3
  $ aws s3 mv testfile.txt s3://skipperkongen-test/                   # Move file from local to s3 keeping its name
  $ aws s3 mv mydir s3://skipperkongen-test/testDir --recursive       # Move a directory from local to s3
  $ aws s3 mv s3://skipperkongen-test/testfile.txt testfile.txt       # Move file from s3 to local
  $ aws s3 mv s3://skipperkongen-test/testDir mydir  --recursive      # Move a directory from s3 to local
  $ aws s3 mv --recursive s3://my-bucket s3://my-second-bucket        # Move a bucket to another bucket

Sync a whole directory with S3
----------------------------
  $ aws s3 sync mylocaldir s3://skipperkongen-test/mys3dir

List files in an S3 bucket
--------------------------
  $ aws s3 ls s3://skipperkongen-test

Remove alls files from a bucket
------------------------------
  # beware: '*' is not recognized by s3 but treated as a normal character
  $ aws s3 rm --recursive s3://my-bucket



Delete an entire S3 bucket (must be empty or use –force)
--------------------------------------------------------
  $ aws s3 rb s3://skipperkongen-test           # only if the bucket is empty
  $ aws s3 rb --force s3://skipperkongen-test   # force deletetion of not empty bucket (content is destroyed)

Get bucket location
-------------------
  $ aws s3api get-bucket-location --bucket <bucket-name>

Get bucket logging status
------------------------
  $ aws s3api get-bucket-logging --bucket <bucket-name>



Get ACL for a bucket (Access rights for the bucket)
--------------------------------------------------
 $ aws s3api get-bucket-acl --bucket buffer-aws-mfc   // The bucket name is given without the "s3://". Returns a JSON  


Get ACL for an object (Access rights for an object in a bucket)
----------------------------------------------------------------
 $ aws s3api get-object-acl --bucket buffer-aws-mfc/blob   // The bucket name is given without the "s3://". Returns a JSON  

