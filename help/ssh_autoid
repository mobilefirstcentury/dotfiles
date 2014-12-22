Auto fill in ssh client parameters
I often ssh to different servers, both at work and at home. Often, the Linux account name is different according to which server I'm logging in. Also, some servers are set up to allow ssh login through a different port than the default port 22. For instance, to login to 123.123.123.123, I need to type all this in:

# ssh -p 2222 admin_2@123.123.123.123
All of this can become human unmanageable rather quickly.

Luckily, I can set up the ssh client such that it fills in ssh login parameters such as port number and user name.

I simply type ssh followed by the IP address or hostname of the computer I want to login. ssh fills in the right port # and user name according to the IP or hostname.

# ssh 123.123.123.123
admin_2@123.123.123.123's password: 
To set it up, insert the following lines into your personal ssh client configuration file, ~/.ssh/config.

Host 123.123.123.123
   User admin_2
   Port 2222
Note that you should edit the configuration file on the ssh client computer. In other words, the setup is on the source computer from which you initiate the ssh request, not the target server that you want to login to.

Alternatively, you can make the change for all users. Insert the same lines into the system-wide ssh client configuration file. For Debian-based distributions, the file is /etc/ssh/ssh_config. You will need root access to edit that file.

After you make the edits, any new ssh client login will have the port and user name filled in automatically.

In addition to ssh, programs such as scp and sftp will also benefit from these settings.

# scp afile.txt  123.123.123.123:
admin_2@123.123.123.123's password: 
afile.txt                                  100%  198     0.2KB/s   00:00    

If you use following, you can give your ssh connection a nice name.
~/.ssh/config
Host Klaus
Hostname 192.168.45.2
User cloe
Port 22
Save and then type
ssh Klaus
and voila perfekt....
