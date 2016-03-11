Monter un système de fichiers grâce à sshfs Il peut être intéressant de monter dans son propre système de fichiers un autre système de fichiers auquel on aurait accès via ssh. Cela permet
d’utiliser tous les outils dont on dispose dans son propre système pour accéder au système de fichiers distant.

La première chose à veiller est que fuse soit installé. Pour installer fuse et vous ajouter au groupe fuse, exécutez les deux commandes suivantes:

$ sudo aptitude install fuse-utils $ sudo adduser $USER fuse Ensuite, il faut installer sshfs proprement dit:

$ sudo aptitude install sshfs Maintenant que tout est installé, créez un répertoire où vous monterez le système de fichiers distants et utilisez la commande sshfs pour monter le système de
fichier:

$ mkdir distfs $ sudo login@serveur_distant:/path/ distfs Vous pouvez évidemment donner le nom que vous voulez au répertoire. distfs est juste un exemple. login est le login avec lequel vous
vous connectez au serveur distant via ssh et serveur_distant peut être un nom de domaine ou une adresse IP.

Lorsque vous avez fini de travailler avec le serveur distant, démontez le système de fichiers distant en utilisant la commande suivante:

$ fusermount -u distfs Comme vous pouvez le voir ci-dessus, une fois que sshfs est installé, c’est tout simple à utiliser et il peut vous rendre de grands services.
