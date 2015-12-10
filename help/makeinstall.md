Comment compiler soi-même une application
Beaucoup de gens ont peur de devoir compiler une application. Je reconnais que c’est une opération à ne pas conseiller. Sous Ubuntu, la méthode recommandée pour installer une application est de passer par Synaptic pour installer un paquet qui se trouve dans les dépôts officiels d’Ubuntu. Un paquet comprend l’application précompilée pour ubuntu et toutes ses dépendances au sens large. En ligne de commande, vous utiliserez apt-get ou aptitude.
Mais il est des situations où il peut être intéressant de compiler soi-même une application. C’est le cas par exemple lorsque l’application que vous voulez utiliser a un bug et que vous savez que la nouvelle version corrige ce bug. malheureusement pour vous, cette nouvelle version ne se trouve pas encore dans les dépôts d’Ubuntu. La solution dans ce cas-là est de télécharger le code source de l’application et de la compiler vous-même.

Pour illustrer cet article, je vous propose de compiler une application qui s’appelle tabu et qui ne se trouve pas dans les dépôts. Tabu est un lecteur audio basé sur gstreamer. Il ressemble à ceci:

tabu - audio player

La première chose à faire est de télécharger l’archive contenant les sources du programmes. Dans le cas de tabu, les sources sont dans un fichier téléchargeable à cette adresse:
http://www.kalmbach.com.ar/download/tabu_audio_player-1.4.1.tar.gz

Pour télécharger l’archive et la décompresser, tapez ceci dans un terminal:

$ wget -c http://www.kalmbach.com.ar/download/tabu_audio_player-1.4.1.tar.gz
$ tar -zxvf tabu_audio_player-1.4.1.tar.gz
La commande tar a créé un répertoire tabu_audio_player-1.4.1 à l’endroit où vous avez téléchargé cette archive. Ce répertoire contient les sources du programmes plus un certain nombre de fichier nécessaire à la compilation de l’application. Lisez aussi les fichiers README et INSTALL. Ce dernier en général, contient les instructions données par l’auteur de l’application pour compiler le programme. Dans ce cas-ci, on peut y lire que le programme nécessite les classiques configure + make + make install.

Avant de pouvoir compiler le programme, il faut que les outils de compilation soient installés. Si ce n’est pas le cas, installez-les en faisant:

$ sudo aptitude install build-essentials
Commençons la compilation. La première chose à faire est de lancer configure qui va tester si toutes les librairies dont a besoin le programme sont présentes sur votre PC et donnera une erreur dans le cas contraire. Il permet aussi de définir certains paramètres.
Comme je veux que le programme soit installé dans /opt/tabu, /opt étant l’endroit où j’installe tous les programmes que je compile ou qui ne viennent pas des dépôts officiels, on peut ajouter à la commande configure un paramètre auquel on donne le répertoire où le programme doit être installé.
Rendons-nous dans le répertoire où se trouvent les sources et lançons la configuration:

$ cd tabu_audio_player-1.4.1
$ ./configure --prefix=/opt/tabu
On peut voir que le programme configure teste un tas de choses. Ce sont toutes les lignes checking… Mais à la fin, on peut lire ceci:

checking for GSTREAMER... configure: error: Package requirements (gstreamer-0.10 >= 0.10) were not met:

No package 'gstreamer-0.10' found

Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.

Alternatively, you may set the environment variables GSTREAMER_CFLAGS
and GSTREAMER_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.
Zut, une erreur! Il semble qu’il ne trouve pas gstreamer-0.10. Pourtant gstreamer est un des éléments de base de Gnome pour tout ce qui est multimédia. C’est par exemple, gstreamer qui est utilisé par Totem.
En réalité gstreamer est bien installé mais pour pouvoir compiler tabu, le compilateur a besoin de la version de développement qui contient les fichiers d’entêtes de gstreamer. Autrement dit, si configure râle sur une version d’un programme manquant, c’est en général parce qu’il ne trouve pas la version de développement. Un petit tour par Synaptic nous apprend qu’effectivement, libgstreamer0.10-dev n’est pas installée. Installons-la et relançons configure:

$ sudo aptitude install libgstreamer0.10-dev
$ ./configure --prefix=/opt/tabu
configure re-teste tout et…à la fin, il nous donne une autre erreur:

checking for TAGLIB... configure: error: Package requirements (taglib_c >= 1.5) were not met:

No package 'taglib_c' found

Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.

Alternatively, you may set the environment variables TAGLIB_CFLAGS
and TAGLIB_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.
Manifestement, il lui manque une librairie taglibc ou quelque chose d’approchant. Un petit tour dans Synaptic nous montre qu’il existe un ensemble de librairies qui portent le noms de libtag* dont une est une version de développement libtagc0-dev. Lorsque vous choisissez installer, Synaptic vous dit qu’il doit aussi installer libtag1-dev et libtagc0 pour que les dépendances soient respectées. Suivons les recommandations de Synaptic et relançons configure une troisième fois:

$ sudo aptitude install libtagc0-dev libtag1-dev libtagc0
$ ./configure --prefix=/opt/tabu
Cette fois-ci, plus d’erreur. configure est content:

Tabu 1.4.1 configuration summary:

        prefix                   : /opt/tabu
        source code location     : .
        compiler                 : gcc
        compiler flags           : -g -O2 -Wall
	      debug support            : no
Maintenant que tout est en ordre, que toutes les librairies nécessaires sont installées, il ne reste plus qu’à compiler le programme. Ceci se fait avec la commande make:

$ make
En principe tout doit bien se passer et vous ne devez pas avoir de message d’erreur. Dans le cas de tabu, la compilation est rapide mais ce n’est pas toujours le cas. Recompiler un noyau par exemple peut prendre d’une demi-heure à plusieurs heures suivant la palteforme et les options demandées.
Le programme étant compilé, on peut maintenant l’installer dans son répertoire /opt/tabu. Ceci se réalise avec la commande make install et doit se faire avec des droits d’administration:

$ sudo make install
Dans le répertoire /opt/tabu, make install a créé un répertoire bin dans lequel se trouve l’exécutable et un répertoire share qui contient le fichier applications/tabu.desktop qui est le fichier nécessaire pour créer une entrée dans le menu Applications de Gnome. Editez-le avec gedit et modifiez les lignes suivantes de façon à ce qu’elle contiennent ceci:

Exec=/opt/tabu/bin/tabu
Icon=/opt/tabu/share/pixmaps/tabu.png
Ensuite copier ce fichier dans /usr/shar/applications:

$ sudo cp /opt/tabu/share/applications/tabu.desktop /usr/share/applications
Voilà, votre application est compilée et une entrée se retrouve dans le menu Audio et vidéo.