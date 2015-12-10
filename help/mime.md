How to find the MIME type of a file
Some MIME types can be intuitive - application/pdf for PDF files. However, not all MIME types are that easy to get exactly right - application/vnd.ms-excel for xls or Excel files.

The following are different ways, using the command line, to identify the MIME type of a file.

xdg-mime
$ xdg-mime query filetype somefile.xls
application/vnd.ms-excel
file
$ file -b --mime-type somefile.xls
application/vnd.ms-excel
gvfs-info
$ gvfs-info -a standard::content-type somefile.xls
attributes:
  standard::content-type: application/vnd.ms-excel
