Allow root ssh login with public key authentication only
Often, ssh is configured to disallow root to login directly. To login, root first logins as a non-privileged user, and then do a sudo to become root.

There can be many reasons why you don't want root to login directly. You may be concerned about security. Brute force attacks by guessing the password are common. In addition to security, you may be concerned about traceability. If there are more than 1 administrator on a system, and they can all login as root, then it is impossible to trace who had done what (after all, it is the same root account).

As an alternative, we can configure sshd such that root can remote login directly, but only with public key authentication. From the security perspective, public key authentication offers much better protection than password. If being able to trace the user is not that important (say there is only 1 root user), then you may wish to consider such a configuration. Note: remote login by root using password authentication is still disallowed.

As root, edit the sshd daemon configuration file (/etc/ssh/sshd_config).
Modify the PermitRootLogin and the PubkeyAuthentication parameters to have the following values.
PermitRootLogin without-password
PubkeyAuthentication yes
Restart the sshd daemon.
$ service sshd restart
