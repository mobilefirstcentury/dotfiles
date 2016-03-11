
**** Vagrant cheat sheet ****
===============================

Vagrant base boxes public registeries
--------------------------------

### From registery hubs
  - Vagrant Cloud: HashiCorp's official site for Vagrant boxes.
  - vagrantbox.es :  A List of vagrant base boxes.
  - Opscode bento : Extremely useful base boxes which can be used to test cookbooks or private chef (Chef Server and Client).
  - Puppet Labs Vagrant Boxes: Pre-rolled vagrant boxes, ready for use. Made by the folks at Puppet Labs.
  - Vagrant Ubuntu Cloud Images: NOT officially promoted it yet

### baseline development boxes
  - Install boxes with pre-installed development stacks for any language
  # see [vagrant-baseline](https://github.com/bltavares/vagrant-baseline)

### mongo db replicas
  - Installs mongo db replica set (?)
  see [vagrant-mongodb](https://github.com/smdahlen/vagrant-mongodb)


Initialize working directory
------------------------
  $ vagrant init : Initialize Vagrant with a new Vagrantfile and ./.vagrant directory, using no specified base image.
  $ vagrant init <boxpath> : Initialize Vagrant with a specific box. 
  $ vagrant init chef/centos-6.5: Initialize vagrant with the chef/centos-6.5 box from [HashiCorp's Atlas box catalog](https://atlas.hashicorp.com)

Adds a box to the local registry 
-------------------------------
  $ vagrant box add hashicorp/precise32 : donwloads and installs the specified box from Hashicorp's Atlas Registery Hub
  $ vagrant box add <box-custom-name> <url-of-file-with-box-extension>: downloads andi installs the specified box

Specifying which box to use
---------------------------
  # In the vragant file
    `
    vagrant.configure("2") do |config|
      config.vm.box = "chef/centos-6.5" # or whatever box you want to use
    end
    `

Starting a VM
------------

| command                             | description                                                                                              |
| ---                                 | ---                                                                                                      |
| vagrant up                          | Boot the VM's specified in your Vagrantfile. Equivalent to pressing the power buttons on your "servers." |
| vagrant up --provider=vmware-fusion | Runs the box throught specific provider, if compatible box is present                                    |
| vagrant reload                      | The equivalent of vagrant halt followed by vagrant up (provisionning will be done only with --provision) |


Getting into a VM
-----------------

| command             | description                                                                                                 |
| ---                 | ---                                                                                                         |
| vagrant ssh         | Open an ssh session to the default box specified in your working directory's Vagrantfile                    |
| vagrant ssh boxname | If you give your box a name in your Vagrantfile, you can ssh into it with boxname. Works from any directory |
| vagrant ssh boxid   | The boxid can be obtained from vagrant global-status. Works from any directory.                             |

Stopping a VM
----------------

| command            | description                                                                                       |
| ---                | ---                                                                                               |
| vagrant suspend    | suspends the VM. Should be followed by a 'vagrant resume'                                                                                   | 
| vagrant halt       | performs a clean shut down. Should be followed by a 'vagrant up'                                  |
| vagrant destroy    | Stop and delete the default VM. The next time you vagrant up, the VM will be created from scratch |
| vagrant destroy -f | Destroy the VM without confirming first.                                                          |

Boxes
-----
** Boxes are prebuilt VM images. You never modify your box images ** 

| command          | description                                        |
| vagrant box list | See a list of all installed boxes on your computer |
| vagrant box add  | Download a box image to your computer              |

Networking into and out of VM's
-------------------------------

### Forward a port from the VM to your computer

    `
    vagrant.configure("2") do |config|
      config.vm.network "forwarded_port", guest: 80, host: 8080 # guest is the VM; host is your computer
    end
    `

### Provisioning stuff on your VM's
**   Provisioning lets you execute commands on the VM when vagrant up is run **

  $ vagrant reload --provision : Run provisioners without halting the VM and running vagrant up
  $ vagrant provision          : Re-runs the provisionning stuff on a running vagrant box

### Run a shell script when you vagrant up (a.k.a., when a VM is created)

    `
    vagrant.configure("2") do |config|
      config.vm.provision :shell, path: "my_bash_script.sh" # path is relative to yo ur `Vagrantfile`
    end
    `

### Share folders between your VM and your computer

  # By default ./ on your computer is shared as /vagrant on the VM.
  # Add a new synced folder.
    `
      Vagrant.configure("2") do |config|
        # other config here

        config.vm.synced_folder "src/", "/srv/website"
      end
    `
### List running boxes 
  $ VBoxManage list runningvms : list running VMs

### Letting other people access your VM's

** Vagrant has a cool feature that lets you publicly share your VM's with anyone, through a sort-of "DynDNS" solution. This is a great way to let stakeholders view your devbox. **
** Security : Default ssh key should not be used. See [Beware Vagrant Insecure Key](https://docs.vagrantup.com/v2/share/connect.html<Paste>) **

| command                      | description                                                                           |
| ---                          | ---                                                                                   |
| vagrant login                | Log in to HashiCorp's Atlas on your computer                                          |
| vagrant share                | Shares all exposed ports (except 22) of the VM. A NAME and a unique URL are generated |
| vagrant connect NAME         | Access a remote shhared VM as if it was local                                         |
| vagrant share --http         | Shares the VM and provides you with the displayed URL. Insist there's a web port      |
| vagrant share --https        | Shares the VM over SSL and provides you with the displayed URL                        |
| vagrant share --disable-http | Do not share web port                                                                 |
| vagrant share --ssh          | Shares the VM over ssh via the displayed name. The access is password protected       |
| vagrant connect --ssh NAME   | connect throught ssh to a remote shared VM                                            |
| ctrl+shift+c                 | Quits the sharing session                                                             |


Vagrant Plugins
--------------
** plugins extends vagrant features ***

### Available plugins
  - [The Mitchel List](https://github.com/mitchellh/vagrant/wiki/Available-Vagrant-Plugins)

### Plugin commands
  $ vagrant plugin install <plugin-name> : installs a new plugin
  $ vagrant plugin update <plugin-name> : updates plugin
  $ vagrant plugin uninstall <plugin-name>: removes/uninstalls plugin 
  $ vagrant plugin list : lists installed plugins



Providers
------------
**  Default provider is VirtualBox **
**  Other providers can be used : Vmware, AWS, etc **

### AWS
  1. Install aws plugin
    $ vagrant plugin install vagrant-aws : installs the aws provider vagrant plugin
  2. Install aws conpatible box
    $ vagrant box add ..
  3. configure the vagrantfile
  # Beware. User Environment variable not secrets should be saved in plain text files.
  # See [documentation](https://github.com/mitchellh/vagrant-aws) for all plugin configuration options:
    `
    Vagrant.configure("2") do |config|
      config.vm.box = "<box-name>"

      config.vm.provider :aws do |aws, override|
        aws.access_key_id = "YOUR KEY"
        aws.secret_access_key = "YOUR SECRET KEY"
        aws.session_token = "SESSION TOKEN"
        aws.keypair_name = "KEYPAIR NAME"

        aws.ami = "ami-7747d01e"

        override.ssh.username = "ubuntu"
        override.ssh.private_key_path = "PATH TO YOUR PRIVATE KEY"
      end
    end
    `
  4. start the box
    $ vagrant up --provider=aws : launch aws compatible vagrant box
  
### Docker
  # see [vagrant-docker-compose](https://github.com/leighmcculloch/vagrant-docker-compose)

## Nodes Management/Administration
  # On peut gérer depuis un point unique un réseaux de nodes vagrants
  # see [vagrant-nodemaster](https://github.com/fjsanpedro/vagrant-nodemaster)
