Identify Linux distribution, code name and version info
How do you identify the Linux distribution, the specific code name and version number that is running on a machine?

Below are several ways.

lsb_release
$ lsb_release -a
No LSB modules are available.
Distributor ID: Debian
Description: Debian GNU/Linux 7.4 (wheezy)
Release: 7.4
Codename: wheezy
If lsb_release is not installed by default on your machine, install it as follows.

For Fedora, Centos, and Red Hat Enterprise Linux
$ sudo yum install redhat-lsb-core
For Debian and its derivatives.
$ sudo apt-get update
$ sudo apt-get install lsb-release
Examine the distro release file (/etc/*release).
The release file of a distribution contains the information we want. The specific release file name may vary by distribution, but the file is usually located in the /etc directory.

$ ls /etc/*release
/etc/os-release
$ cat /etc/os-release
PRETTY_NAME="Debian GNU/Linux 7 (wheezy)"
NAME="Debian GNU/Linux"
VERSION_ID="7"
VERSION="7 (wheezy)"
ID=debian
ANSI_COLOR="1;31"
HOME_URL="http://www.debian.org/"
SUPPORT_URL="http://www.debian.org/support/"
BUG_REPORT_URL="http://bugs.debian.org/"
/etc/issue
$ cat /etc/issue
Fedora release 19 (Schrödinger s Cat)
Kernel \r on an \m (\l)
This method is less reliable than the first two methods. The /etc/issue file contains the text to be displayed as part of the login prompt.

The default file content varies from distro to distro. Also, the system administrator may have customized the file content.

For default Debian wheezy, the file does not reveal the code name or the minor version number (the 4 in 7.4):

$ cat /etc/issue
Debian GNU/Linux 7 \n \l
