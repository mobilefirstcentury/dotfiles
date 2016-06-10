---- Ohmyzsh Cheatsheet ----
=============================

[TODO]
  - vérifier si ça vaut le coût de remplacer oh-my-zsh par: 
    + [zplug](https://github.com/zplug/zplug)
    + [Prezto](https://github.com/sorin-ionescu/prezto)

Commands
--------

  Command                    Description
  -------------------------- ---------------------------------------------------------------------------------------------------------------
  tabs                     Create a new tab in the current directory (OS X - req enabling access for assistive devices under sys prefs).
  take                     Create a new directory and change to it, will create intermediate directories as required.
  x / extract            Extract an archive (supported types: tar.{bz2,gz,xz,lzma}, bz2, rar, gz, tar, tbz2, tgz, zip, Z, 7z).
  zsh_stats                Get a list of the top 20 commands and how many times they have been run.


alias 
-----
**note** See `~/.oh-my-zsh/lib/directories.zsh`

  ..        cd ..
  ...       cd ../..
  ....      cd ../../..
  .....     cd ../../../..
  /         cd /
  cd +n   switch to directory number `n`
  1       cd -
  2       cd +2
  3       cd +3
  4       cd +4
  5       cd +5
  6       cd +6
  7       cd +7
  8       cd +8
  9       cd +9
  md      mkdir -p
  rd      rmdir
  d       dirs -v (lists last used directories)




Tab-completion
--------------
  ls -<tab><tab>
  cd -<tab><tab>

[TODO] je n'ai pas compris comment ça marche
  ssh <tab>
  sudo umount <tab>
  kill <tab>
  unrar <tab>

Git
---
**note** You also find these commands in Dash as a Cheat-sheet.

  functions
  -----------------------------------------------------------------------------------------------------
  current_branch        # function returning current branch 
                        # example use: git pull origin \$(current_branch)
                        #              grb publish \$(current_branch) origin

  Alias                    Command
  ------------------------ ----------------------------------------------------------------------------
  g                      git
  ga                     git add
  gaa                    git add --all
  gapa                   git add --patch
  gb                     git branch
  gba                    git branch -a
  gbr                    git branch --remote
  gc                     git commit -v
  gc!                    git commit -v --amend
  gca                    git commit -v -a
  gca!                   git commit -v -a --amend
  gcl                    git config --list
  gclean                 git clean -fd
  gpristine              git reset --hard && git clean -dfx
  gcm                    git checkout master
  gcmsg                  git commit -m
  gco                    git checkout
  gcount                 git shortlog -sn
  gcp                    git cherry-pick
  gcs                    git commit -S
  gd                     git diff
  gdca                   git diff --cached
  gdt                    git diff-tree --no-commit-id --name-only -r
  gdt                    git difftool
  gfa                    git fetch --all --prune
  gg                     git gui citool
  gga                    git gui citool --amend
  ggpnp                  git pull origin \$(current_branch) && git push origin \$(current_branch)
  ggpull                 git pull origin \$(current_branch)
  ggl                    git pull origin \$(current_branch)
  ggpur                  git pull --rebase origin \$(current_branch)
  glum                   git pull upstream master
  ggpush                 git push origin \$(current_branch)
  ggp                    git push origin \$(current_branch)
  ggsup                  git branch --set-upstream-to=origin/\$(current_branch)
  gignore                git update-index --assume-unchanged
  gignored               git ls-files -v
  git-svn-dcommit-push   git svn dcommit && git push github master:svntrunk
  gk                     gitk --all --branches
  gl                     git pull
  glg                    git log --stat --max-count = 10
  glgg                   git log --graph --max-count = 10
  glgga                  git log --graph --decorate --all
  glo                    git log --oneline --decorate --color
  glog                   git log --oneline --decorate --color --graph
  glp                    _git_log_prettily (git log --pretty=\$1)
  gm                     git merge
  gmt                    git mergetool --no-prompt
  gp                     git push
  gpoat                  git push origin --all && git push origin --tags
  gr                     git remote
  grba                   git rebase --abort
  grbc                   git rebase --continue
  grbi                   git rebase -i
  grh                    git reset HEAD
  grhh                   git reset HEAD --hard
  grmv                   git remote rename
  grrm                   git remote remove
  grset                  git remote set-url
  grt                    cd \$(git rev-parse --show-toplevel || echo ".")
  grup                   git remote update
  grv                    git remote -v
  gsd                    git svn dcommit
  gsps                   git show --pretty = short --show-signature
  gsr                    git svn rebase
  gss                    git status -s
  gst                    git status
  gsta                   git stash
  gstd                   git stash drop
  gstp                   git stash pop
  gsts                   git stash show --text
  gts                    git tag -s
  gunignore              git update-index --no-assume-unchanged
  gunwip                 git log -n 1
  gup                    git pull --rebase
  gvt                    git verify-tag
  gwch                   git whatchanged -p --abbrev-commit --pretty = medium
  gwip                   git add -A; git ls-files --deleted -z


Editors
-------

  Alias   Command
  ------- --------------------------------------------------------------------------
  stt   (When using `sublime` plugin) Open current directory in Sublime Text 2/3
  v     (When using `vi-mode` plugin) Edit current command line in Vim



Systemd
-------

### systemctl

  Command             Description
  ------------------- ------------------------------------------
  sc-status NAME    show the status of the NAME process
  sc-show NAME      show the NAME systemd .service file
  sc-start NAME     start the NAME process
  sc-stop NAME      stop the NAME process
  sc-restart NAME   restart the NAME process
  sc-enable NAME    enable the NAME process to start at boot
  sc-disable NAME   disable the NAME process at boot



Maintenance
-----------------
  uninstall_oh_my_zsh   Uninstall Oh-my-zsh.
  upgrade_oh_my_zsh     Upgrade Oh-my-zsh.
