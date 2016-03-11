AIDE GESTION DE RESEAU
=====================

Exploration Adresses IP
======================

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

Tcpdump
=======

Description
-----------
tcpdump est un outil d’analyse des paquets transitant sur le réseau. Ses possibilités sont très étendues et en font un outil de base pour l’analyse permettant de résoudre les problèmes
réseau et de sécurité. Il peut aussi être utile simplement parce que vous êtes intéressé d’examiner ce qui transite sur votre réseau. On verra aussi qu’il est possible de sauvegarder
les paquets filtrés par tcpdump pour les relire sur une machine équipée de Wireshark. L’avantage est évidemment de pouvoir profiter de la lisibilité que donne une application graphique.

On peut passer à tcpdump un certain nombre d’options et des expressions booléennes. Les options agissent sur la façon dont seront représentés les paquets une fois que ceux-ci auront été
capturés. Les expressions permettent de ne capturer que les paquets qui nous intéressent. Ces expressions peuvent être combinées au moyen d’opérateur booléens (and, or,…) pour former un
filtre qui ne laissera passer que les paquets désirés.

### Installation
  $ sudo aptitude install tcpdump


### Options
  -i ethx spécifie sur quelle interface se fait la capture
  -X affiche le contenu du paquet en hexa et ascii
  -n pas de résolution des noms, on affiche l’adresse IP
  -nn pas de résolution des noms ni des ports
  -s0 indique qu’on capture le paquet entier
  -cx on capture seulement x paquets
  -v, -vv, -vvv augmente le nombre d’infos sur les paquets qui sont affichés
  -w file écrit les paquets raw dans un fichier plutôt que d’être traités et affichés

  **Exemple**: sudo tcpdump -Xvvn //rafraîchissez la page dans votre navigateur et observez.

### Expressions
Les expressions associées aux opérations booléennes permettent d’effectuer un puissant filtrage sur les paquets et en fin de compte de n’afficher que ce qui vous intéresse.

  tcpdump host 192.168.8.1 -> host permet de spécifier une adresse IP ou un nom d’hôte
  tcpdump dst 192.168.8.1 -> src, dst spécifie une adresse IP source ou destination
  tcpdump net 192.168.8.0/24 -> net spécifie un réseau (notation CIDR)
  tcpdump port 80 -> port spécifie un port sur lequel la capture se fera (peut être combiné avec src ou dst)
  tcpdump src port 80
  tcpdump icmp -> proto spécifie le protocole utilisé (tcp, udp, and icmp)
  sudo tcpdump -Xvvnn src 192.168.8.10 and dst 192.168.8.1 -> filtrage avec des opérateurs booleansi: and (ou &&), or (ou ||), not (ou !)
  sudo tcpdump 'src 192.168.8.10 and (dst port 110 or 25)' -> filtrage avec des opérateurs booleansi: and (ou &&), or (ou ||), not (ou !)
  
### flags TCP
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

### Exploitation avec Wireshark
Il est possible d’enregistrer les paquets capturés dans un fichier et ainsi de les analyser plus tard, sur une autre machine éventuellement, avec Wireshark et de bénéficier des avantages
d’une représentation graphique des paquets. On utilisera cette méthode, par exemple, lorsque l’on doit analyser les paquets arrivant sur un serveur ne disposant pas d’interface graphique
permettant de faire tourner Wireshark.

$ sudo tcpdump -Xvvnns0 port 80 -w dump.cap -> enregistre les paquets dans le fichier dump.cap
$ wireshark -r dump.cap -> Analyse le fichier outputé par tcpdump dans WireShark



