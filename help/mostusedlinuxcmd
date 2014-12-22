
# Create a new tar archive.
$ tar cvf archive_name.tar dirname/

# Extract from an existing tar archive.
$ tar xvf archive_name.tar

# View an existing tar archive.
$ tar tvf archive_name.tar

# Search for a given string in a file (case in-sensitive search).
$ grep -i "the" demo_file

# Print the matched line, along with the 3 lines after it.
$ grep -A 3 -i "example" demo_text

# Search for a given string in all files recursively
$ grep -r "ramesh" *


# Find files using file-name ( case in-sensitve find)
$ find -iname "MyCProgram.c"

# Execute commands on files found by the find command
$ find -iname "MyCProgram.c" -exec md5sum {} \;

# Find all empty files in home directory
$ find ~ -empty



# Login to remote host
ssh -l jsmith remotehost.example.com

# Debug ssh client
ssh -v -l jsmith remotehost.example.com

# Display ssh client version
$ ssh -V



# When you copy a DOS file to Unix, you could find \r\n in the end of each line. This example converts the DOS file format to Unix file format using sed command.
$ sed 's/.$//' filename

# Print file content in reverse order
$ sed -n '1!G;h;$p' thegeekstuff.txt

# Add line number for all non-empty-lines in a file
$ sed '/./=' thegeekstuff.txt | sed 'N; s/\n/ /'



# Remove duplicate lines using awk
$ awk '!($0 in array) { array[$0]; print }' temp

# Print all lines from /etc/passwd that has the same uid and gid
$awk -F ':' '$3==$4' passwd.txt

# Print only specific field from a file.
$ awk '{print $2,$5;}' employee.txt



# Go to the 143rd line of file
$ vim +143 filename.txt

# Go to the first match of the specified
$ vim +/search-term filename.txt

# Open the file in read only mode.
$ vim -R /etc/passwd



# Ignore white space while comparing.
$ diff -w name_list.txt name_list_new.txt



# Sort a file in ascending order
$ sort names.txt

# Sort a file in descending order
$ sort -r names.txt

# Sort passwd file by 3rd field.
$ sort -t: -k 3n /etc/passwd | more


# To view oracle related environment variables.
$ export | grep ORACLE

# To export an environment variable:
$ export ORACLE_HOME=/u01/app/oracle/product/10.2.0


# Copy all images to external hard-drive
# ls *.jpg | xargs -n1 -i cp {} /external-hard-drive/directory

# Search all jpg images in the system and archive it.
# find / -name *.jpg -type f -print | xargs tar -cvzf images.tar.gz

# Download all the URLs mentioned in the url-list.txt file
# cat url-list.txt | xargs wget –c


# Display filesize in human readable format (e.g. KB, MB etc.,)
$ ls -lh

# Order Files Based on Last Modified Time (In Reverse Order) Using ls -ltr
$ ls -ltr

# Visual Classification of Files With Special Characters Using ls -F
$ ls -F



# To create a *.gz compressed file:
$ gzip test.txt

# To uncompress a *.gz file:
$ gzip -d test.txt.gz

# Display compression ratio of the compressed file using gzip -l
$ gzip -l *.gz

# To create a *.bz2 compressed file:
$ bzip2 test.txt

# To uncompress a *.bz2 file:
bzip2 -d test.txt.bz2

# To extract a *.zip compressed file:
$ unzip test.zip

# View the contents of *.zip file (Without unzipping it):
$ unzip -l jasper.zip

# Shutdown the system and turn the power off immediately.
$ shutdown -h now

# Shutdown the system after 10 minutes.
$ shutdown -h +10

# Reboot the system using shutdown command.
$ shutdown -r now

# Force the filesystem check during reboot.
$ shutdown -Fr now


# 
$ ftp IP/hostname                
--- ftp> mget *.html            # connect to a remote server and download multiple files, do the following.
--- ftp> mls *.html -           # To view the file names located on the remote server before downloading, mls ftp command as shown below.

# View crontab entry for a specific user
$ crontab -u john -l

# Schedule a cron job every 10 minutes.
$/10 * * * * /home/ramesh/check-disk-space


# Check the status of a service:
$ service ssh status

# Check the status of all the services.
$ervice --status-all

# Restart a service.
$ service ssh restart


# To view current running processes.
$ ps -ef | more

# To view current running processes in a tree structure. H option stands for process hierarchy.
$ ps -efH | more


# Typical free command output. The output is displayed in bytes.
$ free

# If you want to quickly check how many GB of RAM your system has use the -g option. -b option displays in bytes, -k in kilo bytes, -m in mega bytes.
$ free -g

# If you want to see a total memory ( including the swap), use the -t switch, which will display a total line as shown below.
$ free -t

# To displays only the processes that belong to a particular user use -u option. The following will show only the top processes that belongs to oracle user.
$ top -u oracle


# Displays the file system disk space usage. By default df -k displays output in bytes.
$ df -k

# df -h displays output in human readable form. i.e size will be displayed in GB’s.
$amesh@ramesh-laptop:~$ df -h

# Use -T option to display what type of file system.
$amesh@ramesh-laptop:~$ df -T

# Use kill command to terminate a process. First get the process id using ps -ef command, then use kill -9 to kill the running Linux process as shown below. You can also use killall, pkill, xkill to terminate a unix process.
$ ps -ef | grep vim


# Get confirmation before removing the file.
$ rm -i filename.txt



