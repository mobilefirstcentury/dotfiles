AIDE NODE GH
============

Client github en mode console


## Table of contents

* [Help](#help)
* [Pull requests](#pull-requests)
* [Notifications](#notifications)
* [Issues](#issues)
* [Repo](#repo)
* [Gists](#gists)
* [User](#user)
* [Alias](#alias)


## Help

gh help           -> general help
gh help --all     -> List all comands options.
gh help <command> -> List specific command options.


## Pull requests

`gh pull-request` OR `gh pr`

### General options

`-u`, `--user`    | *Required*   | `String`
`-I`, `--info`    | *Required*   | `Boolean`
`-n`, `--number`  | *Required*   | `String`
`-r`, `--repo`    | *Optional*   | `String`

### 1. List

`-l`, `--list`    | **Required** | `Boolean`
`-a`, `--all`     | *Optional*   | `Boolean`
`-O`, `--org`     | *Optional*   | `String`
`-m`, `--me`      | *Optional*   | `Boolean`
`-d`, `--detailed`| *Optional*   | `Boolean`
`--direction`     | *Optional*   | [`asc`, `desc`]
`-b`, `--branch`  | *Optional*   | `String`
`--remote`        | *Optional*   | `String`
`-r`, `--repo`    | *Optional*   | `String`
`--sort`          | *Optional*   | [`created`, `updated`, `popularity`, `long-running`, `complexity`]
`-S`, `--state`   | *Optional*   | [`open`, `closed`]
`-u`, `--user`    | *Optional*   | `String`

#### examples

gh pr                                            -> list open pull requests for the current repository.
gh pr --info number                              -> Get information about a pull request.
gh pr --list --all                               -> List open pulls requests for all branches from all your repositories.
gh pr --list --all --org github                  -> List open pull requests sent by logged user on current repository.
gh pr --list --me                                -> List open pull requests sent by logged user on current repository.
gh pr --list --detailed                          -> List open pull requests with link and content.
gh pr --list --branch master                     -> List open pull requests for a branch.
gh pr --list --sort popularity                   -> List open pull requests and sort them by popularity *(comment count)*.
gh pr --list --sort long-running --direction asc -> List open pull requests and sort them by asc long-running *(old but still active)*.
gh pr --list --sort complexity                   -> List open pull requests and sort them by complexity *(complexity is calculated based on number of additions, deletions, changed files, comments and review comments)*.

### 2. Fetch

`-f`, `--fetch`  | **Required** | `Boolean`
`-n`, `--number` | **Required** | `Number`
`-M`, `--merge`  | *Optional*   | `Boolean`
`-R`, `--rebase` | *Optional*   | `Boolean`
`--remote`       | *Optional*   | `String`
`-r`, `--repo`   | *Optional*   | `String`
`-u`, `--user`   | *Optional*   | `String`

**Examples**

gh pr 1                  -> **Shortcut** for fetching pull request and checkout into a new branch `pr-1`.
gh pr 1 --fetch --rebase -> Fech pull request rebasing ing into the current branch.
gh pr 1 --fetch --merge  -> Fech pull request merging into the current branch.

### 3. Merge or rebase

`-M`, `--merge`  | **Required** | `Boolean`
`-R`, `--rebase` | **Required** | `Boolean`
`-n`, `--number` | *Optional*   | `Number`
`-b`, `--branch` | *Optional*   | `String`
`--remote`       | *Optional*   | `String`
`-r`, `--repo`   | *Optional*   | `String`
`-u`, `--user`   | *Optional*   | `String`

Omitting `--number` will try to guess the pull number from branch name e.g. `pr-1` results in `--number 1`. Omitting `--branch` will merge or rebase into `config.default_branch`.

**Examples**

gh pr 1 --fetch --merge               -> Merge pull request into a branch.
gh pr 1 --fetch --rebase              -> Rebase pull request into a branch.
gh pr 1 --fetch --rebase --branch dev -> Merge pull request into branch `dev`.
gh pr 1 --fetch --merge --branch dev  -> Rebase pull request into branch `dev`.

### 4. Comment

`-c`, `--comment`| **Required** | `String`
`-n`, `--number` | **Required** | `Number`
`--remote`       | *Optional*   | `String`
`-r`, `--repo`   | *Optional*   | `String`
`-u`, `--user`   | *Optional*   | `String`

**Examples**

gh pr 1 --comment "Merged, thank you!" -> Comment on a pull request.

### 5. Forward

`--fwd`          | **Required** | `String`
`-n`, `--number` | **Required** | `Number`

Omitting a value for `--fwd` fallbacks to the `default_pr_forwarder` key found in your [config file](#config).

**Examples**

gh pr 1 --fwd username -> Forward a pull request to another reviewer.

### 6. Open or close

`-o`, `--open`   | **Required** | `Boolean`
`-C`, `--close`  | **Required** | `Boolean`
`-n`, `--number` | **Required** | `Number`
`--remote`       | *Optional*   | `String`
`-r`, `--repo`   | *Optional*   | `String`
`-u`, `--user`   | *Optional*   | `String`

**Examples**

gh pr 1 --open                         -> Open a pull request.
gh pr 1 --close                        -> Open a pull request.
gh pr --close --number 1 --number 2    -> Close multiple pull requests.
gh pr --open --number 1 --number 2     -> Open multiple pull requests.
gh pr 1 --close --user eduardolundgren -> Open or close a pull request that you've sent to someone.

### 7. Submit

`-s`, `--submit`        | **Required** | `String`
`-b`, `--branch`        | *Optional*   | `String`
`-D`, `--description`   | *Optional*   | `String`
`-i`, `--issue`         | *Optional*   | `Number`
`-r`, `--repo`          | *Optional*   | `String`
`-t`, `--title`         | *Optional*   | `String`

Omitting a value for `--submit` fallbacks to the `default_pr_reviewer` key found in your [config file](#config). 
Omitting `--title` will submit a pull request using the last commit message as title.

**Examples**

gh pr --submit eduardolundgren --title 'Fix #32' --description 'Awesome fix' -> Submit a pull request using the current branch.
gh pr --submit eduardolundgren --branch dev                                  -> Submit a pull request using the current branch to dev branch.
gh pr --submit eduardolundgren --issue 150                                   -> Submit a pull request from a issue.

### 8. Open in Browser

`-B`, `--browser`      | **Required** | `Boolean`
`-n`, `--number`       | **Required** | `Number`
`-u`, `--user`         | *Optional*   | `String`
`-r`, `--repo`         | *Optional*   | `String`

**Examples**

gh pr 100 --browser -> Open GitHub pull request page in the browser.

## Notifications

`gh notification` OR `gh nt`

### 1. Latest

`-l`, `--latest` | **Required** | `Boolean`
`--remote`       | *Optional*   | `String`
`-r`, `--repo`   | *Optional*   | `String`
`-u`, `--user`   | *Optional*   | `String`

**Examples**

gh nt                                                -> **Shortcut** for displaying the latest activities on the current repository.
gh nt --latest --user eduardolundgren --repo node-gh -> Display the latest activities on a certain repository.


### 2. Watch

`-w`, `--watch`  | **Required** | `Boolean`
`--remote`       | *Optional*   | `String`
`-r`, `--repo`   | *Optional*   | `String`
`-u`, `--user`   | *Optional*   | `String`

**Examples**

gh nt --watch                                       -> Watch for any activity on the current repository.
gh nt --watch --user eduardolundgren --repo node-gh -> Watch for any activity on a certain repository.

## Issues

`gh issue` OR `gh is`


### 1. Create

`-N`, `--new`     | **Required** | `Boolean`
`-t`, `--title`   | **Required** | `String`
`-A`, `--assignee`| *Optional*   | `String`
`-L`, `--label`   | *Optional*   | `String`
`-m`, `--message` | *Optional*   | `String`
`--remote`        | *Optional*   | `String`
`-r`, `--repo`    | *Optional*   | `String`
`-u`, `--user`    | *Optional*   | `String`

**Examples**

gh is 'Node GH rocks!' 'Body with **Markdown** support'                                                               -> **Shortcut** for creating a new issue on the current repository.
gh is --new --title 'Node GH rocks!' --message 'Body with **Markdown** support' --user eduardolundgren --repo node-gh -> Create a new issue on a certain repository.
gh is --new --title 'Node GH rocks!' --label bug,question,test                                                        -> Create a new issue with labels.
gh is --new --title 'Node GH rocks!' --assignee zenorocha                                                             -> Create a new issue and assign it to someone.


### 2. Comment

`-c`, `--comment` | **Required** | `String`
`-n`, `--number`  | **Required** | `Number`
`--remote`        | *Optional*   | `String`
`-r`, `--repo`    | *Optional*   | `String`
`-u`, `--user`    | *Optional*   | `String`

**Examples**

gh is 1 --comment 'Node GH rocks!'                                       -> Comment on an issue of the current repository.
gh is 1 --comment 'Node GH rocks!' --user eduardolundgren --repo node-gh -> Comment on an issue of a certain repository.

### 3. Open or close

`-o`, `--open`   | **Required** | `Boolean`
`-C`, `--close`  | **Required** | `Boolean`
`-n`, `--number` | **Required** | `Number`
`--remote`       | *Optional*   | `String`
`-r`, `--repo`   | *Optional*   | `String`
`-u`, `--user`   | *Optional*   | `String`

**Examples**

gh is 1 --open                         -> Open an issue.
gh is 1 --close                        -> Close an issue.
gh is --close --number 1 --number 2    -> Close multiple issues.
gh is --open --number 1 --number 2     -> Open multiple issues.
gh is 1 --close --user eduardolundgren -> Open or close an issue that you've sent to someone.

### 4. List
---                | ---          | ---
`-l`, `--list`     | **Required** | `Boolean`
`-a`, `--all`      | *Optional*   | `Boolean`
`-A`, `--assignee` | *Optional*   | `String`
`-d`, `--detailed` | *Optional*   | `Boolean`
`-L`, `--label`    | *Optional*   | `String`
`-M`, `--milestone`| *Optional*   | [`Number`, `String`]
`--remote`         | *Optional*   | `String`
`-r`, `--repo`     | *Optional*   | `String`
`-S`, `--state`    | *Optional*   | [`open`, `closed`]
`-u`, `--user`     | *Optional*   | `String`

**Examples**

gh is                                              -> **Shortcut** for listing all issues on the current repository.
gh is --list --all                                 -> List all issues from all repositories.
gh is --list --assignee zenorocha                  -> List issues assigned to someone.
gh is --list --detailed                            -> List issues with link and content.
gh is --list --state closed                        -> List only closed issues on the current repository.
gh is --list --milestone 1                         -> List issues filtered by milestone.
gh is --list --label todo,bug                      -> List issues that contains labels `todo` and `bug`.
gh is --list --user eduardolundgren --repo node-gh -> List all issues on a certain repository.

### 5. Open in Browser

`-B`, `--browser`      | **Required** | `Boolean`
`-n`, `--number`       | **Required** | `Number`
`-u`, `--user`         | *Optional*   | `String`
`-r`, `--repo`         | *Optional*   | `String`

**Examples**

gh is 100           -> **Shortcut** for opening GitHub issue page in the browser.
gh is 100 --browser -> Open GitHub issue page in the browser.

## Repo

`gh repo` OR `gh re`

### 1. Open in Browser

`-B`, `--browser`      | **Required** | `Boolean`
`-u`, `--user`         | *Optional*   | `String`
`-r`, `--repo`         | *Optional*   | `String`

**Examples**

gh re                                                 -> **Shortcut** for opening the GitHub repository page in the browser.
gh re --browser --user eduardolundgren --repo node-gh -> Open GitHub repository page in the browser.

### 2. List

`-l`, `--list`         | **Required** | `Boolean`
`-d`, `--detailed`     | *Optional*   | `Boolean`
`-u`, `--user`         | *Optional*   | `String`
`-t`, `--type`         | *Optional*   | [`all`, `owner`, `public`, `private`, `member`]

**Examples**

gh re --list                  -> List all repositories.
gh re --list --type private   -> List all private repositories.
gh re --list --user zenorocha -> List all repositories from someone.

### 3. Create
[TODO][ISSUE]
  - il y a un bug dans la version 1.12.6 qui force l'ouverture du browser même avec un 'gh re --browser false'
  - il y une [issue](https://github.com/node-gh/gh/issues/424) ouverte
  - en attendant j'ai fait un hack dans le code du module en local (dans ~/.nvm/versions/node/v5.0.0/lib/node_modules/gh/lib/cmds/repo.js )

`-N`, `--new`         | **Required** | `String`
`--organization`      | *Optional*   | `String`
`-c`, `--clone`       | *Optional*   | `Boolean`
`-t`, `--type`        | *Optional*   | [`private`]
`--init`              | *Optional*   | `Boolean`
`--gitignore`         | *Optional*   | `String`
`--homepage`          | *Optional*   | `String`
`--description`       | *Optional*   | `String`

**Examples**

gh re --new foo --clone                -> Create a new GitHub repository and clone on the current directory.
gh re --new foo --organization node-gh -> Create a new GitHub repository for an organization.
gh re --new gemified --gitignore Ruby  -> Create a new GitHub repository using .gitignore template for Ruby.
gh re --new foo --init --type private  -> Create a new private repository on GitHub, initializing it with a initial commit of the README.

### 4. Fork

`-f`, `--fork`        | **Required** | `String`
`-u`, `--user`        | **Required** | `String`
`-O`, `--organization`| **Optional** | `Boolean`

**Examples**

gh re --fork repo --user user                        -> Fork a GitHub repository.
gh re --fork repo --user user --organization node-gh -> Fork a GitHub repository into the node-gh organization.

### 5. Delete

`-D`, `--delete`      | **Required** | `String`
`-u`, `--user`        | **Required** | `String`

#### Example

gh re --delete foo -> Delete a repository of the logged user.

## Gists

`gh gists` OR `gh gi`

### 1. Open in Browser

`-B`, `--browser`      | **Required** | `Boolean`
`-u`, `--user`         | *Optional*   | `String`
`-i`, `--id`           | *Optional*   | `String`

**Examples**

gh gi                        -> **Shortcut** for opening your Gists in the browser.
gh gi --browser --id 5991877 -> Open a Gist in the browser.

### 2. List

`-l`, `--list`         | **Required** | `Boolean`
`-u`, `--user`         | *Optional*   | `String`

**Examples**

gh gi --list                    -> List all gists.
gh gi --list --user brunocoelho -> List all gists from someone.

### 3. Create

`-N`, `--new`         | **Required** | `String`
`-c`, `--content`     | *Optional*   | `String`
`-d`, `--description` | *Optional*   | `String`
`-p`, `--private`     | *Optional*   | `Boolean`

**Examples**

gh gi --new hello --content "Hello World!"           -> Create a Gist `hello` containing "Hello World".
gh gi --new hello --content "Hello World!" --private -> Create a private Gist `hello` containing "Hello World".

### 4. Fork

`-f`, `--fork`        | **Required** | `String`

**Examples**

gh gi --fork 5444883 -> Fork a Gist.

### 5. Delete

`-D`, `--delete`      | **Required** | `String`

#### Example

gh gi --delete 4252323                  -> Delete a Gist.
gh gi --delete 4252321 --delete 4252322 -> Delete multiple Gists.

## User

`gh user` OR `gh us`

### 1. Login/Logout

`-l`, `--login`   | **Required** | `Boolean`
`-L`, `--logout`  | **Required** | `Boolean`

**Examples**

gh user --login -> Login or show current logged in GitHub user.
gh user --logout -> Logout current GitHub account.

### 2. Whoami

`-w`, `--whoami`   | **Required** | `Boolean`

**Examples**

gh user --whoami -> Prints your username to stdout.

## Alias

`gh alias` OR `gh al`

### 1. List

`-l`, `--list`    | **Required** | `Boolean`

**Examples**

gh alias -> **Shortcut** for listing aliases.
gh alias --list -> List aliases.

### 2. Add

`-a`, `--add`     | **Required** | `String`
`-u`, `--user`    | **Required** | `String`

**Examples**

gh alias --add zeno --user zenorocha -> Create alias for username.

### 3. Remove

`-r`, `--remove`  | **Required** | `String`

**Examples**

gh alias --remove zeno -> Remove alias.
