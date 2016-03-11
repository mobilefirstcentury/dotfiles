
MANUEL GIT
=========

PROCESSUS SIMPLIFIE
===================
Lister les fichiers en conflit
--------------------------------

grep -lr '<<<<<<<' .

Accepter la version locale d'un fichier (ou fichier target)
----------------------------------------------------------

git checkout --ours PATH/FILE

Accepter le fichier distant (ou fichier merge)
----------------------------------------------

git checkout --theirs PATH/FILE

Accepter tous les fichiers locaux (fichiers target)
--------------------------------------------------

grep -lr '<<<<<<<' . | xargs git checkout --ours

Accepter tous les fichiers distants (fichiers merge)
-----------------------------------------------------

grep -lr '<<<<<<<' . | xargs git checkout --theirs

Conflits complexes 
--------------------

+ editer les conflits dans VIM
+ faire un git add file pour chaque fichier édité dans VIM

Clore le merge
---------------

+ faire un git status pour vérifier que tout va bien
+ faire le commit


COMMANDES GIT
=============

Obtenir de l'aide (sur une commande).
------------------------------------

git help nom_commande
git nom_commande --help
man git-nom_commande

Gestion du repertoire de travail 
--------------------------------

+ ** Initier un dépôt local **
  + Se placer dans le répertoire du projet et lancer :
  + git init

+ ** Connaître l'état de votre dépôt ** (les fichiers modifiés, ajoutés, indexés... depuis la dernière validation).
  + git status

