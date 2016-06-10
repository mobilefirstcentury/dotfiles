---- PM2 User Guide ----
=======================

[TODO]
  - si on garde pm2 il faudra utiliser le YAML confile file pour la configuration plutôt que les lignes de commandes 

what is it?
----------
pm2 is a node based process manager that will monitor and restart applications
it can also be used auto reload app on file changes during app development

install
-----------
  ```sh
  $ npm install -g pm2  # if nvm is not used, you should use sudo
  $ pm2 completion >> ~/.zshrc   # intalls command line commande completion

  ## for security reasons we want pm2 to run under pm2 user (pm2 has sudo rights)
  #$ sudo adduser --disabled-login --gecos 'pm2 user' pm2     
  #$ sudo usermod -aG sudo pm2 

  # ensure that pm2 will be launched on machine startup and that it will launch managed processes
  # this will create a script `/etc/init.d/pm2-init.sh`
  # we must indicate current OS type. Recognized platforms: ubuntu|centos|redhat|gentoo|systemd|darwin|amazon
  # we have to indicate PATH otherwise we'll have an error as node is not in the sudo PATH 
  $ sudo env PATH=$PATH pm2 startup ubuntu -u $USER
  ```

configure (initial)
-------------------
On workstation we want processes started by npm2 to be authorized to listen on priviledged ports (under 1024).
Authbind allows non-root users to bind to ports less than 1024.

  ```sh
  $ sudo apt-get install authbind
  $ sudo touch /etc/authbind/byport/80
  $ sudo chown %user% /etc/authbind/byport/80
  $ sudo chmod 755 /etc/authbind/byport/80
  $ authbind --deep pm2 update

  # pm2 is aliased in ~/.zshrc
  # alias pm2='authbind --deep pm2'
  ```

use
---

### launch and manage an app
  ```sh
  # start an application 

  $ pm2 start app.js                    # app.js launched as a service (under default name)
  $ pm2 start app.js --name "myappname"   # app.js launched as a service (under name `myappname`)
  $ pm2 start app.js -- -a 23 --config file  # Pass arguments '-a 23 --config file' argument to app.js script
  $ pm2 start my_app.js --node-args="--harmony" # enable Harmony ES6

  $ pm2 start app.js -i 0        # Will start maximum processes with LB depending on available CPUs and act as a round robin load balancer
  $ pm2 start app.js -i max      # Same as above, but deprecated yet.
  $ pm2 scale app.js 3           # scales up or down the number of active applications proceess

  $ pm2 save                     # if the machine restarts current configuration will be restarted 
  ```

### list managed applications
  ```sh
  $ pm2 list
  ```

### watch application (for development purppose)
  ```sh
  # must be launched in the watched directory
  $ pm2 start app.js --watch
  $ pm2 stop --watch app.js # stop watching
  ```

### stop an application
  ```sh
  $ pm2 stop app
  $ pm2 stop all
  ```

### delete an application from pm2 
  ```sh
  $ pm2 delete app 
  ```

### restart an application
  ```sh
  $ pm2 restart application
  $ pm2 restart all
  ```

### get application detailed infos
  ```sh
  $ pm2 describe app
  ```

### status, CPU and memory usage
  ```sh
  $ pm2 monit
  ```

### manage applications logs

#### view log files
  - pm2 logs are in `~/.pm2/log/`
  - managed applications logs are in `~/.pm2/logs/`
#### tail log files
  - pm2 logs        # Display all processes logs in streaming

### Advanced use cases
for complexe use cases, it's better to use YAML config file to define apps instead of command line.
see [application declaration](http://pm2.keymetrics.io/docs/usage/application-declaration/)


uninstall
---------
  ```sh
  # uninstall pm2 module
  $ npm uninstall -g pm2
  # uninstall startup script

  $ sudo update-rc.d -f pm2-init.sh remove  # this removes startup links from /etc/rc*.d/
  $ sudo rm /etc/init.d/pm2-init.sh   # this removes startup script
  ```
