---- Guide Utilisateur de FBReader ----
=======================================

**fbreader** est un lecteur de fichier epub d'extension "*.pub".

# lancer fbreader
  $ fbreader filename.pub

# configurer fbreader
##barre d'outil
### Cacher la barre d'outil
  - la barred d'outil de FBReader (laide) se masque en cliquant droit sur la barre et en cliquant sur la croix qui apparaît.
  - Dans la workstation, il est plus judicieux de se passer de la barre d'outil:
    + Pour la supprimer il faut renommer le fichier /usr/share/FBreader/default/toolbar.xml en /usr/share/FBReader/default/toolbar.xml.bak
    + il faudra refaire cette manipulation à chaque update de FBReader !
### Afficher la barre d'outil
  - Si pour une raison exceptionnelle on a besoin de cette barre, il faut /usr/share/FBreader/default/toolbar.xml et relancer FBReader

# Raccourcis clavier
## configuration 
  - les raccourcis par défaut sont dans le fichier /usr/share/FBreader/default/keymap.xml
  - les modifications de raccourcis sont enregistrées dans ~/.FbReader/options.xml
  - le format du fichier options.xml n'étant pas intuitif, il vaut mieux afficher temporairement la barre d'outil et modifier le mapping clavier depuis Parametres/Options/Touches
## configuration actuelle
	L               : showLibrary
	W               : showNetLibrary
	O               : preferences
	LeftArrow       : undo
	RightArrow      : redo
	C               : toc
	Ctrl+F          : search
	/               : search
	P               : findPrevious
	F3              : findNext
	N               : findNext
	PageDown        : pageForward
	PageUp          : pageBackward
  J               : lineForward
	K               : lineBackward
	DownArrow       : lineForward
	UpArrow         : lineBackward
	MouseScrollDown : mouseScrollForward
	MouseScrollUp   : mouseScrollBackward
	Ctrl+Home       : gotoHome
	Home            : gotoSectionStart
	End             : gotoSectionEnd
	Esc             : cancel
	=               : increaseFont
	-               : decreaseFont
	D               : toggleIndicator
	Return          : toggleFullscreen
	A               : addBook
	I               : bookInfo
	R               : rotate
	Ctrl+DownArrow  : nextTOCSection
	Ctrl+UpArrow    : previousTOCSection
	Ctrl+C          : copyToClipboard
	G               : gotoPageNumber
	Z               : debugNL
