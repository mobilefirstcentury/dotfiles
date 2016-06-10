---- npm cheatsheet ----
=======================


npm configuration (local)
------------------

  ```sh
  # set default values for new pakage.json files
  npm set init.author.name "Brent Ertz"
  npm set init.author.email "brent.ertz@gmail.com"
  npm set init.author.url "http://brentertz.com"
  ```


project initialisation
----------------------

```sh
$ mkcd <project-name>   # create the project dir
$ npm init -y /dev/null # initialize package.json with default values

```
publish module
--------------
[TODO] https://gist.github.com/coolaj86/1318304


development workflow
--------------------
[TODO] A compléter

### npm link
When developping a module, don't install it for testing purpose, just link it.

    ```sh
    npm link (in package dir)
    npm link [<@scope>/]<pkg>[@<version>]

    alias: npm ln
    ```

#### standard workflow
    ```sh
    $ cd <module-project>
    $ `npm link`                 // create a globally-installed symbolic link to the current folder 
    $ cd <testing-folder> 
    $ `npm link package-name`    // create a symlink from the local `node_modules` folder to the global symlink.
                                  // note `package-name` is taken from `package.json`, not from directory name.
    ```
**note** `npm publish` is link-aware

#### shortcut workflow

    ```sh
    cd ~/projects/node-bloggy  # go into the dir of your main project
    npm link ../node-redis     # link the dir of your dependency
                               # this is equivlant to : 
                               #    cd ../node-redis: npm link;
                               #    cd -; npm link node-redis
    ```



NPM Command Lines.
------------------

npm <cmd> -h                                            # quick help on <cmd>
npm -l                                                  # display full usage info
npm adduser                                             # add a registry user account
npm bin                                                 # display npm bin folder
npm bugs <pkgname>                                      # bugs for a package in a web browser maybe
npm build <package-folder>                              # build a package (should not be called directly)
npm cache [add|ls|clean] <tarball|folder>               # manipulates packages cache
npm config [set|get|delete|list|edit] <key> <value>     # manage the npm configuration files
npm dedupe [package names...]  --tag                    # reduce duplication
npm decrecate <name>[@<version>] <message>              # deprecate a version of a package (must be the package owner)
npm docs [<pkg-name> [<pkg-name> ...]]                  # docs for a package in a web browser maybe
npm edit <name>[@<version>]                             # edit an installed package (default EDITOR set to "vi")
npm explore <name>[@<version>] [ -- <cmd>]              # browse an installed package
npm faq                                                 # commonly asked questions
npm help-search <some search terms>                     # search npm help documentation (rarely necessary to call directly)
npm help <topic> <some search terms>                    # get help on npm
npm init                                                # interactively create a package.json file
npm install <folder|name@<tag|version>|tarball>         # install a package (optional flags: --save, --save-dev, --save-optional, --save-exact)
npm link <pkgname>                                      # symlink a package folder
npm ls <pkg>                                            # list installed packages (as well as their dependencies)
npm outdated [<name> [<name> ...]]                      # check for outdated packages
npm owner [ls|add|rm] <pkg-name> <user>                 # manage package owners
npm pack [<pkg> [<pkg> ...]]                            # create a tarball from a package
npm prefix                                              # display prefix
npm prune [<name> [<name ...]] --production             # remove extraneous packages
npm publish <tarball|folder> [--tag <tag>]              # publish a package
npm rebuild [<name > [<name> ...]]                      # rebuild a package
npm repo <pkgname>                                      # open package repository in the browser
npm restart <name>                                      # start a package
npm rm <name>                                           # remove a package
npm root                                                # display npm root
npm run [<pkg>] [command]                               # run arbitrary package scripts
npm search [search terms ...] [--long]                  # search for packages. Very slow and RAM hungry
npm shrinkwrap                                          # lock down dependency versions
npm star <pkgname> [<pkg>, ...]                         # mark your favorite packages
npm stars [username]                                    # view packages marked as favorites
npm start <name>                                        # start a package
npm stop <name>                                         # stop a package
npm submodule <pkg>                                     # add a package as a git submodule
npm tag <name>@<version>                                # tag a published version
npm test <name>                                         # test a package
npm unpublish <name>[@<version>]                        # remove a package from the registry
npm unstar <pkgname> [<pkg>, ...]                       # Unfavorite specified p
npm update [-g] [<name> [<name> ...]]                   # update a package
npm version [<newversion> | major | minor | patch]      # bump a package version
npm view <pkgname> description                          # display package description 
npm view <name>[@<version>] [<field<[.<subfield>] ...]  # view registry info
npm whoami                                              # display npm username NPM CheatSheet.

