Obtenir des infos sur le matériel de son PC
Lorsque l’on veut connaître les composants de son PC, on utilise en général les commandes bien connues lspci et lshw.

lspci
Par exemple, pour connaitre le modèle de sa carte vidéo, on peut utiliser la commande suivante:

$ lspci | grep -i vga
01:00.0 VGA compatible controller: nVidia Corporation NV31 [GeForce FX 5600XT] (rev a1)
On voit ainsi que sur le PC sur lequel je tape cet article, la carte graphique est une nvidia pas toute neuve.
De même, pour connaître le modèle de sa carte réseau ou son, on taperait les commandes suivantes:

$ lspci | grep -i ethernet
$ lspci | grep -i audio
lshw
lshw vous donne par contre une description sous forme arborescente de votre PC qui est bien plus détaillée que lspci. Ainsi, lshw vous détaillera les différentes banques de mémoires, vous dira si elle sont occupées, fera de même avec chaque slot pci en vous précisant quelle carte l’occupe et tout cela en donnant moult renseignements.
Cette commande est beaucoup plus complète que lspci mais plus difficile à manipuler. Elle s’utilise ainsi:

$ sudo lshw
dmidecode
Il existe néanmoins une troisième méthode pour obtenir des renseignements sur son hardware et c’est celle-là que je voudrais vous présenter particulièrement. Il s’agit de la commande dmidecode qui utilise les renseignements se trouvant dans les tables du BIOS (DMI = Desktop Management Interface). Ces tables, d’après la page de manuel, contiennent une description du matériel composant le PC. La différence avec une commande comme lshw ou lspci est que les renseignements viennent du BIOS et pas d’une interrogation des composants du PC.

Le BIOS contient différentes tables décrivant chacune un élément (type) particulier du matériel. Il suffit pour en obtenir la description de donner à dmidecode le type voulu. Voyons quelques uns des types disponibles. Pour les autres, je vous renvoie à la page de manuel.

0 BIOS: donne des rensignements sur le BIOS lui-même et ce qu’il supporte
1 System: donne des renseignements sur le fabricant du PC et son vendeur
2 Base Board: donne des rensignements sur la carte mère (marque, type, version…)
…
4 Processor: comme son nom l’indique donne des renseignements sur les processeurs
…
5 Memory Modules: donne le nombre de banques de mémoire, si elles sont utilisées, avec quel type de barette mémoire, la taille etc…
…
10 On Board Devices: liste les composants faisant éventuellement partie de la carte mère (ethernet, chipset audio…)
…
En tout, il y a 39 types différents.

Pour pouvoir utiliser dmidecode, il faut d’abord l’installer si ce n’est déjà fait:

$ sudo aptitude install dmidecode
Une fois installé, pour obtenir des renseignements sur sa carte mère par exemple, il suffit de taper ceci:

$ sudo dmidecode -t 2
# dmidecode 2.9
SMBIOS 2.3 present.

Handle 0x0002, DMI type 2, 8 bytes
Base Board Information
	Manufacturer: ASUSTeK Computer Inc.
	Product Name: P4P800SE
	Version: Rev 2.xx
	Serial Number: MB-1234567890
On peut également fournir à dmidecode un mot-clef plutôt qu’un numéro de type. Les mots-clef reconnus par dmidecode sont:

bios
system
baseboard
chassis
processor
memory
cache
connector
slot
$ sudo dmidecode -t connector
Cette commande liste tous les connecteurs présents sur la carte mère (souris, clavier, usb, lpt, com, midi, joystick, audio, ethernet, firewire, IDE, SATA, floppy, ventilateurs, alimentation …)

Cette brêve présentation de dmidecode montre que cette commande donne des renseignements que lspci et lshw ne donnent pas. En ce sens, ces trois commandes sont complémentaires et doivent être utilisées conjointement si vous voulez une description complète de tout le matériel de votre PC.