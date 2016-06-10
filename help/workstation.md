-----  AIDE STATION DE TRAVAIL ---------
======================================



Informations générales
======================

## 3 environements possibles 
La station de travail est basée sur Ubuntu Desktop 14.04. Mais on a accès à une session virtuelle basée sur I3.
I3 est un gestionnaire de fenêtre très léger et très rapide qui permet d''éviter la lourdeur de Ubuntu Desktop.
On peut également utiliser utiliser directement une console virtuelle standard.

### Accès aux 3 environnements de travail 
+ **Ubuntu desktop** : Ctrl-Alt-F7
+ **I3**: Ctrl-ALt-F8
+ **Console Virtuell**: Ctrl-Alt-F2 (ou autre sauf F0)

## Une station de travail optimisée pour le travail au clavier.
La souris est un outil très lent pour coder. Il vaut bien mieux s''habituer à travailler uniquement au clavier.
Cette station de travail utilisable uniquement au clavier à conditions d''aprendre les raccourcis clavier de VIM.

### Déplacement: pas de touches flêches!
Comme les touches flêches obligent à déplacer sa main du clavieri, on utilise les touches h,j,k,l  pour se déplacer.
+   **h: droite**
+   **j: bas**
+   **k: haut**
+   **l: gauche**


Guide d''Utilisation de I3
==========================

## Ouverture de session I3
+ Accéder à la console de login : 
  + Ctrl-Alt F1 : affiche l'écran de login
  + entrer le login et le password
  + La session I3 est ouverte.

## Gérer la session I3
+   quitter i3: win-shift-Suppr
+   recharger I3: Win+Shift+r
+   afficher la session ubuntu: ctrl-alt-f7
+   afficher la session i3: ctrl-alt-f8

## Gestion des workspaces
+   ouvrir un nouveau workspace: win-num
    - Workspace 1: dev                                  
    - Workspace 2: test
    - ...
+   Renommer un workspace: win+p puis WSName <Nouveau Nom>
    


## Gestion des fenêtres                        
### Modes de disposition des containers
Chaque workspace est découpé en containers: chaque container peut contenir une application ou plusieurs autres containers.
Les règles de construction des containers sont un peu compliquées:
+ chaque container a un mode horizontal ou vertical
  + Mode horizontal: 
    + les containers enfants s'affichent les uns à côté des autres.
    + Win+w: passer un container en mode horizontal
  + Mode vertical:
    + Les container enfants s'affichent les un au dessus des autres,
    + Win+B: Passer un container en mode vertical
+ lors du lancement d'une nouvelle application:
  + Si le container actif a le même mode que son parent direct, l'application s'affiche dans un container frère.
  + Si le container actif a un mode différent de son parent direct, l'application s'affiche dans un container fils. 

### Gestion des fenêtres & containers
+   naviguer  entre les fenêtres: touches h,j,k,l
+   déplacer les fenêtres les unes par rapport aux autres: win-h, win-j, win-k, win-l
+   passer un container en mode horizontal: win+w
+   passer un container en mode vertical: win+B
+   passer en écran ou réduire une fenêtre: win-f
+   déplacer une fenêtre vers un autre workspace: win-shift-num

## Gestion des applications
+   lancer une console : Win+Shift+T
+   lancer une application depuis le menu: win-p puis taper le nom de l''aplication.
+   fermer une fenêtre: ctrl-w, sinon win-q


Guide d'Utilisation de l'Aide
==============================

helpme
------
helpme <cmd> : affiche les utilisations courantes de <cmd> 

bro
---
bro <cmd> : affiche une liste d'example d'utilisations de la commande

fu
--
fu <cmd> : affiche une liste d'examples d'utilisations de la commande

how do i 
--------
howdoi <space-separated-keywords> : affiche les meilleures réponses internet aux questions contenant les mots clés


