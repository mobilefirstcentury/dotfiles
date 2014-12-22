Identify available printer names

Some machines have access to more than one printer. Unless the default printer is the one you want, you need to know the name of the printer to use in the printer-related command. For instance, if you want to know the status of a printer, you execute the lpq command:

$ lpq
ml1640 is ready
no entries
ml1640 is the default printer for the machine. If you want a printer other than the default, the lpq command requires that you specify the printer name. Other commands such as lpr, and lprm behave the same way.

How do you find out the printer name that the Linux printing system will recognize?

$ lpstat -a
clp325w accepting requests since Tue 12 Mar 2013 09:42:07 PM PDT
ml1640 accepting requests since Sun 10 Mar 2013 09:22:33 PM PDT
scx3405 accepting requests since Sun 10 Mar 2013 09:24:00 PM PDT
Armed with the printer name scx3405, you simply run lpq again like this:

$ lpq -P scx3405
scx3405 is ready
no entries
If you run lpstat with the -s parameter, it will give even more information in the form of a status summary (including identifying the default printer):

$ lpstat -s
system default destination: ml1640
device for clp325w: ipp://192.168.1.22
device for ml1640: mfp:/dev/mfp4
device for scx3405: ipp://192.168.1.11
You can tell then ml1640, the default printer, is a local printer, and the rest are remote.

With lpstat, you can list the printer names that the Linux printing system can recognize.