NPM API Documentation.
----------------------

// Prior to using NPM's commands, `npm.load()` must be called.

npm.load(configs, callback);                                       // load config settings
npm.commands.bin(args, callback);                                  // display npm bin folder
npm.commands.bugs(package, callback);                              // bugs for a package in a web browser maybe
npm.commands.cache([args], callback);                              // manage the npm cache programatically
npm.commands.cache.clean([args], callback);                        // helper
npm.commands.cache.add([args], callback);                          // helper
npm.commands.cache.read(name, version, forceBypass, callback);     // helper
npm.commands[<command>](args, callback);                           // npm commands
npm.commands.config(args, callback);                               // manage the npm configuration files
npm.config.get(key);                                               // get a config key
npm.config.set(key, value);                                        // set a config key
npm.commands.deprecate(args, callback);                            // deprecate a version of a package
npm.commands.docs(package, callback);                              // docs for a package in a web browser maybe
npm.commands.edit(package, callback);                              // edit an installed package
npm.commands.explore(args, callback);                              // browse an installed package
npm.commands.helpSearch(args, [silent,] callback);                 // search the help pages
npm.commands.init(args, callback);                                 // interactively create a package.json file
npm.commands.install([where,] packages, callback);                 // install a package programatically
npm.commands.link([packages,] callback);                           // symlink a package folder
npm.commands.ls(args, [silent,] callback);                         // list installed packages
npm.commands.outdated([packages,] callback);                       // check for outdated packages
npm.commands.owner(args, callback);                                // manage package owners
npm.commands.pack([packages,] callback);                           // create a tarball from a package
npm.commands.prefix(args, callback);                               // display prefix
npm.commands.prune([packages,] callback);                          // remove extraneous packages
npm.commands.publish([packages,] callback);                        // publish a package
npm.commands.rebuild([packages,] callback);                        // rebuild a package
npm.commands.repo(package, callback);                              // open package repository page in the browser
npm.commands.restart(packages, callback);                          // start a package
npm.commands.root(args, callback);                                 // display npm root
npm.commands.run-script(args, callback);                           // run arbitrary package scripts
npm.commands.search(searchTerms, [silent,] [staleness,] callback); // search for packages
npm.commands.shrinkwrap(args, [silent,] callback);                 // programmatically generate package shrinkwrap file
npm.commands.start(packages, callback);                            // start a package
npm.commands.stop(packages, callback);                             // stop a package
npm.commands.submodule(packages, callback);                        // add a package as a git submodule
npm.commands.tag(package@version, tag, callback);                  // tag a published version
npm.commands.test(packages, callback);                             // test a package
npm.commands.uninstall(packages, callback);                        // uninstall a package programmatically
npm.commands.unpublish(package, callback);                         // remove a package from the registry
npm.commands.update(packages, callback);                           // update a package
npm.commands.version(newversion, callback);                        // bump a package version
npm.commands.view(args, [silent,] callback);                       // view registry info
npm.commands.whoami(args, callback);                               // display npm username

npm package JSON Specification
------------------------------

