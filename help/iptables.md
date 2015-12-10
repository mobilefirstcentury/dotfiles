Building a firewall for a Debian web server
This post addresses how to configure the Linux firewall to protect a Debian-based web application server. While there are GUI tools for the job, we will focus on the command-line tool iptables.

The scenario is that you have just installed Debian (or Ubuntu) on a server connected to the Internet. This will be used as a web server hosting your WordPress blog. I assume that you already have Apache, and WordPress installed. Please refer to my earlier post for instructions on how to install WordPress on Debian.

Basic Requirements

Before we build the firewall, let's write down the basic requirements - the types of traffic the machine will accept and those it will drop.

Accept all outbound traffic (from server to the Internet).
Accept all traffic from the loopback(lo) interface, which is necessary for many applications.
Accept inbound ssh logins.
Accept inbound Web requests.
Accept inbound ping requests.
Log firewall-specific warnings.
Build firewall

Please follow the order of the steps below. The procedural order is designed to minimize the chance of locking yourself out by mis-configuring the firewall.

Log in to the server either on the physical console or remotely via ssh.
The physical console is better because then you don't need to worry about being locked out. However, it is not always possible to access the console because the machine may be sitting afar in a data center.

Examine the current firewall configuration.

$ sudo iptables -L
Chain INPUT (policy ACCEPT)
target  prot opt source  destination         

Chain FORWARD (policy ACCEPT)
target  prot opt source  destination         

Chain OUTPUT (policy ACCEPT)
target  prot opt source  destination         
Note the policies for INPUT, FORWARD, and OUTPUT. The typical default firewall is configured to accept all traffic, both inbound and outbound.

Flush the firewall.
Flush only if:

your firewall is not 'clean' - it has existing rules, and
the INPUT policy is ACCEPT.
If the INPUT policy is not ACCEPT, you can make it so like this:


$ sudo iptables -P INPUT ACCEPT
To flush the firewall:


$ sudo iptables -F
Now, we are ready to add the firewall rules, one by one. Note that they comprise the basic rules to satisfy our stated requirements. Not included are specific rules to thwart common Internet attacks.

Add rule # 1.

$ sudo iptables -I INPUT 1 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
The above rule accepts any incoming traffic that is part of, or related to, an existing connection. If you are currently logged in via a remote ssh session, this rule prevents you from being locked out. So, it is important that you create it first.

Add rule # 2.

$ sudo iptables -I INPUT 2 -i lo -j ACCEPT
This rule accepts all traffic from the loopback interface (localhost/127.0.0.1).

Add rule # 3.

$ sudo iptables -I INPUT 3 -m conntrack --ctstate NEW -p tcp --syn --dport 80 --j ACCEPT
This rule accepts all new incoming WordPress connections to port 80.

Add rule # 4.

$ sudo iptables -I INPUT 4 -m conntrack --ctstate NEW -p tcp --syn --dport 22 --j ACCEPT
Rule # 4 accepts all new incoming ssh sessions to port 22.

Add rule # 5.

$ sudo iptables -I INPUT 5 -p icmp --icmp-type echo-request -m limit --limit 2/second -j ACCEPT
This rule accepts incoming ping echo requests at the maximum rate of 2 requests per second.

Add rule # 6.

$ sudo iptables -I INPUT 6 -m limit --limit 2/min  -j LOG --log-prefix "INPUT:DROP:" --log-level 6
All incoming traffic that are not accepted by any prior rule get logged at a maximum rate of 2 entries per minute. The default log file is /var/log/messages. For easy identification, the log entries are prefixed with the string 'Input:Drop:'.

Change default INPUT and FORWARD policies to DROP.
With the policy change, all incoming traffic not explicitly accepted by any of the above rules are dropped.


$ sudo iptables -P INPUT DROP
$ sudo iptables -P FORWARD DROP
Your basic firewall is complete. You can view the newly created firewall rules via the following:


   $ sudo iptables -v -L
Chain INPUT (policy DROP 147 packets, 51908 bytes)
 pkts bytes target     prot opt in     out     source               destination         
 1304  487K ACCEPT     all  --  any    any     anywhere             anywhere             ctstate RELATED,ESTABLISHED
    0     0 ACCEPT     all  --  lo     any     anywhere             anywhere            
    0     0 ACCEPT     tcp  --  any    any     anywhere             anywhere             ctstate NEW tcp dpt:httpflags: FIN,SYN,RST,ACK/SYN
    0     0 ACCEPT     tcp  --  any    any     anywhere             anywhere             ctstate NEW tcp dpt:sshflags: FIN,SYN,RST,ACK/SYN
    0     0 ACCEPT     icmp --  any    any     anywhere             anywhere             icmp echo-request limit: avg 2/sec burst 5
    9  2954 LOG        all  --  any    any     anywhere             anywhere             limit: avg 2/min burst 5 LOG level info prefix "INPUT:DROP:"

Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         

Chain OUTPUT (policy ACCEPT 198 packets, 31420 bytes)
 pkts bytes target     prot opt in     out     source               destination
Save firewall

The firewall that you just created will not persist. If you reboot the server, the firewall will revert to the default configuration - accept all traffic - before you made all the above modifications. To save the firewall changes permanently,

Install iptables-persistent package.

$ sudo apt-get install iptables-persistent
Make an explicit save.
After you finish modifying the firewall, you need to explicitly save the firewall configuration in the file /etc/iptables/rules.v4 using the command below.


$ sudo sh -c "iptables-save > /etc/iptables/rules.v4"
Custom log file

The above firewall logs all dropped incoming traffic to the general system log file /var/log/messages. To avoid cluttering the file, I recommend sending the iptables-related log entries to a separate file, say /var/log/iptables.log. This is possible because iptables-related log entries are prefixed with a custom identifier - 'INPUT:DROP:'.

Create a rsyslog rule to redirect firewall log entries.
A new file /etc/rsyslog.d/10-iptables.conf is created to hold the rsyslog rule.


$ cat > /etc/rsyslog.d/10-iptables.conf
:msg, contains, "INPUT:DROP:" -/var/log/iptables.log
& ~
The first line in the file specifies that if a log entry contains the custom identifier, it is sent to /var/log/iptables.log.

The second line skips forward to the next log entry, thereby preventing double logging into /var/log/messages.

Restart rsyslog daemon.

$ sudo service rsyslog restart
