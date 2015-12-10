While nmap is better known for its port scanning capabilities, nmap is also very dependable for host discovery.

You can run nmap as either a non-root user, or root. nmap will only give non-root users the IP address of any host found.
$ nmap -sP 192.168.0.1-254

Starting Nmap 4.11 ( http://www.insecure.org/nmap/ ) at 2008-05-19 17:02 PDT
Host 192.168.0.1 appears to be up.
Host 192.168.0.100 appears to be up.
Host 192.168.0.103 appears to be up.
Nmap finished: 254 IP addresses (3 hosts up) scanned in 2.507 seconds


If you run nmap as root, you will also get the MAC address:
$ nmap -sP  192.168.0.1-254

Starting Nmap 4.11 ( http://www.insecure.org/nmap/ ) at 2008-05-19 18:06 PDT
Host 192.168.0.1 appears to be up.
MAC Address: 03:05:6D:2D:87:B3 (The Linksys Group)
Host 192.168.0.100 appears to be up.
MAC Address: 00:07:95:A9:3A:77 (Elitegroup Computer System Co. (ECS))
Host 192.168.0.103 appears to be up.
Nmap finished: 254 IP addresses (3 hosts up) scanned in 5.900 seconds 



-sP instructs nmap to only perform a ping scan to determine if the target host is up; no port scanning or operating system detection is performed.
By default, the -sP option causes nmap to send an ICMP echo request and a TCP packet to port 80.
