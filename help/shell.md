----- AIDE GENERAL SUR LE SHELL LINUX -----
===========================================


# Help
man curl | grep word -     | affche toutes lignes du man curl contenant "word"
man curl | grep "\-L" -    | affiche toutes les lignes du man curl contenant "-L"
man curl | grep regexp -    | affiche toutes les lignes du man curl matchant l'expression régulière

# Redirections

  | Command                | Effect                                                                                             |
  | -------                | ------                                                                                             |
  | -------                | ------                                                                                             |
  | <cmd> 2>&1             | redirects stderr to stdout                                                                         |
  | <cmd> 2>&1 >> filename | redirects stderr to stdout (a tty for instance) and THEN redirects stdout to the file filename ... |
  | <cmd> >> filename 2>&1 | redirects stdout and stderr to filename                                                            |
  | <cmd> &> filename      | redirects stderr and stdout to filename                                                            |

  [TODO] Installer un script pour rediriger les outputs (par exemple redirect) de process DEJA lancés et placer ici les commandes.

# Prévisualliser un fichier markdown `(*.md)`
  mdread filename  // Utilise pandoc pour traduire le markdown en html, puis le browser en line de commande lynx pour afficher le html

# Modes Console
## Mode Edition de Console
** note ** Dans ce mode on peut scroller la console au clavier, lire et copier du texte
  Shift-Capslock | passe en mode edition de l'historique de la console
  Escape         | revient au mode edition de ligne


# shell parameters

$* | gets all parametser in a string separated by a character defined by the IFS environment variable).
$@    | gets all parameters in a sequence of strings (``$1'', ``$2'', ... ``$n'') 
$1, $2 ... $n | gets the parameters, $1 beeing the first 
${10} | gets a parameter with index greater than 9
shift | shifts parameters to the left. $1 is lost, ${10} becomes $9, etc.
$0 | gets the script name itself
$# | gets the number of parameters
$? | gets the value of the script/function call


# Processus management
ps aux | sort -n -k 9 | tail -n 20  -> affiche les 20 processus lancés le plus récemment


# Shell Keys 
Ctrl-C -> Kill current process (SIGINT) 
Ctrl-C -> kill current shell line
quit = ^\ -> Quit current process (SIGQUIT)
erase = ^?
kill = ^U
eof = ^D
eol = <undef>
eol2 = <undef>
swtch = <undef>
start = ^Q
stop = ^S
susp = ^Z -> Interrupt current process (SIGINT)
werase = ^W
rprnt = ^R
flush = ^O
