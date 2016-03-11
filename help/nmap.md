---- Nmap Command help ----
===========================


** Description **
   Nmap is short for Network Mapper. It is an open source security tool
   for network exploration, security scanning and auditing. However, nmap
   command comes with lots of options that can make the utility more
   robust and difficult to follow for new users.

# 1: Scan a single host or an IP address (IPv4)

## Scan a single ip address 
nmap 192.168.1.1

## Scan a host name
nmap server1.cyberciti.biz

## Scan a host name with more info
nmap -v server1.cyberciti.biz


# 2: Scan multiple IP address or subnet (IPv4)

nmap 192.168.1.1 192.168.1.2 192.168.1.3
nmap 192.168.1.1,2,3
nmap 192.168.1.1-20
nmap 192.168.1.*
nmap 192.168.1.0/24

# 3: Read list of hosts/networks from a file (IPv4)

nmap -iL /tmp/test.txt

# 4: Excluding hosts/networks (IPv4)

nmap 192.168.1.0/24 --exclude 192.168.1.5
nmap 192.168.1.0/24 --exclude 192.168.1.5,192.168.1.254
nmap -iL /tmp/scanlist.txt --excludefile /tmp/exclude.txt

# 5: Turn on OS and version detection scanning script (IPv4)

nmap -A 192.168.1.254
nmap -v -A 192.168.1.1
nmap -A -iL /tmp/scanlist.txt

# 6: Find out if a host/network is protected by a firewall

nmap -sA 192.168.1.254
nmap -sA server1.cyberciti.biz

# 7: Scan a host when protected by the firewall

nmap -PN 192.168.1.1
nmap -PN server1.cyberciti.biz

# 8: Scan an IPv6 host/address

nmap -6 IPv6-Address-Here
nmap -6 server1.cyberciti.biz
nmap -6 2607:f0d0:1002:51::4
nmap -v A -6 2607:f0d0:1002:51::4

# 9: Scan a network and find out which servers and devices are up and running

nmap -sP 192.168.1.0/24

# 10: How do I perform a fast scan?

nmap -F 192.168.1.1

# 11: Display the reason a port is in a particular state

nmap --reason 192.168.1.1
nmap --reason server1.cyberciti.biz

# 12: Only show open (or possibly open) ports

nmap --open 192.168.1.1
nmap --open server1.cyberciti.biz

# 13: Show all packets sent and received

nmap --packet-trace 192.168.1.1
nmap --packet-trace server1.cyberciti.biz

# 14: Show host interfaces and routes

nmap --iflist

# 15: How do I scan specific ports?

nmap -p 80 192.168.1.1 // Scan port 80
nmap -p T:80 192.168.1.1 // Scan TCP port 80
nmap -p U:53 192.168.1.1 // Scan UDP port 53
nmap -p 80,443 192.168.1.1 // Scan two ports 
nmap -p 80-200 192.168.1.1 //Scan port ranges
nmap -p "*" 192.168.1.1 // Scan all ports with * wildcard 
nmap --top-ports 5 192.168.1.1 // Scan top ports i.e. scan $number most common ports
nmap --top-ports 10 192.168.1.1 // Scan top ports i.e. scan $number most common ports


# 16: The fastest way to scan all your devices/computers for open ports ever

nmap -T5 192.168.1.0/24

# 17: How do I detect remote operating system?

nmap -O 192.168.1.1
nmap -O  --osscan-guess 192.168.1.1
nmap -v -O --osscan-guess 192.168.1.1


# 18: How do I detect remote services (server / daemon) version numbers?

nmap -sV 192.168.1.1


# 19: Scan a host using TCP ACK (PA) and TCP Syn (PS) ping
// If firewall is blocking standard ICMP pings, try the following host discovery methods:
nmap -PS 192.168.1.1
nmap -PS 80,21,443 192.168.1.1
nmap -PA 192.168.1.1
nmap -PA 80,21,200-512 192.168.1.1

# 20: Scan a host using IP protocol ping

nmap -PO 192.168.1.1

# 21: Scan a host using UDP ping
// This scan bypasses firewalls and filters that only screen TCP:
nmap -PU 192.168.1.1
nmap -PU 2000.2001 192.168.1.1

# 22: Find out the most commonly used TCP ports using TCP SYN Scan
// Stealthy scan 
nmap -sS 192.168.1.1
// Not Stealthy scan
nmap -sT 192.168.1.1

nmap -sA 192.168.1.1 // Find out the most commonly used TCP ports using TCP ACK scan
nmap -sW 192.168.1.1 // Find out the most commonly used TCP ports using TCP Window scan<Paste>
nmap -sM 192.168.1.1 // Find out the most commonly used TCP ports using TCP Maimon scan

# 23: Scan a host for UDP services (UDP scan)

nmap -sU nas03
nmap -sU 192.168.1.1

# 24: Scan for IP protocol

nmap -sO 192.168.1.1

# 25: Scan a firewall for security weakness

nmap -sN 192.168.1.254 // TCP Null Scan to fool a firewall to generate a response Does not set any bits (TCP flag header is 0)
nmap -sF 192.168.1.254 //  TCP Fin scan to check firewall Sets just the TCP FIN bit 
nmap -sX 192.168.1.254 // TCP Xmas scan to check firewall Sets the FIN, PSH, and URG flags, lighting the packet up like a Christmas tree


# 26: Scan a firewall for packets fragments
// avoid detection using tiny ip packets
nmap -f 192.168.1.1
nmap -f fw2.nixcraft.net.in
nmap -f 15 fw2.nixcraft.net.in
nmap --mtu 32 192.168.1.1 // Set your own offset size with the --mtu option

# 27: Cloak a scan with decoys

nmap -n -Ddecoy-ip1,decoy-ip2,your-own-ip,decoy-ip3,decoy-ip4 remote-host-ip
nmap -n -D192.168.1.5,10.5.1.2,172.1.2.4,3.4.2.1 192.168.1.5

# 28: Scan a firewall for MAC address spoofing
 
nmap --spoof-mac MAC-ADDRESS-HERE 192.168.1.1 // Spoof your MAC address
nmap -v -sT -PN --spoof-mac MAC-ADDRESS-HERE 192.168.1.1 // more of the same
nmap -v -sT -PN --spoof-mac 0 192.168.1.1 // Use a random MAC address The number 0, means nmap chooses a completely random MAC address

