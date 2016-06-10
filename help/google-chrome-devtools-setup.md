---- Development Environment Setup ----
======================================

**Beware**

  + As of 2016, it's impossible to launch chrome on the 'Dev' user profile from the command line: chrome is launched with 'Personne 1' user profile instead.
  + So in real word, we don't configure the 'Dev' profile but the 'Personne 1' profile 

1. create a 'Dev' profile: 
  - ! options> Settings > Persons > Button 'Add User Profile'
  - ! click on "User" button (top-right corner of chrome window) > Switch Profile User > Select 'Dev'
  - # Install Dev Oriented Chrome extensions:
    + Session Buddy
    + CVim
    + Devtools Theme: Zero Dark Matrix
    + [TODO] Add more here ...
2. Configure devtools 
  - ! Launch Devtools (Ctrl-Shift-I)
  - customize > settings > general 
    + disable cache (while DevTools is open)
    + enable Ctrl + 1-9 shortcut to switch panels
    + show rulers
  - customize > settings > experiments 
    + allow custom UI panel
    + security panel
  - customize > dockSide :
    + "Undock"
    + ! toggle floating mode : "win+shift+f" (i3 keyboard shortcut)
3. Serve local project
  - # There's more than one method to serve the local web project (cf Meteor for instance, ...)
  - $ cd <project-dir>
  - $ serve &>/dev/null & 
  

4. launch the project in chrome from the command line in app mode with the 'Dev' profile
  - # in app mode, the adress bar and the tabs are not displayed to maximize real estate 
  - $ google-chrome --app=http://localhost:3000 --profile-directory="Dev"        
  - > Win+Shift+f  # toggle floating mode  
  - # place chrome window as suited 
  
5. launch dev tools 
  - > Ctrl+Shift+I 
  - > Win+Shift+f # toggle foating mode
  - # place the DevTools window (The best option for scripting is to have chrome and devtools tabbed in a dedicated workspace. That way we can switch back and forth with Win+Tab)
  - ! select 'Sources' Panel
  - ! select 'Localhost:3000' folder, rigt click and select 'Add Folder to WorkSpace' > Select <project-dir>
  - ! accept DevTools access to project folder

6. Add live.js
  - ! in DevTools> Sources select '<project-dir>  > index.html' 
  - add < script src="http://livejs.com/live.js" > at before body tag
  - > Ctrl+s  # save index.html file in <project-dir>
  - > Ctrl+r  # reload the project with live.js activated
  - # from now on, evry time we save a modification in DevTools:
    + the modification is saved on the disk 
    + the web page in chrome is updated automagically by live.js
    + the modified files are updated automagically if they are open in VIM by 'vim-autoread' plugin




