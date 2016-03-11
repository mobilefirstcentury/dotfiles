Aide gestion des packages Ubuntu
================================

Recherche locale de packages: dpkg
-----------------------------------
dpkg -l                           -> list all installed packages
dpkg -p packagename               -> list details for a specific package with
dpkg -s packagename | grep Status -> check installation status of a package
apt-cache search name*            -> search name of the package containing specific binary or software


