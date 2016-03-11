---- gcloud ----
================

** note ** 

  - gcloud is the google sdk to programatically control google cloud
  - it also comprises gcloud and gsutils command line tools

Installation
------------
  $ curl https://sdk.cloud.google.com | bash
  # restart the shell
  $ source ~/.zshrc


Authentication
--------------
  # has to be done manually
  # beware, this command opens a web page in the default browser to allow you to authorize access to your google account
  $ gcloud auth login
