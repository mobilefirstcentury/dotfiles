
Managing User Accounts on Your Linux Instance
=============================================

  - Amazon AWS ECS instances default users: 
    + Amazon Linux: `ec2-user`
    + RHEL5,: `root` or `ec2-user`
    + Ubuntu: `ubuntu`
    + Fedora: `fedora`or `ec2-user`
    + SUSE Linux:  root` or `ec2-user`

Add new users
-------------
1.  create a new user <newuser> with a group <newuser> and a home directory /home/<newuser/ 
    $ sudo adduser newuser --disable-password

2.  Create a `.ssh` directory for the `authorized_keys` file.
    $ cd /home/<newuser>
    $ mkdir .ssh
    $ touch .ssh/authorized_keys

3.  Change the file permissions of the `.ssh`directory and authorised_keys
    $ chown -R <newuser>:<newuser> /home/.ssh
    # without these exact file permissions, you will not be able to log into this account using SSH.
    $ chmod 700 .ssh
    $ chmod 600 .ssh/authorized_keys

4.  Enter the user's public ssh key in the authorized_keys filename:

      `
      ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQClKsfkNkuSevGj3eYhCe53pcjqP3maAhDFcvBS7O6V
      hz2ItxCih+PnDSUaw+WNQn/mZphTk/a/gU8jEzoOWbkM4yxyb/wB96xbiFveSFJuOp/d6RJhJOI0iBXr
      lsLnBItntckiJ7FbtxJMXLvvwJryDUilBMTjYtwB+QhYXUMOzce5Pjz5/i8SeJtjnV3iAoG/cQk+0FzZ
      qaeJAAHco+CY/5WrUBkrHmFJr6HcXkvJdWPkYQS3xqC0+FmUZofz221CBt5IMucxXPkX4rWi+z7wB3Rb
      BQoQzd8v7yeb7OzlPnWOyN0qFU0XA246RA8QFYiCNYwI3f05p6KLxEXAMPLE
      `
Remove user
----------

    # remove the user, it's home directory and mail spool
    $sudo userdel -r olduser
    # remove the user but keep it's home directory and mail spool
    $sudo userdel olduser

log as user
----------
    $ sudo su - user  // the `-` triggers a login shell
