----- RANGER -----
===================
tags: file, explorer, console, terminal, command, line

** What? **   Ranger is a terminal file manager with vim-like keybindings

Launch Ranger
============

In the commande line
-------------------
ranger -> opens ranger on the current directory

In Vim
------
,r -> opens ranger on the current directory in a new tab

General Commands
================
     * ? = View ranger man page
     * 1? = Keybindings help                                  
     * 2? = Command help
     * 3? = Settings help
     * R = Reload current directory
     * ,<esc> = Quit
     * Q = Quit

Mode d'affichage des repertoires et fichiers
============================================
  - Display on 3 columns:

Column         | Description
---            | ---
middle column  | current working directory
The left pane  | parent directory
The right pane | preview (if available) of the file selected in the middle pane.


Navigation
==========
     * j = Move down
     * k = Move up
     * h = Move to parent directory
     * gg = Go to the top of the list
     * G = Go to the bottom of the list
     * <ctrl>-f = Page down
     * <ctrl>-b = Page up
     * J = Page down 1/2 page
     * K = Page up 1/2 page
     * H = Go back through navigation history
     * L = Go forward through navigation history

     * gh = cd ~
     * ge = cd /etc
     * gu = cd /usr
     * gd = cd /dev
     * go = cd /opt
     * gv = cd /var
     * gm = cd /media
     * gM = cd /mnt
     * gs = cd /srv
     * gr = cd /
     * gR = cd to ranger's global configuration directory

     * ,j text <enter> -> jumps to most used directory containing "text"


Working with Files
==================

     * :e <filename> = Creates a new file and opens it in Vim
     * i = Display file (useful if you'd like to view a text file in a
       pager instead of editing it)
     * l or E = Open file (opens file in default file-handler)
     * r = Open file with… (allows you to choose program to use)
     * o = Change sort order (follow by character in menu selection)
     * z = Change settings (commonly used toggle settings)
     * zh = View hidden files
     * <space> = Select current file
     * t = Tag file (you can perform actions on tagged files)
     * cw = Rename current file
     * / = Search for files
     * n = Jump to next match
     * N = Jump to previous match
     * yy = Yank (copy) file
     * dd = Mark file for cut operation
     * <delete><enter> = Delete selected files

File tagging and marking
========================

Tabbed Browsing
================
     * <ctrl>-n = Create new tab
     * <ctrl>-w = Close current tab
     * <tab> = Next tab
     * <shift><tab> = Previous tab


Command Interface
==================
** Notes ** Like vim, ranger also includes a command interface accessible with ":"
     * ! = Execute a command from the shell (non-ranger commands)
     * : = Execute a ranger command
     * du = Measure disk usage of current directory
     * chmod = Change permissions of current file

** Notes ** Following flags can be used with a dash "-" after typing "!" for shell commands or ":" for ranger commands
     * -s = Discard the output of the current command.
     * -d = Detach the process and run in the background
     * -p = Return the output in ranger's file pager
     * -w = Do not return immediately after command execution. Hang until
       "Enter" is pressed
     * -c = Perform command on current file, not the selected files

** Notes ** A command can be executed on specified targets. 
            Following parameters will be substitued in the commmand

     * %f = Substitute highlighted file
     * %d = Substitute current directory
     * %s = Substitute currently selected files
     * %t = Substitute currently tagged files

** Exemple **
   :bulkrename %s -> renames currently selected files


