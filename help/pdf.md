---- PDF Manipulation ----
==========================


split pdf file
---------------

  $ pdftk myoldfile.pdf cat 1 2 4 5 output mynewfile.pdf
  $ pdftk myoldfile.pdf cat 1-2 4-5 output mynewfile.pdf
  $ pdftk myoldfile.pdf burst # will create a pdf file for each page of the pdf file


merge pdf file
--------------

  $ pdftk pg_0001.pdf pg_0002.pdf  pg_0005.pdf output mynewfile.pdf




