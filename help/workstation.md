=====  AIDE STATION DE TRAVAIL =======

Attention
----------

Le fichier ~/Documents/_NOTES/workstation.md est destiné à l'admin pas à l'utilisateur.
Il contient les instructions d'installation et maintenace de la workstation.
[TODO] Le mettre dans ~/Documents/_WORKSTATION/_INSTALL


Informations générales
----------------------

### 3 environements possibles ###
La station de travail est basée sur Ubuntu Desktop 14.04. Mais on a accès à une session virtuelle basée sur I3.
I3 est un gestionnaire de fenêtre très léger et très rapide qui permet d''éviter la lourdeur de Ubuntu Desktop.
On peut également utiliser utiliser directement une console virtuelle standard.

#### Accès aux 3 environnements de travail ###
+ **Ubuntu desktop** : Ctrl-Alt-F7
+ **I3**: Ctrl-ALt-F8
+ **Console Virtuell**: Ctrl-Alt-F2 (ou autre sauf F0)

### Une station de travail optimisée pour le travail au clavier.
La souris est un outil très lent pour coder. Il vaut bien mieux s''habituer à travailler uniquement au clavier.
Cette station de travail utilisable uniquement au clavier à conditions d''aprendre les raccourcis clavier de VIM.

#### Déplacement: pas de touches flêches!
Comme les touches flêches obligent à déplacer sa main du clavieri, on utilise les touches h,j,k,l  pour se déplacer.
+   **h: droite**
+   **j: bas**
+   **k: haut**
+   **l: gauche**

Guide d'Utilisation de l'Aide
-----------------------------

Les fichiers d'aide sont dans le repertoire ~help (~/Dev/Help)  au format markdown.
Exemple de recherche d'aide:
On cherche de l'aide sur le 'balance' dans emmet

1. vim  ~help puis <tab>
2. la liste des fichiers d'aide apparait dont emmet.md
3. on écrit <emm> puis <tab> puis <enter> 
4. On complète par vim ~help/emmet +/balance
5. le fichier d'aide s'ouvre sur la première occurence du mot "balance"
6. En mode normal, <n> passe à l'occurence suivante et <N> à l'occurence précédante.
7. On quitte vim avec <:q!>

Guide d''Utilisation de I3
-------------------------

### Raccourcis Clavier ####
+   quitter i3: win-shift-e
+   recharger I3: Win+Shift+r
+   lancer une console : Win+Shift+Enter  (On peut lancer plusieurs consoles, elles se répartissent sur l''écran.)
+   naviguer  entre les fenêtres: touches h,j,k,l
+   déplacer les fenêtres les unes par rapport aux autres: win-h, win-j, win-k, win-l
+   couper (Spliter): Win+b (Split vertical),  win+w  (split horizontal)
+   passer en écran ou réduire une fenêtre: win-f
+   lancer une application depuis le menu: win-p puis taper le nom de l''aplication.
+   fermer une fenêtre: ctrl-w, sinon win-q
+   ouvrir un nouveau workspace: win-num
    - Workspace 1: console
    - Workspace 2: web
    - ...
+   déplacer une fenêtre vers un autre workspace: win-shift-num





