---- Geeknote Userguide ----
============================


# Login

$ geeknote login

# logout
$ geeknote logout


# create note with content

$ geeknote create --title "Note title" --content "My note" --tags "finance, business, important" --notebook "Family"

** remark ** Geeknote is not 'pipable' so we have to cheat to enter multi-line content on the command line
$ geeknote create --title "Note title" --content "
\ First content line
\ Second content line
" 

# Edit existing note

$ geeknote edit --note [title of the note to edit] (--title [new title] --tags [new tags] --notebook [new notebooks])
$ geeknote edit --note [old title] --title [new title]

# Fuzzy Search notes
The results list is numbered.

$ geeknote find --search [text-to-search] --tags [comma-separated tags] --notebook [comma-separated notebooks] --date [date-or-date-range] --content-search
$ geeknote find --content-search [text-to-search] --tags [comma-separated tags] --notebook [comma-separated notebooks] --date [date-or-date-range] --content-search
$ geeknote find --search "*restaurant" --notebooks "Family" --date 31.03.2014-31.08.2014
$ geeknote find --search "restaurant*" --notebooks "Family"


# Exact Search notes

$ geeknote find --search "Liste des courses" --notebooks "Family" --exact-entry

# show a note

$ geeknote show <number> // the number of the note in the search result
$ geeknote show [title]

# remove a note

$ geeknote remove --note [title]


# list notebooks 

$ geeknote notebook-list

# list tags

$ geeknote tag-list

# create a notebook

$ geeknote notebook-create --title [notebook title]

# create a tag

$ geeknote tag-create --title [tag title]


# Syncing 

a folder can be sync-ed with part of evernote notes

$ gnsync --path [where to sync] (--mask [what kind of file to sync] --format [in which format] --logpath [where to write the log] --notebook [which notebook to use])

  * **\--path /home/adrien/Documents/notes/:** location of note files to synchronize with Evernote.
  * **\--mask "*.txt":** synchronize only plain text files. By default, `gnsync` will try to sync every file.
  * **\--format markdown:** whether you want them as plain or markdown format (the default is plain).
  * **\--logpath /home/adrien/gnsync.log:** where to write the log for synchronization. In case it goes wrong, `gnsync` will write logging information there.
  * **\--notebook "Family":** in which notebook to synchronize note files. Note that if you leave it empty, a new notebook named after your synced folder will be created.

