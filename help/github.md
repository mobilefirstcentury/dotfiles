----- AIDE GITHUB -----
=======================

Recipes
=======

## Credentials
workstation default configuration should allow transparent ssh connection to github.
if an error message 'bd credentials' is encountered try this:

  ```sh
  # test the ssh connection
  $ ssh -T git@github.com     
  # if an error 'bad credentials" appears, make sure ssh-agent is activated
  $ eval "$(ssh-agent -s)"
  # make sure github identity is loaded
  $ ssh-add ~/.ssh/sshkey_webservices  
  # retest the ssh connection 
  $ ssh -T git@github.com    # a success message shoudl appear 
  ```
**note** this workaround affects only current terminal. repeat in any terminal used to connect to github

if gh keeps complaining about bad credentials, try this:
  ```sh
  $ gh user -L    # logout
  $ gh user -l    # login
  #  > enter github login/password
  ```


Créer un nouveau Repo local
---------------------------
git init
git add README.md
git commit -m "first commit"

Créer un projet Github (Vide)
-----------------------------
gh repo --new project-name // creates a new emtpy project in Github without reaching to the browser

Lier le repo local à un projet Github (Vide)
--------------------------------------------
[TODO] vérifier que la syntaxe alternative fonctionne :  ''
** note ** le projet local doit être déjà initialisé (Voir Créer un nouveau Repo local)

  ```sh
  # create remote branch
  $ git remote add origin https://github.com/rachidbch/test.git                   # via https
  # or ..
  $ git remote add origin git@github.com:rachidbch/repo-name.git                  # via ssh
  # push on upstream remote branch
  $ git push -u origin master
  ```

