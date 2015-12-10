Analyse réseau avec tcpdump
tcpdump est un outil d’analyse des paquets transitant sur le réseau. Ses possibilités sont très étendues et en font un outil de base pour l’analyse permettant de résoudre les problèmes réseau et de sécurité. Il peut aussi être utile simplement parce que vous êtes intéressé d’examiner ce qui transite sur votre réseau. On verra aussi qu’il est possible de sauvegarder les paquets filtrés par tcpdump pour les relire sur une machine équipée de Wireshark. L’avantage est évidemment de pouvoir profiter de la lisibilité que donne une application graphique.

On peut passer à tcpdump un certain nombre d’options et des expressions booléennes. Les options agissent sur la façon dont seront représentés les paquets une fois que ceux-ci auront été capturés. Les expressions permettent de ne capturer que les paquets qui nous intéressent. Ces expressions peuvent être combinées au moyen d’opérateur booléens (and, or,…) pour former un filtre qui ne laissera passer que les paquets désirés.

Avant de pouvoir utiliser tcpdump, il faut l’installer:

$ sudo aptitude install tcpdump
et il faut le lancer avec des droits d’administrations pour pouvoir avoir accès aux interfaces réseau.

Les options
-i ethx spécifie sur quelle interface se fait la capture
-X affiche le contenu du paquet en hexa et ascii
-n pas de résolution des noms, on affiche l’adresse IP
-nn pas de résolution des noms ni des ports
-s0 indique qu’on capture le paquet entier
-cx on capture seulement x paquets
-v, -vv, -vvv augmente le nombre d’infos sur les paquets qui sont affichés
-w file écrit les paquets raw dans un fichier plutôt que d’être traités et affichés
exemple:

$ sudo tcpdump -Xvvn
rafraîchissez la page dans votre navigateur et observez.

Les expressions
Les expressions associées aux opérations booléennes permettent d’effectuer un puissant filtrage sur les paquets et en fin de compte de n’afficher que ce qui vous intéresse.

host permet de spécifier une adresse IP ou un nom d’hôte:
ex: tcpdump host 192.168.8.1
src, dst spécifie une adresse IP source ou destination
ex: tcpdump dst 192.168.8.1
net spécifie un réseau (notation CIDR)
ex: tcpdump net 192.168.8.0/24
port spécifie un port sur lequel la capture se fera (peut être combiné avec src ou dst)
ex: tcpdump port 80

    tcpdump src port 80
proto spécifie le protocole utilisé (tcp, udp, and icmp)
ex: tcpdump icmp
Les opérateurs logiques
and (ou &&)
or (ou ||)
not (ou !)
Pour les opérations complexes avec des parenthèses, les options doivent être encadrées par des apostrophes.

exemples:

$ sudo tcpdump -Xvvnn src 192.168.8.10 and dst 192.168.8.1
$ sudo tcpdump 'src 192.168.8.10 and (dst port 110 or 25)'
Filtrage suivant les flags TCP
Il est possible aussi de filtrer en fonction des flags contenus dans l’entête TCP. Ces flags sont:

SYN-ACK ‘tcp[13] = 18′
FIN ‘tcp[13] & 1 != 0′
SYN ‘tcp[13] & 2 != 0′
RST ‘tcp[13] & 4 != 0′
PSH ‘tcp[13] & 8 != 0′
ACK ‘tcp[13] & 16 != 0′
URG ‘tcp[13] & 32 != 0′
Ceci signifie qu’on prend le 13ième octet dans l’entête TCP (tcp[13]). Chaque bit de cet octet représente un flag. On effectue ensuite une opération logique pour obtenir la valeur de ce bit et on le test par rapport à 0.

exemple:

$ sudo tcpdump 'tcp[13] & 2 != 0'
Exploitation des paquets avec Wireshark
Il est possible d’enregistrer les paquets capturés dans un fichier et ainsi de les analyser plus tard, sur une autre machine éventuellement, avec Wireshark et de bénéficier des avantages d’une représentation graphique des paquets. On utilisera cette méthode, par exemple, lorsque l’on doit analyser les paquets arrivant sur un serveur ne disposant pas d’interface graphique permettant de faire tourner Wireshark.

L’enregistrement des paquets se fait en utilisant l’option -w qui dit à tcpdump d’enregister les paquets bruts dans un fichier. Par exemple:

$ sudo tcpdump -Xvvnns0 port 80 -w dump.cap
Ensuite il ne reste plus qu’à analyser le fichier dump.cap dans Wireshark en le lançant avec le nom de fichier en argument:

$ wireshark -r dump.cap
Note: on peut évidemment aussi ouvrir le fichier en utilisant l’interface graphique de Wireshark mais comme tout le reste se fait dans un terminal, pourquoi ne pas lancer Wireshark directement depuis le terminal? Non?