+ ** Ne plus suivre les mises à jour d'un fichier **  tout en le gardant présent dans le répertoire de travail.
  + git rm --cached fichier_a_ignorer
  + (On peut indiquer le nom d'un fichier, un patron (ex : git rm \*.js) ou encore le nom d'un répertoire. C'est une alternative au fichier .gitignore).

+ ** Renommer un fichier. **
  + git mv ancien_nom nouveau_nom

+ ** Changer le répertoire racine.**
  + git filter-branch --subdirectory-filter nom_nouveau_repertoire_racine HEAD
 

Indexation des fichiers.
------------------------

+ git add -A : ajoute tous les fichiers à l'index en prenant en compte les suppression de fichiers.
+ ** Indexer des fichiers ** (= les intégrer dans votre suivi de versions). 
  * git add fichier_à_indexer
  + (On peut saisir le nom d'un fichier à indexer ou encore un patron tel que `*.php` par exemple pour indexer tous les fichiers .php non suivis. Il est aussi possible de saisir le nom d'un répertoire dont tous les fichiers seront alors indexés récursivement.)

+ ** Connaître les différences entre les fichiers de votre répertoire de travail et ceux indexés. **
git diff

+ ** Effacer un fichier de l'index + de votre répertoire de travail. **
  + git rm fichier_a_supprimer
  + Ajouter l'option -f pour forcer la suppression d'un fichier déjà indexé.

+ ** Enlever un fichier de l'index.**
  + git reset fichier_à_désindexer
  + Si aucun nom de fichier n'est précisé, tous les fichiers seront désindexés.

+ ** Récupérer la version présente dans l'index d'un fichier. **
  + git checkout -- fichier_à_récupérer
  + Le fichier sera écrasé par son ancienne version. C'est donc définitif.

+ ** Lancer d'indexation interactive des fichiers. **
  + git add -i
  + L'option 5 (ou p) permet alors l'indexation partielle des fichiers (par patchs).
  + Significations des options proposées pour chaque modification :
    + y - indexer cette partie
    + n - ne pas indexer cette partie
    + a - indexer cette partie et toutes celles restantes dans ce fichier
    + d - ne pas indexer cette partie ni aucune de celles restantes dans ce fichier
    + g - sélectionner une partie à voir
    + / - chercher une partie correspondant à la regexp donnée
    + j - laisser cette partie non décidée, voir la prochaine partie non encore décidée
    + J - laisser cette partie non décidée, voir la prochaine partie
    + k - laisser cette partie non décidée, voir la partie non encore décidée précédente
    + K - laisser cette partie non décidée, voir la partie précédente
    + s - couper la partie courante en parties plus petites
    + e - modifier manuellement la partie courante
    + ? - afficher l'aide
  + Autres solutions pour indexation partielle.
    + git add -p
    + git add --patch
 

Validation (commit) des fichiers.
---------------------------------

+ ** Enregistrer un commit pour valider les fichiers indexés. **
  + git commit
  + Cette commande doit lancer votre éditeur pour vous demander de saisir un message de validation. Par défaut vous voyez afficher le résultat de la commande git status.
  + Saisissez ** `git commit -v` ** pour obtenir comme message par défaut le résultat de ** git diff ** au lieu de ** git status ** .

+ ** Enregistrer un message de validation simple sans passer par un éditeur (option -m) **
  + git commit -m "Votre message de validation"

+ ** Indexer toutes les fichiers déjà en suivi de version tout en enregistrant le commit (option -a). **
  + git commit -a -m "Votre message de validation"
  + Usages pour les messages de validation.
    + les messages doivent débuter par une ligne unique d'au plus 50 caractères décrivant de manière concise la modification,
    + suivre par une ligne vide,
    + puis une explication plus détaillée incluant la motivation de la modification.
    + Utiliser le présent de l'impératif ou des verbes substantivés dans le message.


+ ** Connaître les différences entre les fichiers indexés et ceux du dernier commit. **
  + git diff --cached
  + ou (versions récentes de Git) : + git diff --staged


+ ** Modifier le dernier commit.
  + git commit --amend
  + -> permet de change le message, les fichiers...
  + -> change aussi la somme de contrôle donc éviter si ce commit a déjà été publié.

+ ** Afficher le contenu d'un commit.
  + git show somme_de_contrôle (au moins les 4 premiers caractères)

+ ** Afficher le commit précédent.
  + git show HEAD^

+ ** Retourner sur un ancien commit.
  + git reset --hard somme_de_contrôle
  + Pour scinder un commit en plusieurs, commencez par demander à le modifier (edit), puis annuler le : git reset HEAD^

+ ** Changer l'adresse email associée aux commits.
	git filter-branch --commit-filter '
        if [ "$GIT_AUTHOR_EMAIL" = "mauvais@email.com" ];
        then
                GIT_AUTHOR_NAME="Prénom Nom";
                GIT_AUTHOR_EMAIL="bon@emil.com";
                git commit-tree "$@";
        else
                git commit-tree "$@";
        fi' HEAD

+ ** Contrôler les erreurs d'espaces.
  + git diff --check
 

Historique des validations (commit).
------------------------------------

+ ** Afficher l'historique. **
git log
Cette commande indique par défaut chaque commit du plus récent au plus ancien avec sa somme de contrôle SHA-1, le nom & l'e-mail de l'auteur, la date et le message de validation.

+ ** Obtenir version courte mais unique des sommes de contrôle. **
git log --abbrev-commit

+ ** Visualiser les différences opérées entre chaque commit (l'équivalent d'un git diff) (option -p). **
git log -p

+ ** Limiter l'affichage aux 6 derniers commit (par exemple). **
git log -6

+ ** Obtenir des statistiques concernant les modifications apportées par chaque commit (option --stat). **
git log --stat

+ ** Visualiser les commit de l'historique sur une seule ligne. **
git log --pretty=oneline

+ ** Définir un format d'affichage pour les commit de l'historique. **
  + git log --pretty=format:"mon_format"
  + Quelques options de format utiles :
    + %H Somme de contrôle du commit.
    + %h Somme de contrôle abrégée du commit.
    + %an Nom de l'auteur.
    + %ae E-mail de l'auteur.
    + %ad Date de l'auteur (au format de l'option -date=).
    + %ar Date relative de l'auteur.
    + %s Sujet.
  + Exemple :
    + git log --pretty=format:"%h - %an, %ar : %s"

+ ** Ajout d'un graphe ASCII pour décrire l'historique des branches (option --graph). **
git log --pretty=format:"%h %s" --graph

+ ** Afficher l'historique des 2 dernières semaines (par exemple). **
  + git log --since=2.weeks
  + A l'inverse --until (ou --before) permettra d'indiquer une date limite.
  + Il est possible d'indiquer une date précise (2014-02-25) ou une date relative comme dans l'exemple ci-dessus.
  + Pour limiter l'historique aux commit concernant un fichier ou un répertoire, indiquer son chemin en fin de commande en le précédant de -- .
  + Exemple :
    + git log -- répertoire/

