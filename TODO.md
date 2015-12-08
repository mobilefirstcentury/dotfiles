TODO 
=====



### Bugs

#### Lancement I3 depuis lightdm (Ubuntu) 

Quand on lance i3 directement depuis l'écran de login de Ubuntu (Lightdm), les fichiers de startup (.xinitrc, .zlogin) ne sont pas sourcés.
J'ai donc des problèmes d'initalisation de la session:
* obligation de faire un 'setxkbmap -layout fr' pour avoir le clavier français par exemple
* le swap escape/capslock n'est pas fait (ce qui est assez logique vu que je n'ai mis la la commande que dans ~/.config/autostart/desktop)

#### Initialisation spécifiques l'environnement est une Machine virtuelle.

Dans ~/dotfiles/.i3/config , on veut lancer VboxClient (pour la prise en charge de la communication avec la machine host) uniquement si on est dans une machine virtuelle.
Pour ça on doit tester la présence de l'application VboxClient mais apparemment le fichier config de i3 ne supporte pas les scripts bash.
+   créer un repertoire scripts dotfiles
+   y déplacer le fichier bootstrap
+   créer un script qui fait la vérification et le lancement de VboxClient (reprendre la code commenté dans i3/config)
+   Lancer ce script depuis i3/config

#### Niveau de battery dans conky
Le niveau de battery affiche N/A ...  
Améliorer le thème Conky dans I3 en utilisant:
* https://github.com/NormenKD/Conky-Themes/blob/master/Theme%201/.conkyrc
* https://github.com/poolpix/i3/blob/master/.conkyrc
* https://github.com/zagortenay333/Harmattan
* https://github.com/zenzire/conkyrc


# Ameliorations

#### scripts et dotfiles
+ quand on a besoins d'installer des scripts outils, la bonne démarche est l suivante:
+ créer un repertoire scripts sous ~. Le rajouter dans le path.
+ installer dans ce repertoire tous les outils qui ne vont pas dans usr/.../bin
+ créer dans scripts/ un script qui appelle l'outil (en utilisant un chemin reltif pour l'appel).
+ On peut avoir aussi recours à un lien.  

#### Vagrant 
+ pour valider, tester bootstrap sur une machine vierge dans vagrant.
+ faire marcher le fichier Vagrant file pour une installation directe avec vagrant up


#### Autostart Ubuntu. Faire les actions suivantes dans un autostart pour Ubuntu

##### I - On est obligé de faire cette modif pour permettre de lancer I3 sur VT8 depuis Ubuntu, Sinon on a un message d'erreur. Bien sur on s'assure que l'ajout n'est fait qu'une fois.
```
[[ ! -n $(grep "\[MFC" /etc/X11/Xwrapper.config) ]] && {
cat >> /etc/X11/Xwrapper.config << EOL
# [MFC DOTFILES] Modification pour permettre la lancement d'une session sur VT8 depuis Ubuntu.
allowed_users=anybody
# [MFC FIN MODIF]
EOL 
}
```

##### II Transferer le code qui lance startx en VT pour Ubuntu dans un autostart Code est pour l'instant dans .zlogin qui n'est pas lancé sur Ubuntu


#### Scripter l'installation de fu
+    voir: https://github.com/samirahmed/fu
+    Il y a une erreur lors du setup.py mais qui ne semble pas perturber le fonctionnement du script
+    J'ai écrit un script foo (dans ~/scripts) qui grep les résultats de fu. Mettre au propre et ... changer son nom :)

```
$ [Si le folder ~/scripts/fu n'existe pas le créer sinon ne rien installer]
$ cd ~/scripts/fu
$ git clone git://github.com/samirahmed/fu.git
$ cd fu/
$ sudo python setup.py install --record installRecords.txt
```



#### Install Tree
sudo apt-get install tree

#### Install Vundle
$ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/Vundle.vim

#### Modifications sur bootstrap.sh
 eliminer l'installation des plugins vundle (Indiquer dans un Readme qu'il faut lancer Vim puis faire ":PluginInstall" après l'execution de bootstrap.sh
 créer le lien .oh-my-zsh (vérifier d'abord pourquoi ce n'est pas fait de base)

####Install Conky
$ sudo apt-get install conky-all
$ chmod +x /home/rachid/dotfiles/.i3/conky/conky-i3bar


#### Install autojump 
#### Sinon ça provoque une erreur dans zshrc (en relation avec oh-my-zsh où ce plugin est déclaré)
$ sudo apt-get install autojump
 
####Install feh
sudo apt-get install feh

#### Adapter le mapping clavier 
 - swapper caps lock et escape 
    Pour Ubuntu (Session X), il faut créer le fichier ~/.config/autostart/.desktop.(cf http://askubuntu.com/questions/598195/how-to-add-a-script-to-startup-applications-from-the-command-line)
    Pour les consoles virtuelles (Debian):
        * modifier le fichier  /etc/default/keyboard (privilege admin)  (cf  http://www.emacswiki.org/emacs/MovingTheCtrlKey)
        * $sudo dpkg-reconfigure -phigh console-setup 

 - swapper left control et left shift : ??



