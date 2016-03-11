sudo sh -c "iptables-save > /etc/iptables/rules.v4"   #sudo and redirection >
echo 'iptables-save > /etc/iptables/rules.v4' | sudo bash #sudo and redirection >
sudo iptables-save|sudo tee /etc/iptables/rules.v4 >/dev/null #sudo and redirection >

sudo command | sudo dd of=FILENAME # Pipe avec sudo sans redirection stdout
sudo command | sudo tee FILENAME   # Pipe avec sudo et redirection stdout

su | The command su is used to switch to another user (s witch u ser), but you can also switch to the root user by invoking the command with no parameter. su asks you for the password of the user to switch, after typing the password you switched to the user's environment.

sudo | sudo is meant to run a single command with root privileges. But unlike su it prompts you for the password of the current user. This user must be in the sudoers file (or a group that is in the sudoers file). By default, Ubuntu "remembers" your password for 15 minutes, so that you don't have to type your password every time.

sudo su Calls sudo with the command su. Bash is called as interactive non-login shell. So bash only executes .bashrc. You can see that after switching to root you are still in the same directory:

user@host:~$ sudo su
root@host:/home/user#
sudo su - This time it is a login shell, so /etc/profile, .profile and .bashrc are executed and you will find yourself in root's home directory with root's environment.

sudo -i It is nearly the same as sudo su - The -i (simulate initial login) option runs the shell specified by the password database entry of the target user as a login shell. This means that login-specific resource files such as .profile, .bashrc or .login will be read and executed by the shell.

sudo /bin/bash This means that you call sudo with the command /bin/bash. /bin/bash is started as non-login shell so all the dot-files are not executed, but bash itself reads .bashrc of the calling user. Your environment stays the same. Your home will not be root's home. So you are root, but in the environment of the calling user.

sudo -s reads the $SHELL variable and executes the content. If $SHELL contains /bin/bash it invokes sudo /bin/bash (see above).


-----------------------

bash | A text-interface to interact with the computer. It's important to understand the difference between login, non-login, interactive and non-interactive shells:

login shell: A login shell logs you into the system as a spiecified user, necessary for this is a username and password. When you hit ctrl+alt+F1 to login into a virtual terminal you get after successful login a login shell.
non-login shell: A shell that is executed without logging in, necessary for this is a currently logged-in user. When you open a graphic terminal in gnome it is a non-login shell.
interactive shell: A shell (login or non-login) where you can interactively type or interrupt commands. For example a gnome terminal.
non-interactive shell: A (sub)shell that is probably run from an automated process. You will see neither input nor output.
