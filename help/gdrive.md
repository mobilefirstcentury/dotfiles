---- drive cheatsheet ----
==========================


## What is it ?
  - `drive` is a tiny program to pull or push [Google Drive](https://drive.google.com) files.
  - drive is only usefull from a directory 'initialized' i.e linked to Google Drive
  - on MFC workstation, this directory is  '~/gdrive/i'

## Help

### list commands that are available:
  $ drive help

### help with a specific command
  $ drive help push

### help with all commands
  $ drive help all

## Initialize/Uninitialize local folder
** Before you can use `drive`, you'll need to mount your Google Drive directory on your local file system **

### initialize local folder
  $ drive init ~/gdrive
  $ cd ~/gdrive

### Uninitialze local folder
** The opposite of `drive init`, it will remove your credentials locally as well as configuration associated files **
  $ drive deinit [--no-prompt]


## List

### list all files in the current directory's remote equivalent
  $ drive list
  $ drive ls

### list all files in specified remote directory
  $ drive list photos

### list files matching a certain prefix pattern 
  $ drive list --matches mp4 go

### list trashed files
  $ drive list -trashed photos

### list files with owner and version number informations
  $ drive list -owners -l -version


### list sorted files and directories
** sorting criterias: `name`, `version`, `size, `modtime`,  `lvt`(lastModifiedByMeTime), `md5`**
** sort in reverse order: suffix `_r` or `-` to the selected key **

### sort by modTime, then largest-to-smallest and finally most number of saves
  $ drive list --sort modtime,size_r,version_r Photos

### list skipping certain mime types
  $ drive list --skip-mime mp4,doc,txt

### list only certain mime types
  $ drive list --match-mime xls,docx

### list with exact name
  $ drive list --exact-title url_test,Photos

## Pull

### pulls everything that changed
  $ drive pull
    
### pulls everything
  $ drive pull -force

### pulls with match criteria
  $ drive pull --matches vines docx

### pull specific files or directories
  $ drive pull photos/img001.png docs

### Pull by id
  $ drive pull --id 0fM9rt0Yc9RTPaDdsNzg1dXVjM0E 0fM9rt0Yc9RTPaTVGc1pzODN1NjQ 0fM9rt0Yc9RTPV1NaNFp5WlV3dlU

### pull only folder until the second level depth
  $ drive pull --depth 2 heavy-files summaries

### pull everything under a directory (negative depth means infinite depth)
  $ drive pull --depth -1 all-my-files

### Pull starred files

  $ drive pull --starred
  $ drive pull --starred --matches content
  $ drive pull --starred --all # Pull all the starred files that aren't in the trash
  $ drive pull --starred --all --trashed # Pull all the starred files in the trash


### To turn checksum verification on (This checksum verifies only size and modification date)
  $ drive pull -ignore-checksum=false

### download files and pipe to stdout
  $ drive pull -piped path1 path2

## Push


### push direct content of a directory
  $ drive push --depth 1 head-folders

### push without checksum verification 
  $ drive push -ignore-checksum my-folder

### push and create suffixed filenames in case o file name clashes
  $ drive push `--fix-clashes myfolder

### push and ignore file name clashes
  $ drive push --ignore-name-clashes myfolder 
  
### push content from stdin
  $ drive push -piped path

### backup the current working directory. 
  $ tar czf - . | drive push -piped backup-$(date +"%Y%m%d-%T").tar.gz

### unattented push
  $ drive push -quiet
  $ drive push -no-prompt

### push and convert to Google Docs format
  $ drive push -convert

### push and perform OCR on png, gif, pdf and jpg
  # OCR must be allowed on account
  $ drive push -ocr myfolder

### push and impose mime-type
  $ drive push -coerce-mime docx my_test_doc

## Publish

### publicly publish by name or by Id
** The `pub` command publishes a file or directory globally so that anyone can view it on the web using the link returned.**
  $ drive pub photos
  $ drive pub --id 0fM9rt0Yc9RTPV1NaNFp5WlV3dlU 0fM9rt0Yc9RTPSTZEanBsamZjUXM

### unpublishing
  $ drive unpub photos
  $ drive unpub --id 0fM9rt0Yc9RTPV1NaNFp5WlV3dlU 0fM9rt0Yc9RTPSTZEanBsamZjUXM

## Share
### share a set of files with specific users and assign them specific roles as well as specific generic access to the files.

  $ drive share --emails odeke@ualberta.ca,odeke.ex@gmail.com --message "This is the substring file I told you about" --role reader,writer -type group mnt/substringfinder.c projects/kmp.c
  $ drive share --emails emm.odeke@gmail.com,odeke@ualberta.ca --role reader,commenter --type user influx traversal/notes/conquest

### share a file with users of a mailing list and a custom message
  $ drive share -emails drive-mailing-list@gmail.com -message "Here is the drive code" -role group mnt/drive
  $ drive share --emails developers@developers.devs --message "Developers, developers developers" --id 0fM9rt0Yc9RTPeHRfRHRRU0dIY97 0fM9rt0Yc9kJRPSTFNk9kSTVvb0U

### Unshare
  $ drive unshare -type group mnt/drive
  $ drive unshare --emails  emm.odeke@gmail.com,odeke@ualberta.ca --type user,group --role reader,commenter infinity newfiles/confidential
  $ drive unshare --type group --id 0fM9rt0Yc9RTPeHRfRHRRU0dIY97 0fM9rt0Yc9kJRPSTFNk9kSTVvb0U

## Edit

### open file in default application
  $ drive open --file-browser=false --web-browser f1/f2/f3 jamaican.mp4

### files and directories remote creation
$ drive new --folder flux
$ drive new --mime-key doc bofx
$ drive new --mime-key folder content
$ drive new --mime-key presentation ProjectsPresentation
$ drive new --mime-key sheet Hours2015Sept
$ drive new --mime-key form taxForm2016 taxFormCounty
$ drive new flux.txt oxen.pdf # Allow auto type resolution from the extension

### copy remotely
  $ drive copy -r blobStore.py mnt flagging
  $ drive cp -r blobStore.py mnt flagging
  $ drive copy blobStore.py blobStoreDuplicated.py

### rename
  $ drive rename url_test url_test_results
  $ drive rename openSrc/2015 2015-Contributions


### Move
  $ drive move photos/2015 angles library archives/storage
  $ drive mv photos/2015 angles library archives/storage

### star or unstar documents
  $ drive star information quest/A/B/C
  $ drive unstar information quest/A/B/C

### description editing
  $ drive edit-desc --description "This is a new file description" freshFolders/1.txt commonCore/
  $ drive edit-description --description "This is a new file description" freshFolders/1.txt commonCore/
  $ cat fileDescriptions | drive edit-desc --piped  targetFile influx/1.txt

### FileId Retrieval
  $ drive file-id --depth 2 dup-tests bug-reproductions## Url

### show url of a file
  $ drive url Photos/2015/07/Releases intros/flux


## Exporting Docs
** By default, the `pull` command will export Google Docs documents as PDF files. To specify other formats, use the `-export` option **

### pull documents as pdf, rtf, docx, txt
  $ drive pull -export pdf,rtf,docx,txt

### To explicitly export instead of using `--force`
  $ drive pull --export pdf,rtf,docx,txt --explicitly-export

### Specify the destination directory of exported files
** By default, the exported files will be placed in a new directory suffixed by `\_exports` in the same path. To export the files to a different directory, use the `-export-dir` option **
  # supported export formats: doc, docx, jpeg, jpg, gif, html, odt, rtf, pdf, png, ppt, pptx, svg, txt, text, xls, xlsx
  $ drive pull -export pdf,rtf,docx,txt -export-dir ~/Desktop/exports## Diff

### compare local files with their remote equivalents
  $ drive diff changeLogs.log notes sub-folders/

### compare local directory with remote equivalent upto a specified depth
  $ drive diff --depth 2 sub-folders/ contacts/ listings.txt

### two-way diff (will also locate files missing on either side)
  $ diff <(drive md5sum) <(md5sum *)

### two-way diff recursively (will also locate files missing on either side)
  $ diff <(drive md5sum -r) <(find * -type f | sort | xargs md5sum)

### diff across two differents Drive accounts
  $ diff <(drive md5sum -r MyDrive/folder) <(drive md5sum -r OtherDrive/otherfolder)

## Touch

### change modification date od remote files
  $ drive touch Photos/img001.png logs/log9907.txt

### touch all files that begin with digits 0  to 9:
  $ drive touch -matches $(seq 0 9)

### touch files to a specifed depth 
  $ drive touch --depth 3 mnt newest flux
  $ drive touch --depth -1 --id 0fM9rt0Yc9RTPeHRfRHRRU0dIY97 0fM9rt0Yc9kJRPSTFNk9kSTVvb0U
  $ drive touch --depth 1 --matches $(seq 0 9)


## Clashes


### list clashes
  $ drive clashes [--depth n] [paths...]
  $ drive clashes --list [--depth n] [paths...] # To be more explicit
### fix clashes
  $ drive clashes --fix [--depth n] [paths...]


## Trash

### trash a file or directory 
  $ drive trash Demo

### trash files that contain a prefix match (all files that begin with 'Untitled' or 'Make'
  $ drive trash -matches Untitled Make

### untrash previously trashed files
  $ drive untrash Demo

### untrash files that match a certain prefix pattern
  $ drive untrash -matches pQueue photos Untitled

### Emptying the Trash
  $ drive emptytrash

### Delete
** Deleting items will PERMANENTLY remove the items from your drive. This operation is irreversible **
  $ drive delete flux.mp4

### delete files that match a certain prefix pattern
  $ drive delete --matches onyx swp
  $ drive rm --matches onyx swp


## Stat

### show detailed file information (people with whom it is shared, their roles and accountTypes, and fileId etc)
  $ drive stat mnt

### show detailed file information recursively
  $ drive stat -r mnt


## Integrity Checks

### check md5sum of current directory files against remote ones
  $ drive md5sum | md5sum -c



## Check Google Drive Account features and quotas
  $ drive features
  $ drive quota


