---- network tools ----
======================


Exploration Adresses IP
-----------------------

  $ ip addr                                  ->  affiche toutes les interfaces réseau
  $ ip -d link show                          ->  affichent les links réseaux sur une machine
  $ brctl show                               ->  affiche les networks bridges sur une machine
  $ cat /proc/sys/net/ipv4/ip_forward        ->  affiche l'état de l'ip-forwarding (1: actif, 0:inactif)
  $ echo [0|1] /proc/sys/net/ipv4/ip_forward ->  active ou désactive l'ip forwarding
  $ iptable -L                               ->  affiche la configuration iptable
  $ iptables -t nat -L                       ->  affiche la configuration NAT
  $ route                                    ->  show networking routes
  $ ifconfig eth0 down                       ->  bring down interface eth0
  $ ifconfig                                 ->  shows all interfaces


Iptraf 
------

Iptraf is an ncurses-based IP LAN monitoring tool that shows individual connections and the amount of data flowing between the hosts.

### install
  $ sudo apt-get install iptraf

### use 
Once `iptraf` has been installed, issue the following command:

  $ sudo iptraf

Vnstat 
------

Vnstat is different from most of the other tools. It is a console-based network traffic monitor for Linux that runs as a daemon and keeps a log of network traffic for the selected interface.
It can be used to generate a report of the network usage.

### install
  $ sudo apt-get install vnstat

### use 
  $ sudo vnstat               #  display total amount of data transfer on your network.
  $ sudo vnstat -l            #  monitor the bandwidth usage in realtime. display the total bandwidth used by incoming and outgoing data.
  $ sudo vnstat -l -i wlan0   # monitor the bandwidth usage on the `wlan0 interface`


Speedometer 
-----------

Speedometer is a command line utility that can be used to monitor the current download/upload speeds of the network connections and the speeds of the file systems.
Speedometer shows a graph of your current and past network speed in your console. 
You can also use speedometer directly on a file to monitor the download performance and history of a specific download instead of all the network traffic.

### install 
  $ sudo apt-get install speedometer

### use

  $ sudo speedometer -r wlan0 -t wlan0     # display output similar to the following.

Iftop 
-----
Iftop is a command line tool that listens to network traffic on a given interface (such as eth0, eth1, wlan0) and shows a table of current bandwidth usage by hosts.
Iftop uses the pcap library to capture the incoming and outgoing packets of the network interface.

### install
  $ sudo apt-get install iftop

### use

  $ sudo iftop -n        # `n` option that prevents iftop from resolving ip addresses to hostname:



ifconfig
--------
The ifconfig command has a variety of options to configure, tune, and debug your system’s network interfaces. It’s also a quick way to view IP addresses and other network interface information. Type ifconfig to view the status of all currently active network interfaces, including their names. You can also specify an interface’s name to view only information about that interface.

### use 
  $ ifconfig
  $ ifconfig eth0
  $ ifconfig wlan0

ifdown & ifup
-------------
The ifdown and ifup commands are the same thing as running ifconfig up or ifconfig down.


### use 
  $ sudo ifdown eth0    # activate interface
  $ sudo ifup eth0      # deactivate interface

[TODO] vérifier l'affirmation ci-dessous
  Try this on a Linux desktop system and you’ll probably get an error message.
  Linux desktops usually use NetworkManager, which manages network interfaces for you.
  These commands will still work on servers without NetworkManager, though.
  If you really need to configure NetworkManager from the command line, use the nmcli command.

dhclient
---------
The dhclient command can release your computer’s IP address and get a new one from your DHCP server.

### use 
  $ sudo dhclient -r         # get a new IP address
  $ sudo dhclient            # release current IP Address



Tcpdump
---------

### Description
tcpdump est un outil d’analyse des paquets transitant sur le réseau. Ses possibilités sont très étendues et en font un outil de base pour l’analyse permettant de résoudre les problèmes
réseau et de sécurité. Il peut aussi être utile simplement parce que vous êtes intéressé d’examiner ce qui transite sur votre réseau. On verra aussi qu’il est possible de sauvegarder
les paquets filtrés par tcpdump pour les relire sur une machine équipée de Wireshark. L’avantage est évidemment de pouvoir profiter de la lisibilité que donne une application graphique.