# Following example recursively removes all files and directories under the example directory. This also removes the example directory itself.
$ rm -r example


# Copy file1 to file2 preserving the mode, ownership and timestamp.
$ cp -p file1 file2

# Copy file1 to file2. if file2 exists prompt for confirmation before overwritting it.
$ cp -i file1 file2


# Rename file1 to file2. if file2 exists prompt for confirmation before overwritting it.
$ mv -i file1 file2


# mv -v will print what is happening during file rename, which is useful while specifying shell metacharacters in the file name argument.
$ mv -v file1 file2


# You can view multiple files at the same time. Following example prints the content of file1 followed by file2 to stdout.
$ cat file1 file2

# While displaying the file, following cat -n command will prepend the line number to each line of the output.
$ cat -n /etc/logrotate.conf

# To mount a file system, you should first create a directory and mount it as shown below.
$ mkdir /u01 && mount /dev/sdb1 /u01

# You can also add this to the fstab for automatic mounting. i.e Anytime system is restarted, the filesystem will be mounted.
$dev/sdb1 /u01 ext2 defaults 0 2


# Give full access to user and group (i.e read, write and execute ) on a specific file.
$ chmod ug+rwx file.txt

# Revoke all access for the group (i.e read, write and execute ) on a specific file.
$ chmod g-rwx file.txt

# Apply the file permissions recursively to all the files in the sub-directories.
$ chmod -R ug+rwx file.txt


# To change owner to oracle and group to db on a file. i.e Change both owner and group at the same time.
$ chown oracle:dba dbora.sh

# Use -R to change the ownership recursively.
$ chown -R oracle:dba /home/oracle


# Change your password from command line using passwd. This will prompt for the old password followed by the new password.
$ passwd

# Super user can use passwd command to reset others password. This will not prompt for current password of the user.
$ passwd USERNAME

# Remove password for a specific user. Root user can disable password for a specific user. Once the password is disabled, the user can login without entering the password.
$ passwd -d USERNAME


# Following example creates a directory called temp under your home directory.
$ mkdir ~/temp

# Create nested directories using one mkdir command. If any of these directories exist already, it will not display any error. If any of these directories doesn’t exist, it will create them.
$ mkdir -p dir1/dir2/dir3/dir4/



# View all the interfaces along with status.
$ ifconfig -a

# Start or stop a specific interface using up and down command as shown below.
$ ifconfig eth0 up
$ ifconfig eth0 down




# Sample uname output from a Ubuntu laptop is shown below.
$ uname -a


# When you want to find out where a specific Unix command exists (for example, where does ls command exists?), you can execute the following command.
$ whereis ls

# When you want to search an executable from a path other than the whereis default path, you can use -B option and give path as argument to it. This searches for the executable lsmk in the /tmp directory, and displays it, if it is available.
$ whereis -u -B /tmp -f lsmk

# Whatis command displays a single line description about a command.
$ whatis ls
$ whatis ifconfig

# The example below shows all files in the system that contains the word crontab in it.
$ locate crontab

# Display the man page of a specific command.
$ man crontab

# When a man page for a command is located under more than one section, you can view the man page for that command from a specific section as shown below.
$ man SECTION-NUMBER commandname

# Lister les sections du manpage et ouvir le manpage à la bonne section
$ whatis crontab
crontab (1)          - maintain crontab files for individual users (V3)
crontab (5)          - tables for driving cron
$ man 5 crontab


# Print the last 10 lines of a file by default.
$ tail filename.txt

# Print N number of lines from the file named filename.txt
$ tail -n N filename.txt

# View the content of the file in real time using tail -f. This is useful to view the log files, that keeps growing. The command can be terminated using CTRL-C.
$ tail -f log-file

# less is very efficient while viewing huge log files, as it doesn’t need to load the full file while opening.
$ less huge-log-file.log

# Switch to a different user account using su command. Super user can switch to any other user without entering their password.
$ su - USERNAME

# Execute a single command from a different account name. In the following example, john can execute the ls command as raj username. Once the command is executed, it will come back to john’s account.
$ su - raj -c 'ls'


# Login to a specified user account, and execute the specified shell instead of the default shell.
$ su -s 'SHELLNAME' USERNAME



# To connect to a remote mysql database. This will prompt for a password.
$ mysql -u root -p -h 192.168.1.2

# To connect to a local mysql database.
$ mysql -u root -p



# To install apache using yum.
$ yum install httpd

# To upgrade apache using yum.
$ yum update httpd

# To uninstall/remove apache using yum.
$ yum remove httpd


# To install apache using rpm.
$ rpm -ivh httpd-2.2.3-22.0.1.el5.i386.rpm

# To upgrade apache using rpm.
$ rpm -uvh httpd-2.2.3-22.0.1.el5.i386.rpm

# To uninstall/remove apache using rpm.
$ rpm -ev httpd



# Ping a remote host by sending only 5 packets.
$ ping -c 5 gmail.com



# Set the system date:
$ date -s "01/31/2010 23:59:53"

# Once you’ve changed the system date, you should syncronize the hardware clock with the system date as shown below.
$ hwclock –systohc
$ hwclock --systohc –utc


# The quick and effective method to download software, music, video from internet is using wget command.
$ wget http://prdownloads.sourceforge.net/sourceforge/nagios/nagios-3.2.1.tar.gz

# Download and store it with a different name.
$ wget -O taglist.zip http://www.vim.org/scripts/download_script.php?src_id=7701
