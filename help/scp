SCP command examples - linux / unix
By surya aix13:49No comments
SCP stands for secure copy is used to copy data (files or directories) from one unix or linux system to another unix or linux server. SCP uses secured shell (ssh) to transfer the data between the remote hosts. 
The features of SCP are:

Copies files within in the same machine
Copies files from local machine to remote machine
Copies files from remote machine to local machine
Copies files between two different remote servers
SCP Command Syntax:

The syntax of SCP command is>
scp [Options] [[User@]From_Host:]Source_File [[User@]To_Host:][Destination_File]
Each element of the scp command is explained in detail below:
User is the one who have the permissions to access the files and directories. User should have read permissions if it is a source and write permissions if it is the destination.
From_Host: hostname or Ip address where the source file or directory resides. This is optional if the from host is the host where you are running the scp command.
Source_File: Files or directories to be copied to the destination.
To_Host: Destination host where you want to copy the files. You can omit this when you want to copy the files to the host where you are issuing the scp command.
Destination_File: Name of the file or directory in the target host.
SCP Command Options:
The important SCP command options are listed below:
-r : Recursively copies the contents of source files or directories.
-p : Preserves the access time, modification time, permissions of the source files in the destination.
-q : Progress bar in not displayed
-v : verbose mode. Displays debugging messages.
-P : copy files using the specified port number.
SCP Command Examples:

Let see the examples of scp command in unix or linux system.
1. Copying with in the same system

You can use the scp command just like the cp command to copy files from one directory to another directory.
scp Unix-storage.dat /var/tmp/
This command copies the file unix-storage.dat from current directory to the /var/tmp directory.
2. Copy file from local host to remote server

This is most frequently used operation to transfer files in unix system.
scp filename user@remotehost:/remote/directory/
This command connects to the remote host and copies the specified file to the /remote/directory/.
3. Copy files from remote host to local server

This operation is used when taking backup of the files in remote server.
scp user@remotehost:/usr/backup/oracle_backup.dat .
This command copies the oracle backup file in the remote host to the current directory.
4. Copying files between two remote servers

The scp command can also be used to copy files between two remote hosts.
scp source_user@source_remote_host:/usr/bin/mysql_backup.sh target_user@target_remote_host:/var/tmp/
The above command copies the mysql bakup shell script from the source remote host the /var/tmp directory of target remote host.
5. Copying a directory

To copy all the files in a directory, use the -r option with the scp command. This makes the scp command to copy the directory recursively.
scp -r directory user@remotehost:/var/tmp/
The above command copies the directory from local server to the remote host.
6. Improving performance of scp command

By default the scp command uses the Triple-DES cipher/AES-128 to encrypt the data. Using the blowfish or arcfour encryption will improve the performance of the scp command.
scp -c blowfish filename  user@remoteserver:/var/
scp -c arcfour  localfile user@remoteserver:/var/
7. Limit bandwidth

You can limit the bandwidth used by the scp command using the -l option.
scp -l bandwidth_limit filename user@hostname:/usr/backup/
Here bandwidth_limit is numeric to be specified in kilobits per second.
8. Specifying the port number

We can make the scp command to copy the files over a specified port number using the -P option.
scp -P 6001 storage_backup.bat username@hostname:/tmp/



Occasionally, I want to copy a short line of text to a remote computer. For instance, I have an URL for some real cool web site which, for whatever reason, I want to send to a remote host. I can always put the text in a file, and transfer it via scp.

$ cat > coolurl.txt
http://really-cool-web-site/

$ scp coolurl.txt peter@192.168.1.112:
Or, you can use the following one-liner command:

$ echo 'http://really-cool-web-site/'|ssh peter@192.168.1.112 'cat >coolurl.txt'
The one-liner uses only simple commands such as echo, ssh and cat. It saves you the step of creating a new file on the local machine.

The text is saved to a file called coolurl.txt on the remote computer under your home directory.

Let me know your favourite way to accomplish the same thing.
