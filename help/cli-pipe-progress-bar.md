---- pv command line progress bar ----
=======================================
Show Copy/Backup/Tar File Progress Bar in Linux

What is it?
------------

**Pv** is a terminal-based tool that allows you to monitor the progress of data that is being sent through a pipe. When using the **pv** command, it gives you a visual display of the
following information:

1.  The time that has elapsed.
2.  The percentage completed including a progress bar.
3.  Shows current throughput rate.
4.  The total data transferred.
5.  and the ETA (estimated Time).


### Install

    # apt-get install pv


### How Do I use pv Command in Linux?

    $ pv file
    $ pv options file
    $ pv file > filename.out
    $ pv options | command > filename.out
    $ comand1 | pv | command2 

The options used with **pv** are divided into three categories, **display switches**, **output modifiers** and **general options**.

### Some options under display modifiers.

1.  To turn on the display bar, use the **-p** option.
2.  To view the elapsed time, use the **–timer** option.
3.  To turn on ETA timer which tries to guess how long it will take
    before completion of an operation, use the **–eta** option. The
    guess is based on previous transfer rates and the total data size.
4.  To turn on a rate counter use the **–rate** option.
5.  To display the total amount of data transferred so far, use the
    **–bytes** option.
6.  To display progress inform of integer percentage instead of visual
    indication, use the **-n** option. This can be good when using
    **pv** with the dialog command to show progress in a dialog box.

### Some options under output modifiers.

1.  To wait until the first byte is transferred before displaying
    progress information, use the **–wait** option.
2.  To assume the total amount of data to be transferred is **SIZE**
    bytes when computing percentage and ETA, use **–size SIZE** option.
3.  To specify seconds between updates, use the **–interval SECONDS**
    option.
4.  Use **–force** option to force an operation. This option forces pv
    to display visuals when standard error is not a terminal.
5.  The general options are **–help** to display usage information and
    **–version** to display version information.

### Use pv Command with Examples

**1.** When no option is included, **pv** commands run with default **-p**, **-t**, **-e**, **-r** and **-b** options.

For example, to copy the **opensuse.vdi** file to **/tmp/opensuse.vdi**, run this command and watch the progress bar in screencast.

    # pv opensuse.vdi > /tmp/opensuse.vdi


**2.** To make a zip file from your /var/log/syslog file, run the following command.

    # pv /var/log/syslog | zip > syslog.zip

**3.** To count the number of lines, word and bytes in the **/etc/hosts** file while showing progress bar only, run this command below.

    # pv -p /etc/hosts | wc

**4.** Monitor the progress of creating a backup file using [tar utility](http://www.tecmint.com/18-tar-command-examples-in-linux/).

    # tar -czf - ./Downloads/ | (pv -p --timer --rate --bytes > backup.tgz)

**5.** Using **pv** and **dialog** terminal-based tool together to create a dialog progress bar as follows.

    # tar -czf - ./Documents/ | (pv -n > backup.tgz) 2>&1 | dialog --gauge "Progress" 10 70

**6.** monitor burning of a usb key or a SD card
  
    # dd if=Armbian_5.05_Orangepih3_Debian_jessie_3.4.110_desktop.raw | pv | sudo dd of=/dev/sdX bs=16M ; sync