how do i in VIM
----------------
:r !howdoi 'grid flexbox' # write the result of the howdoi query in the current file  
:!howdoi 'grid flexbox'  # displays the result of the howdoi query in the vim scratchpad



Lecture des fichiers d'aide
----------------------------

Les fichiers d'aide sont dans le repertoire ~help (~/help -> dotfiles/help)  au format markdown.
Exemple de recherche d'aide:
On cherche de l'aide sur le 'balance' dans emmet

1. vim  ~help puis <tab>
2. la liste des fichiers d'aide apparait dont emmet.md
3. on écrit <emm> puis <tab> puis <enter> 
4. On complète par vim ~help/emmet +/balance
5. le fichier d'aide s'ouvre sur la première occurence du mot "balance"
6. En mode normal, <n> passe à l'occurence suivante et <N> à l'occurence précédante.
7. On quitte vim avec <:q!>


Dossiers de travail
===================
## Format des documents 
A chaque fois que c'est possible, les documents seront au format markdown.

## Structure de base des répértoire de travail
### Documents
  - Repertoire contenant:
    - les documents de travail hormis le code des projets
    - la documentation 'distribuable' de ces projet 
### Liste des sous-repertoires de Documents 
Repertoire | Usage
--- | ---
_BOOKS | livres et Articles
_INBOX | repertoire utilisé comme buffer pour les documents entrants IMPORTANTS  qui devront être utilisés/rangés rapidement
_NOTES | On n'utilise de documents bureautiques (word, excel, etc.) que lorqu'on ne peut pas faire autrement. Tous les documents sont en markdown
_PERSO | Comme son nom l'indique
_TEMP | les documents dont on ne sait pas encore si on va les détruire ou utiliser/ranger                   
_THEMES | base de connaissance
_TODO | Gestion des informations de todo
 PLAYGROUND | Documents à supprimer rapidement 
_TRASH | Poubelle Système. [TODO] Mettre en place un système pour que les fichiers/rep supprimés depuis la console aillent ici. 

      
### Dev 
  - Repertoire contenant :
    - Le code des projets
    - la documentation 'distribuable' de ces projets
### Liste des sous-repertoires de Dev
Repertoire | Usage
--- | ---
_SANDBOX| Repertoire dans lequels sont installés des projets pour fin de test, apprentissage ou experimentation
_SANDBOX/_LEARN | projets d'autoformation
_SANBBOX/_EXPERIMENT | projets d'experimentation
_SANDBOX/_TEST | projets de tests


### Les repertoires applicatifs 
  - ~/.scripts: scripts internes utilisés par la workstation
  - ~/scripts : scripts externes utilisés par la workstation
  - ~/.packages: code source des applications ou modules internes, compilés et  utilisés par la workstation
  - ~/packages: code source des applications ou moduless externes, compilés et utilisés par la workstation

## Dossiers favoris
----------------
Un certain nombre de repertoires sont accessible avec l'accès '~' (accès tilde)

### accès tilde
  $ ~<deux première lettres du repertoire><tab>  : complete la ligne avec le nom court du dossier favori. PUIS:
  $ <enter> : accède au reporoire
  $ On peut également tapper <nom-du-shortcut> en ligne de commande pour sauter dans ce repertoire

### liste des repertoires favoris
  Shortcut   |  
  ~help      | fichiers d'aide
  ~notes     | notes de travail
  ~download  | repertoire de telechargement
  ~music     |                                                                                | )
  ~images    |                                                                                | )
  ~documents | tout document qui n'est pas du code source ou des fichiers distribuables
  ~inbox     | repertoire des documents importants qui n'ont pas encore été traités ou rangés
  ~trash     | documents qui VONT passer à la poubelle
  ~temp      | documents qui ont de fortes chances de passer à la poubelle
  ~todo      | une note correspond à une tâche à effectuer

Gestion du PC
=============
+ Relancer la connection internet : 'Win+p' puis 'mfcNetworkRestart'