On peut passer à tcpdump un certain nombre d’options et des expressions booléennes. Les options agissent sur la façon dont seront représentés les paquets une fois que ceux-ci auront été
capturés. Les expressions permettent de ne capturer que les paquets qui nous intéressent. Ces expressions peuvent être combinées au moyen d’opérateur booléens (and, or,…) pour former un
filtre qui ne laissera passer que les paquets désirés.

#### Installation
  $ sudo aptitude install tcpdump


#### Options
  -i ethx spécifie sur quelle interface se fait la capture
  -X affiche le contenu du paquet en hexa et ascii
  -n pas de résolution des noms, on affiche l’adresse IP
  -nn pas de résolution des noms ni des ports
  -s0 indique qu’on capture le paquet entier
  -cx on capture seulement x paquets
  -v, -vv, -vvv augmente le nombre d’infos sur les paquets qui sont affichés
  -w file écrit les paquets raw dans un fichier plutôt que d’être traités et affichés

  **Exemple**: sudo tcpdump -Xvvn //rafraîchissez la page dans votre navigateur et observez.

#### Expressions
Les expressions associées aux opérations booléennes permettent d’effectuer un puissant filtrage sur les paquets et en fin de compte de n’afficher que ce qui vous intéresse.

  tcpdump host 192.168.8.1 -> host permet de spécifier une adresse IP ou un nom d’hôte
  tcpdump dst 192.168.8.1 -> src, dst spécifie une adresse IP source ou destination
  tcpdump net 192.168.8.0/24 -> net spécifie un réseau (notation CIDR)
  tcpdump port 80 -> port spécifie un port sur lequel la capture se fera (peut être combiné avec src ou dst)
  tcpdump src port 80
  tcpdump icmp -> proto spécifie le protocole utilisé (tcp, udp, and icmp)
  sudo tcpdump -Xvvnn src 192.168.8.10 and dst 192.168.8.1 -> filtrage avec des opérateurs booleansi: and (ou &&), or (ou ||), not (ou !)
  sudo tcpdump 'src 192.168.8.10 and (dst port 110 or 25)' -> filtrage avec des opérateurs booleansi: and (ou &&), or (ou ||), not (ou !)
  
#### flags TCP
Il est possible aussi de filtrer en fonction des flags contenus dans l’entête TCP. Ces flags sont:
On peut prendre le 13ième octet dans l’entête TCP (tcp[13]), dont chaque octet représente un flag, et faire un test bitwise sur ses flags.

  SYN-ACK ‘tcp[13] = 18′
  FIN ‘tcp[13] & 1 != 0′
  SYN ‘tcp[13] & 2 != 0′
  RST ‘tcp[13] & 4 != 0′
  PSH ‘tcp[13] & 8 != 0′
  ACK ‘tcp[13] & 16 != 0′
  URG ‘tcp[13] & 32 != 0′

  **exemple**: $ sudo tcpdump 'tcp[13] & 2 != 0'

#### Exploitation avec Wireshark
Il est possible d’enregistrer les paquets capturés dans un fichier et ainsi de les analyser plus tard, sur une autre machine éventuellement, avec Wireshark et de bénéficier des avantages
d’une représentation graphique des paquets. On utilisera cette méthode, par exemple, lorsque l’on doit analyser les paquets arrivant sur un serveur ne disposant pas d’interface graphique
permettant de faire tourner Wireshark.

$ sudo tcpdump -Xvvnns0 port 80 -w dump.cap -> enregistre les paquets dans le fichier dump.cap
$ wireshark -r dump.cap -> Analyse le fichier outputé par tcpdump dans WireShark

netstat
-------
[TODO] synthetiser ici le fichier ~help/netstat.md et le virer