+ ** Afficher l'historique d'un auteur donné. **
git log --author=nom_de_l_auteur

+ ** Chercher les commits ayant un mot-clé dans leur message de validation. **
git log --grep=ma_recherche
Si vous souhaitez mixer plusieurs critères de recherche utilisez l'option --all-match pour qu'ils soient tous pris en compte. Sinon tout commit répondant à au moins un des critères de recherche sera retourné en résultat.
Pour visualisez l'historique dans Gitk (outil graphique par défaut fourni avec Git), lancez le simplement : ** gitk **

+ ** Historique d'où est passé HEAD. **
git reflog

+ ** Afficher le 5ème commit de l'historique de HEAD. **
git show HEAD@{5}

+ ** Afficher le deuxième parent d'un commit donné (si plusieurs parents après une fusion). **
git show somme_de_contrôle^2

+ ** Afficher le 5ème ascendant du commit actuel. **
git show HEAD~5

+ ** Supprimer un fichier de l'historique. **
git filter-branch --tree-filter 'rm -f nom_du_fichier_à_supprimer' HEAD

+ ** Supprimer tous les fichiers temporaires (par exemple). **
git filter-branch --tree-filter "find * -type f -name '*~' -delete" HEAD
Ajouter l'option --all à filter-branch pour lancer l'opération sur toutes les branches. 

+ ** Voir les derniers commits concernant un fichier entre les lignes 10 et 30. **
git blame -L 10,30 nom_fichier_à_inspecter
L'option -C permet de savoir si une partie du code a été recopié d'un autre fichier et si oui lequel.

+ ** Effectuer une recherche dichotomique pour trouver l'origine d'un bug. **
+ git bisect start
+ git bisect bad
+ git bisect good étiqette_version_qui_fonctionnait
+ Alterner ensuite les git bisect good et git bisect bad jusqu'à trouver le coupable...
+ Une fois fini : git bisect reset
+ Pour automatiser la recherche avec un script de test.
  + git bisect start HEAD étiqette_version_qui_fonctionnait
  + git bisect run script_de_test.sh
  + Le script doit retourner 0 s'il est bon et autre chose sinon.

Les étiquettes.
---------------

+ ** Lister vos étiquettes. **
git tag
Les étiquettes sont alors listées par ordre alphabétique.

+ ** Lister les étiquettes commençant par '1.' (par exemple). **
git tag -l '1.*'

+ ** Créer une étiquette annotée. **

git tag -a nom_étiquette -m "message d'étiquetage"
Si le message d'étiquetage n'est pas précisé, Git lance l'éditeur par défaut pour demander sa saisie.
Pour signer l'étiquette avec GPG, remplacez l'option -a par -s (vous devez avoir une clé privée).

+ ** Vérifier une étiquette signée. **
git tag -v nom_étiquette
Pour que cela fonctionne vous devez avoir la clé publique du signataire dans votre trousseau.

+ ** Voir les informations d'une étiquette annotée. **
git show nom_de_l_étiquette

+ ** Créer une étiquette légère. **
git tag nom_étiquette

+ ** Créer une étiquette pour un commit passé. **
git tag -a nom_étiquette -m 'message étiquetage' somme_de_contrôle_du_commit

+ ** Voir l'historique depuis une version (étiquette) donnée. **
git shortlog --no-merges branche_concernée --not nom_étiquette
 

Les remises.
-----------

+ ** Remiser son travail sans enregistrer de commit. **
git stash

+ ** Voir la liste des remises.           **
git stash list

+ ** Appliquer la dernière remise. **
git stash apply

+ ** Appliquer une remise plus ancienne (ici numéro 2). **
git stash apply stash@{2}
-> La remise s'applique sur la branche sur laquelle on se situe (tentative de fusion).
-> L'option --index permet de récupéré la liste des fichiers indexés lors de la remise.

+ ** Supprimer une remise. **
git stash drop

+ ** Appliquer une remise et la supprimer en même temps. **
git stash pop

+ ** Annuler l'application d'une remise. **
git stash show -p stash@{0} | git apply -R
Pour la remise la plus récente : git stash show -p | git apply -R

