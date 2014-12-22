Get into the right groups
In Linux, belonging to the right group gives you permission to use restricted-access resources. 

When you create a new user, by default, 
$ useradd -m george
$ passwd george
Enter new UNIX password:
Retype new UNIX password:
passwd: password updated successfully


Of course, you could have done the above using the wizard-styled adduser command.

Now, see what default groups george is in:
$ groups george
george : george


Poor george: he is a loner: being a group of oneself.

george may one day try to use some peripheral devices like the CDROM drive, USB drive, or floppy drive, and discovers that he simply cannot.

What do you do?

First, make sure that for pre-configured drives like the CDROM and floppy drives, the user option is specified. The default option is nouser which restricts access to root only.

cat /etc/fstab
...
/dev/hdb        /media/cdrom0   udf,iso9660 user,noauto     0       0
/dev/fd0        /media/floppy0  auto        rw,user,noauto  0       0
...


If the drive is configured correctly, then determine if george is in the right groups. The easiest way is to reference some user whom you know can access the target devices.

$ groups peter
peter : peter dialout cdrom floppy audio video plugdev netdev powerdev


Most group names are self-explanatory. For USB thumb drives, make sure that george is in plugdev.

To add george to the right groups:
usermod -aG  cdroom,floppy,plugdev  george


usermod -aG appends the new groups to george's existing groups.

$ groups george
george : george cdrom floppy plugdev
