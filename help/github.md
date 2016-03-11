----- AIDE GITHUB -----
=======================

Recipes
=======

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
** note ** le projet local doit être initialisé (Voir Créer un nouveau Repo local)
git remote add origin https://github.com/rachidbch/test.git
git push -u origin master

