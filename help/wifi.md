---- Wifi Network User Guide ----
===================================



stop and start wifi interface
----------------------------
  $ sudo ifconfig wlan0 down
  $ sudo ifconfig wlan0 up

restart network functions
------------------------
  $ sudo service network-manager restart
  # or without sudo rights 
  $ mfcNetworkRestart

end power management of wifi card (buggy on ubuntu)
--------------------------------------------------
  $ iwconfig wlan0 power off  


start power management of wifi card (not advised)
--------------------------------------------------
  $ iwconfig wlan0 power up

list network interfaces with logical names
-------------------------------------------
  $ sudo lshw -C network
  # or 
  $ sudo lshw -C network | grep -i logi             


Connect to WP1/WPA2 Wifi from CLI
--------------------------------

### tools
  - wpa_supplicant: connect to WPA/WPA2 network
  - iw: find Wifi device name, scan access points
  - ip: enable/disable devices and find general network interface information
  - ping: pong ...

1. Find out the wireless device name.
  $ iw dev                                      | show wireless netword interfaces    
    ->                                          
    phy#0                                       | system has one physical card designated as phy#0
      Interface wlan0                           | the device name is wlan0
        ifindex 3
        type managed                            | `managed` means it's a wifi station or a client that connects to an access point

  

2. Check that the wireless device is up.
  $ ip link show wlan0
    -> 
    3: wlan0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP mode DORMANT group default qlen 1000
        link/ether 0c:8b:fd:bf:90:37 brd ff:ff:ff:ff:ff:ff
  # the device is UP is the key "UP" appears inside brakets on the first line
  # if it's not the case, you can...

3. bring the device up 
  $ sudo ip link set wlan0 up  
  # this needs root password

4. Check the connection status.
  $ /sbin/iw wlan0 link
    ->
    Not connected.

5. Scan wifi networks
  $ sudo iw wlan0 scan | grep SSID
    ->
    BSS 00:14:d1:9c:1f:c8 (on wlan0)
            ......
      freq: 2412
      SSID: gorilla                                     
      RSN:	 * Version: 1                       # The security protocol, here RSN (commonly referred to as WPA2), is important because it determines whhat tool to use
        * Group cipher: CCMP
        * Pairwise ciphers: CCMP
        * Authentication suites: PSK
        * Capabilities: (0x0000)
            ......


6. Connect to WPA/WPA2 WiFi network.
This is a 2 step process. First, you generate a configuration file for wpa_supplicant that contains the pre-shared key ("passphrase") for the WiFi network.

$ sudo -s
[sudo] password for peter: 
$ wpa_passphrase gorilla >> /etc/wpa_supplicant.conf 
...type in the passphrase and hit enter...
wpa_passphrase takes the SSID as the single argument. You must type in the passphrase for the WiFi network gorilla after you run the command. Using that information, wpa_passphrase will output the necessary configuration statements to the standard output. Those statements are appended to the wpa_supplicant configuration file located at /etc/wpa_supplicant.conf.

Note: you need root privilege to write to /etc/wpa_supplicant.conf.

$ cat /etc/wpa_supplicant.conf 
# reading passphrase from stdin
network={
	ssid="gorilla"
	#psk="testtest"
	psk=4dfe1c985520d26a13e932bf0acb1d4580461dd854ed79ad1a88ec221a802061
}
The second step is to run wpa_supplicant with the new configuration file.

$ sudo wpa_supplicant -B -D wext -i wlan0 -c /etc/wpa_supplicant.conf
-B means run wpa_supplicant in the background.

-D specifies the wireless driver. wext is the generic driver.

-c specifies the path for the configuration file.

Use the iw command to verify that you are indeed connected to the SSID.

$ /sbin/iw wlan0 link
Connected to 00:14:d1:9c:1f:c8 (on wlan0)
	SSID: gorilla
	freq: 2412
	RX: 63825 bytes (471 packets)
	TX: 1344 bytes (12 packets)
	signal: -27 dBm
	tx bitrate: 6.5 MBit/s MCS 0

	bss flags:	short-slot-time
	dtim period:	0
	beacon int:	100
Obtain IP address by DHCP
$ sudo dhclient wlan0
Use the ip command to verify the IP address assigned by DHCP. The IP address is 192.168.1.113 from below.

$ ip addr show wlan0
3: wlan0:  mtu 1500 qdisc mq state UP qlen 1000
    link/ether 74:e5:43:a1:ce:65 brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.113/24 brd 192.168.1.255 scope global wlan0
    inet6 fe80::76e5:43ff:fea1:ce65/64 scope link 
       valid_lft forever preferred_lft forever
Add default routing rule.
The last configuration step is to make sure that you have the proper routing rules.

$ ip route show
192.168.1.0/24 dev wlan0  proto kernel  scope link  src 192.168.1.113 
The above routing table contains only 1 rule which redirects all traffic destined for the local subnet (192.168.1.x) to the wlan0 interface. You may want to add a default routing rule to pass all other traffic through wlan0 as well.

$ sudo ip route add default via 192.168.1.254 dev wlan0
$ ip route show
default via 192.168.1.254 dev wlan0 
192.168.1.0/24 dev wlan0  proto kernel  scope link  src 192.168.1.113 
ping external ip address to test connectivity
$ ping 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_req=1 ttl=48 time=135 ms
64 bytes from 8.8.8.8: icmp_req=2 ttl=48 time=135 ms
64 bytes from 8.8.8.8: icmp_req=3 ttl=48 time=134 ms
^C
--- 8.8.8.8 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2000ms
rtt min/avg/max/mdev = 134.575/134.972/135.241/0.414 ms
The above series of steps is a very verbose explanation of how to connect a WPA/WPA2 WiFi network. Some steps can be skipped as you connect to the same access point for a second time. For instance, you already know the WiFi device name, and the configuration file is already set up for the network. The process needs to be tailored according to your situation.