{
  "name": "module-name",
  "version": "10.3.1",
  "description": "An example module to illustrate the usage of a package.json",
  "author": "Your Name <you.name@example.org>",
  "contributors": [{
    "name": "Foo Bar",
    "email": "foo.bar@example.com"
  }],
  "bin": {
    "module-name": "./bin/module-name"
  },
  "script": {
    "test": "vows --spec --isolate",
    "start": "node index.js",
    "predeploy": "echo im about to deploy",
    "postdeploy": "echo ive deployed",
    "prepublish": "coffee --bare --compile --output lib/foo src/foo/*.coffee"
  },
  "main": "lib/foo.js",
  "repository": {
    "type": "git",
    "url": "https://github.com/nodejitsu/browsenpm.org"
  },
  "bugs": {
    "url": "https://github.com/nodejitsu/browsenpm.org/issues"
  },
  "keywords": [
    "nodejitsu",
    "example",
    "browsenpm"
  ],
  "dependencies": {
    "primus": "*",
    "async": "~0.8.0",
    "express": "4.2.x",
    "winston": "git://github.com/flatiron/winston#master",
    "bigpipe": "bigpipe/pagelet",
    "plates": "https://github.com/flatiron/plates/tarball/master"
  },
  "devDependencies": {
    "vows": "^0.7.0",
    "assume": "<1.0.0 || >=2.3.1 <2.4.5 || >=2.5.2 <3.0.0",
    "pre-commit": "*"
  },
  "preferGlobal": true,
  "private": true,
  "publishConfig": {
    "registry": "https://your-private-hosted-npm.registry.nodejitsu.com"
  },
  "subdomain": "foobar",
  "analyze": true,
  "license": "MIT"
}


install private NPM repository
-----------------------------

[TODO] 
  - faire le `npm set registery` dans ~/.zshrc 
  - trouver un moyen de se passer de la création du user dans Sinopia

### what is it?
We use **Sinopia** to have a private NPM repository running on the workstation.
With a local private NPM repository we don't need to download module each time we want to use them.
It also allows to install npm modules even if the workstation is offline (if the module has already been used by another project)

### use
#### browse local npm registery
  # simply visit  'http://npmjs.local.mfc' (`http://localhost:4873/`)
  # login with rachid/rachid account

#### install npm module
  # check that we're pointing to local registery
  $ npm config get registry
  # just use npm install normally ...
  $ npm install [-S|-D] module-name

  # or use a local package (that will exist only on the local sinopia)
  $ npm install [-S|-D] @local/module-name


#### require npm module
  # check that we're pointing to local registery
  $ npm config get registry
  # just require normaly
  $ require('module-name')

  # or use a local package (that will exist only on the local sinopia)
  $ require('@local/module-name')

#### publish/unpublish npm module
##### local modules
  # Scoped package are private (and then local) by default 
  # use 'local' scope for local modules (modules that exist only on the workstation)
  # with init:
  $ npm init --scope=local
  # with package json:
  $ name: @local/module-name
  # publish (locally)
  $ npm publish                  # from project directory
  # unpublish from local npm registery
  $ npm unpublish --force       # from project directory


### install & first configuration
#### module installation
  ```sh
  # install sinopia globally
  $ npm i -g sinopia  
  ```
#### configure sinopia as autostarting service

[TODO] 
1. trouver une solution plus propre pour le problème du PATH de pm2
2. actuellement la version par défaut (gérée par nvm) de node sur la workstation est la 5.0.
  - Vérifier que tout marche bien si on décide de passer à une version par défaut plus récente (pm2 est lancé depuis un script init.d qui référence `.nvm/versions/node/v5.0.0/` en dur)
3. Vérifier si on peut avoir (et si c'est judicieux) des crédentials d'un user 'user/user' préhashés dans ~/.npmrc et d'avoir ce fichier dans les logfiles
4. Ou alors générer automatiquement le user au moment de l'installation (regarder le plugin auth de sinopia)

  ```sh
  # Install pm2 process manager (see ~help/pm2.md)
  
  # launch sinopia: by default it will listen on npm set registry http://localhost:4873/
  $ pm2 start `which sinopia`  
  
  # point npm to the local registery instead of the public one
  $ npm set registry http://localhost:4873/    # to undo that, simply do: `npm set registry "http://registry.npmjs.org"`
  
  # add a user to sinopia. 
  # AS this is **local** npm registery authenfication is not unneeded. But i found no way to avoid that.
  # WARNING: MUST BE DONE MANUALLY as it takes credentials from prompts
  # we create a user :    login: user, password: user 
  # As the credentials hashs are saved in ~/.npmrc we could certainly have this file in dotfiles with a prehashed silly user (user/user)
  $ npm login --registry http://localhost:4873
  # enter user/user
  ```


### advanced config
configuration options are in `~/.config/sinopia/config.yaml`

