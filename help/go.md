---- GO User Guide ----
====================

Go is a modern language developped by google.

Install
-------
**note** we use GVM to be able to switch working go version 

  # use install script
  $ bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)         
  # export env variables in ~/.zshrc
  $ source /home/rachid/.gvm/scripts/gvm  

Use gvm 
-------

  # list available go versions
  $ gvm listall
  # list installed go versions
  $ gvm list


install Go version
------------------
[TODO]
  - ici on fait des installations en binaire. 
  - apparemment pour installer go +1.5.x depuis les sources cela demande une procédure particuliere
  - voir:
    + [ici]](https://pages.18f.gov/dev-environment-standardization/languages/go/)
    + et [ici](http://dairon.org/2016/02/21/setting-up-a-golang-dev-environment-on-ubuntu/)

  # install a go version  (binary installation)
  $ gvm install go1.6.2 -B     

switch go version
-------------------

  # set a go version as the default 
  $ gvm use go1.6.2 --default 

  # switch current go version
  $ gvm use go1.6.2 


package management
-----------------

### go workspaces concept
  - packages source code is installed under '$GOPATH/src'
  - package path convention is '$GOPTATH/src/<repository-server>/<user>/<package-name>'


### install binary package
**note** 
  - most of the time we only want to use a program developped in go (we'll not compile it or use it's programmatic API) 
  - so we only have to find a build for our platform and install the binary 

  # find out a build for our platform (linux_amd64 linux_amd32)
  $ mkcd ~/scripts/<package-name>
  # copy the script in it's own directory under ~/script
  $ curl '<build-url>' > ./<package-name>    // we are in ~/scripts 
  # the file must be executable
  $ chmod u+x ./<package-name>
  # create a symbolic link from ~/scripts to the binary
  $ ln -s ./<package-name> ../<package-name>              # only ~/scripts is in the PATH
  # copy or create a Readme file to explain what the script is about
  $ vim README.md
  > ...
  
### install package with go get 
**note** will install the package from the sources. Most of the time we don't need such overhead

  ```sh
  # git clones sources of '18F/hmacauth' package in current GOPATH (and managed its dependencies)
  $ go get github.com/18F/hmacauth                  # actual path is ' $GOPATH/src/github.com/18F/hmacauth '
                                                    # this package can be imported in go with `import "github/18F/hmacauth"`
  # this will also install tests 
  $ go get -t github.com/18f/hmacproxy              

  # this will update package
  $ go get -u -v github.com/18f/hmacproxy              
  ```

### uninstall package installed with go get
**note** without a modern packages depedency management tool, it's a mess

#### manual option

```sh
rm -rf $GOPATH/bin/<package-name>            # binary
rm -rf $GOPATH/src/github.com/user/<package-name>/   # source directory
rm -rf $GOPATH/pkg/linux_amd64/github.com/<user>/<package-name>/   # archives
```

#### auto option
[TODO]

create own go package
---------------------
see [doc](https://pages.18f.gov/dev-environment-standardization/languages/go/)


npm like dependency management
-----------------------------
**wait until there's a clear winner**
see [doc](https://pages.18f.gov/dev-environment-standardization/languages/go/)


linting tools
---------------
see [doc](https://pages.18f.gov/dev-environment-standardization/languages/go/)

