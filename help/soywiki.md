----- SoyWiki -----
===================
#TAGS tag_web, tag_browser


   SoyWiki turns Vim into a powerful, lean, and fast wiki. It's got all the
   protein of a more conventional wiki, but less saturated fat and no
   cholesterol.


Mode d'utilisation de SoyWiki
============================

  + *Soywiki s'utilise depuis VIM*
  + *La structure du wiki est très simple:*
    - Un wiki est un repertoire qui contient des espaces qui contiennent des pages
        - Les espaces sont nommmées en miniscule et sont des répertoires dans le wiki
          - exemples: 'developpement', 'idees', etc
          - l'espace 'main' est obligatoire
        - Les pages sont nommées en CamelCase
          - exemple: 'SoftwareDevelopement', 'PriseDeNote', etc.
          - la page 'HomePage' est obligatoire dans chaque espace
  + *Liens entre les pages:*
    - le mot 'ValidationFeatures' est un lien vers la page 'ValidationFeatures'
    - le mot main.HomePage est un lien vers la page 'HomePage' dans l'espace 'main' (donc vers le fichier main/HomePage)
  + *Créer le contenu*:
    - Depuis n'importe quelle page on saisie 'FicheDeTest' puis on tape entée avec le curseur sur ce mot:
        + Si la page FicheDeTest existe **dans l'espace courant** elle sera ouverte dans Vim sinon elle sera crée ** dans l'espace courant **
    - Si on saisie 'livraison.AcceptationTest':
      + Si la page 'AcceptationTest' existe dans l'espace 'livraison', elle sera ouverte,
      + Si la page ou l'espace n'existe pas, ils seront crées
  + C'est tout :)

Commandes VIM
=============

Lancement de SoyWiki
--------------------
 :Soywiki | lance le wiki  depuis VIM
 soywiki  | lance le wiki depuis la ligne de commande


Wiki navigation
---------------

  CTRL-j | move the cursor directly to the previous WikiLink on the page
  CTRL-k | move the cursor directly to the next WikiLink on the page
  ENTER | follows the WikiLink under the cursor
  ,f | follows the first WikiLink after the cursor
  CTRL-l | opens a WikiLink in a vertical split window;
  CTRL-l | if the cursor is on the top line, closes the new window
  CTRL-h | does the same, but in a regular split window
  ,h | takes you to the HomePage of the current namespace
  ,H | takes you to main.HomePage
  CTRL-o | moves backward in file history
  CTRL-i | moves forward in file history 
  CTRL-^ | toggle between the current page and the last page 
  * ,m | opens the page list (most recently modified first)
  * ,n | opens the namespace list
  * ,M | opens the inbound links page list
  CTRL-x CTRL-u | Autocompletion of WikiPage names (en mode insert)

Opening web hyperlinks
----------------------

  ,o | opens the first web hyperlink under or after the cursor in the default external web browser
  ENTER | opens the web hyperlink under the cursor in the default external web browser
  ,O | opens the web hyperlink under the cursor in a vertical split window
  CTRL-w f | opens the web hyperlink under the cursor in a normal split window
  gf | opens the web hyperlink under the cursor in the same Vim window


Wiki refactoring
-----------------

   :SWDelete | :SWD | Supprime la page courante
   :SWRenameTo [NewName] | :SWR [NewName] |  the current page. 


Search
------

  :SWSearch [term] | :SWS | Search 'term' in all the wiki
  :SWNamespaceSearch [term] | :SWN | searchs 'term' in the current space

   **Note** 
    - Vim will load any matches in the quickfix list window. 
    - :cn | goes to next match
    - :cp | return to previous match
    - :cl | returns to list
    - :cc n | goes to match number 'n' 
    - :SWSearchList [term] | SWSL [term] | shows a navigable search result list
    - <Enter> | opens current page and jumps to it
    - <Espace> | opens current page but doesn't jump to it


Exporting to HTML
==================
  soywiki --html | generates an html wiki
  soywiki --html --markdown | the same but processes markdown
  soywiki --html --relative | generates an html wiki and transforms soyfile:// links into relative links in the wiki 

Edition
=======

  \ in normal mode reformats the current paragraph. It is equivalent to gqap. (:help formatting)
  ,- inserts a long dashed line
  ,d inserts the current date and time
  ,D inserts a long dashed line, followed by the current date and time

Getting help
============
   Typing ,? will open the help webpage in a browser.

Hyperlinks
============
   file:// | an external link to a file in absolute path
   soyfile:// | an external link (not a wiki page but in the wiki directory) in relative path


Configuration
=============
  * let g:soywiki_autosave = 1i | activates autosaving (the default), deactivate by setting 0.
  * let g:SoyWiki#browser_command = "your browser command here"
  * configurer autochdir dans vim par défaut ? 

Mappings
=========
  * g:soywiki_mapping_follow_link_under_cursor_here defaults to <cr>
  * g:soywiki_mapping_follow_link_under_cursor_vertical defaults to <c-l>
  * g:soywiki_mapping_follow_link_under_cursor_horizontal defaults to <c-h>
  * g:soywiki_mapping_fuzzy_follow defaults to <leader>f
  * g:soywiki_mapping_next_link defaults to <c-j>
  * g:soywiki_mapping_next_link defaults to <c-k>
  * g:soywiki_mapping_show_history defaults to <leader>lp
  * g:soywiki_mapping_show_files_history defaults to <leader>ls
  * g:soywiki_mapping_show_blame defaults to <leader>b
  * g:soywiki_mapping_expand_seamless_vertical defaults to <leader>x
  * g:soywiki_mapping_expand_seamful_vertical defaults to <leader>X
  * g:soywiki_mapping_expand_seamless_horizontal defaults to <leader>xx
  * g:soywiki_mapping_expand_seamful_horizontal defaults to <leader>XX
  * g:soywiki_mapping_goto_homepage defaults to <leader>h
  * g:soywiki_mapping_goto_main_homepage defaults to <leader>H
  * g:soywiki_mapping_show_help defaults to <leader>?
  * g:soywiki_mapping_format defaults to \
  * g:soywiki_mapping_add_delimiter_line defaults to <leader>-
  * g:soywiki_mapping_add_date defaults to <leader>d
  * g:soywiki_mapping_add_date_and_delimiter_line defaults to <leader>D

