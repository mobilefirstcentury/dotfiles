WEECHAT MANUEL UTILISATEUR
==========================


RACCOURCIS
==========



Alt+←/→ ou F5/F6 : aller au tampon précédent/suivant

F7/F8            : aller à la fenêtre précédente/suivante (quand l'écran est divisé)

F9/F10           : faire défiler la barre de titre

F11/F12          : faire défiler la liste des pseudos

Tab              : compléter le texte de la barre d’entrée, comme avec votre shell

PgUp/PgDn        : faire défiler le texte dans le tampon courant

Alt+a            : sauter au tampon avec de l’activité (dans la "hotlist")


COMMANDES
=========

Ajouter un serveur IRC
----------------------

/server add freenode chat.freenode.net


Choisir son Pseudo
------------------

/set irc.server.freenode.nicks "pseudo,pseudo2,pseudo3,pseudo4,pseudo5"

Modifier son identité
---------------------

/set irc.server.freenode.username "Mon nom d'utilisateur"
/set irc.server.freenode.realname "Mon nom réel"

Joindre automatiquement des canaux
----------------------------------

/set irc.server.freenode.autojoin "#canal1,#canal2"


Se connecter au serveur IRC et rejoindre les canaux
---------------------------------------------------

/connect freenode


Rejoindre/quitter les canaux IRC
--------------------------------

### Rejoindre un canal :

/join #channel


### Quitter un canal (en laissant le tampon ouvert) :

/part [message de fin]

### Quitter le canal et fermer le tampon


/close

Messages privés IRC
-------------------
/query foo ceci est un message

Split vertical de l'écran verticalement
--------------------------------------

/window splitv 33

