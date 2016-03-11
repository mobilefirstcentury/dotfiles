RTORRENT COMMANDS
================
**notes**:
  - rtorrent est un outil de téléchargement de torrents en mode console
  - Pour l'instant j'ai des problèmes de lenteur avec rtorrent surement liés à une mauvaise configueration.
  - Transmission [(voir plus bas)](#transmission)

COMMAND   | ACTION
---       | ---
backspace | Add torrent using an URL or file path. Use tab to view directory content and do auto-complete. Also, wildcards can be used. For example: ~/torrent/*
return    | Same as backspace, except the torrent remains inactive. (Use ^s to activate)
Ctrl-q    | Quit application
Ctrl-s    | Start download. Runs hash first unless already done.
Ctrl-d    | Stop an active download or remove a stopped download
Ctrl-k    | Stop and close the files of an active download.
Ctrl-r    | Initiate hash check of torrent. Starts downloading if file is not available.
Left      | Returns to the previous screen
Right     | Goes to the next screen
a/s/d     | Increase global upload throttle about 1/5/50 KB/s
A/S/D     | Increase global download throttle about 1/5/50 KB/s
z/x/c     | Decrease global upload throttle about 1/5/50 KB/s
Z/X/C     | Decrease global download throttle about 1/5/50 KB/s

# <a name="transmission"></a>Transmission

Action                                                                                                                      | Deccription
---                                                                                                                         | ---
transmission-gtk                                                                                                            | lance la version graphique de transmission
transmission-cli                                                                                                            | lance la version en ligne de commande de transmission
sudo transmission-daemon start                                                                                              | démarre la daemon transmission `(*)`
sudo transmission-daemon stop                                                                                               | stop la daemon transmission `(*)`
transmission-remote -a /le/chemin/fichier.torrent                                                                           | ajoute un torrent
transmission-remote --help                                                                                                  | commme son nom l'indique
transmission-remote -l                                                                                                      | list des torrents actifs
transmission-remote -t 5 -i pi                                                                                              | affiche l'état du torrent n°5 du listing
transmission-remote -t  1,3,5-8 -i pi                                                                                       | affiche l'état des torrents n°1,3,5,6,7,8 du listing
transmission-remote -t 5 -r                                                                                                 | supprime le torrent n°5
transmission-remote -t 5 -S                                                                                                 | stop le telechargement du torrent n°5
transmission-remote -t 5 -s                                                                                                 | reprend le telechargment du torrent n°5
`transmission-create -o ~/le_torrent_cree.torrent -t http://le-tracker.fr/ -p -c "Mon commentaire" ~/Le_contenu_du_torrent` | crée un torrent

(*) Le fichier de configuration se trouve dans `/var/lib/transmission-daemon/info/settings.json`.
  - Arrêter le daemon avant modification des configs.
  - changer le fichier de config pour mettre l'authentification rpc à false


