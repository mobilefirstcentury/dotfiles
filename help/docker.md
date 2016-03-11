
Docker Cheat Sheet
==================

TODO
====


Notes
=====
+ Utiliser un plugin Oh-my-zsh pour la completion des commandes Docker.

Prerequisites
=============

+ Kernel >= 3.10.x
+ Instal on Ubuntu : 64bits

Installation
==============
Attention à ne pas installer le package ubuntu docker.io qui est très en retard sur les dernières versions stables de docker.
+ Installation scriptée de Docker
  + curl -sSL https://get.docker.com/ | sh
  + Créer un group docker
  + Ajouter le user au group docker
+ Installation de Compose
  + sudo curl -L https://github.com/docker/compose/releases/download/1.5.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
  + sudo chmod +x /usr/local/bin/docker-compose
Definitions
===========

+ container: Your basic isolated Docker process. Containers are to Virtual Machines as threads are to processes. Or you can think of them as chroots on steroids.
+ images : templates for docker containers.
+ repository : hosted collection of tagged images that together create the file system for a container.
+ registry : server that stores repositories and provides an HTTP API for managing the uploading and downloading of repositories.
+ Docker.com : official cloud registery.
+ local registry: default registry implementation has an official image for basijc setup
+ dockerfile: configuration file to build container.
+ layer: versioned filesystem in Docker is based on layers.
+ Links: Links are how Docker containers talk to each other through TCP/IP ports. Links can be resolved hostname.


Container Lifecycle
===================

  docker create  : creates a container but does not start it.
  docker run     : creates and starts a container in one operation.
  docker stop    : stops it.
  docker start   : will start it again.
  docker restart : restarts a container.
  docker rm      : deletes a container.
  docker kill    : sends a SIGKILL to a container.
  docker attach  : will connect to a running container. (more precisely will attach to the std output of the container)
  docker wait    : locks until container stops.



Container management
====================

  docker ps      : shows running containers.
  docker logs    : gets logs from container.
  docker inspect : looks at all the info on a container (including IP address).
  docker events  : gets events from container.
  docker port    : shows public facing port of container.
  docker top     : shows running processes in container.
  docker stats   : shows containers' resource usage statistics.
  docker diff    : shows changed files in the container's FS.
  docker ps -a   : shows running and stopped containers.
  docker cp      : copies files or folders between a container and the local filesystem..
  docker export  : turns container filesystem into tarball archive stream to STDOUT.



Open Shell on a docker container
================================
  docker run -t -i ubuntu:14.04 /bin/bash : run a container based on image ubuntu (with tag 14.04) and presents a bash shell to the user


Executing Commands
==================

  docker exec                               : execute a command in container.
  docker exec -it foo /bin/bash             : enter a running container, attach a new shell process to a running container called foo, use : .
  docker exec -t -i <mycontainer> <myshell> : open a shell session on a running container


Launch a docker daemon
=====================
docker run -d <image:tag> 'cmd' : runs a docker daemon   
docker logs <container-name|container-id> : shows stdoutput of a running docker daemon

Launch a container that automatically closes after execution
============================================================

  docker run --rm  -> runs a container and removes after it stops.
  docker run rm -v -> runs a container, removes the container and its associated volume after it stops


Launch a a container that we can attach or detach
=================================================
1. Launch a container with the appropriate shell commande
  $ docker run -i -t <image> /bin/bash
2. Detach from the contenair withour killing it!
  $ <Ctrl-p><Ctrl-q>
  // The container is now stopped ...
3. Attach back to the container
  $ docker attach <container-id>

Images Lifecycle
================

  docker images  : shows all images.
  docker import  : creates an image from a tarball.
  docker build   : creates image from Dockerfile.
  docker commit  : creates image from a container.
  docker rmi     : removes an image.
  docker load    : loads an image from a tar archive as STDIN, including images and tags (as of 0.7).
  docker save    : saves an image to a tar archive stream to STDOUT with all parent layers, tags & versions (as of 0.7).
  docker history : shows history of image.
  docker tag     : tags an image to a name (local or registry).

Registry & Repository
======================

  docker login  : to login to a registry.
  docker search : searches registry for image.
  docker pull   : pulls an image from registry to local machine.
  docker push   : pushes an image to the registry from local machine.

Local Registery
===============

  docker run -p 5000:5000 registry : runs a local registery (basic, with no authorization controls).
  docker option -P -p 127.0.0.1:5000:5000: runs a local registery with connections limited localhost.
  push to this repository:
   - tag image with repositoryHostName:5000/imageName
   - then push this tag.


Tutorial
========

[Flux7's Dockerfile Tutorial](http://blog.flux7.com/blogs/docker/docker-tutorial-series-part-3-automation-is-the-word-using-dockerfile)

Layers
======

Links
=====

  docker daemon -icc=false : disable inter-process communication. Containers can ONLY communicate with each other through links.
  docker -d -icc=false : disable inter-process communication. Containers can ONLY communicate with each other through links.
  docker run -d --link CONTAINER:ALIAS --name LINKED user/wordpress: creates a container named LINKED linked to container name CONTAINER
  $ALIAS_PORT_1337_TCP_PORT: environment varianle containing port of container 'CONTAINER' (aliased as ALIAS) as it appears in container 'LINKED' (if CONTAINER exposes port 1337)
  $ALIAS_PORT_1337_TCP_ADDR: environment variable containging ip adresse of container 'CONTAINER' (aliased as ALIAS) as it appears in container 'LINKED' (if CONTAINER exposes port 1337)
  docker rm --link : delete a link 
  
Volumes
=======
  docker run -v $HOSTDIR:$DOCKERDIR : map a directory on the host to a docker container. The directory is then 'VOLUME' in the container. 
  docker run -it -v /home/rachid/Trash/docker-volume:/volume ubuntu:14.04 vi  : run vi in a container based on image ubuntu with tag 14.04 and maps a volume
  docker run -it -v $PWD/<host-relative-path>:<container-absolute-path> ubuntu:tag <cmd>: run a container with volume mapping
  docker run -it -v $PWD/<host-relative-path>:<container-absolute-path> -u user ubuntu:tag <cmd>: run a container as user instead of root (the user must exist in the image)
  docker run -it -v $PWD/<host-relative-path>:<container-absolute-path> w <container-working-dir-absolute-path> ubuntu:tag <cmd>: run a container and sets the working directory instead of /.

Exposing ports
==============

  docker run -p 127.0.0.1:$HOSTPORT:$CONTAINERPORT --name CONTAINER -t someimage: run a container while mapping a container port to an host port. 


Security
=========

  useradd -G docker user: adds user to group docker to give him root access.
  expose the docker unix socket to a container: gives the container root access to the host. (?)
  docker image ids are sensitive information and should not be exposed to the outside world. Treat them like passwords.
  docker -d --icc=false --iptables: turns off interprocess 
  docker run --read-only: sets the container to be read-only
  docker pull debian@sha256:a25306f3850e1bd44541976aa7b5fd0a29be: Verify images with a hashsum:
  docker run -v $(pwd)/secrets:/secrets:ro debian: Set volumes to be read only:
  docker -c 512 -mem 512m: Set memory and CPU sharing:
  RUN groupadd -r user && useradd -r -g user user: Define and run a user in your Dockerfile so you don't run as root inside the container:

Cookbook
========
### Last ids
  alias dl='docker ps -l -q': set 'last id' alias
  docker run ubuntu echo hello world
  docker commit `dl` helloworld

### Commit with command (needs Dockerfile)
  docker commit -run='{"Cmd":["postgres", "-too -many -opts"]}' `dl` postgres

### Get IP address
  docker inspect `dl` | grep IPAddress | cut -d '"' -f 4
or 
  wget http://stedolan.github.io/jq/download/source/jq-1.3.tar.gz
  tar xzvf jq-1.3.tar.gz
  cd jq-1.3
  ./configure && make && sudo make install
  docker inspect `dl` | jq -r '.[0].NetworkSettings.IPAddress'
or using a go template
  docker inspect -f '{{ .NetworkSettings.IPAddress }}' <container_name>


### Get port mapping
  docker inspect -f '{{range $p, $conf := .NetworkSettings.Ports}} {{$p}} -> {{(index $conf 0).HostPort}} {{end}}' <containername>
### Get links available in a container
  $ docker inspect -f "{{.HostConfig.Links}}" <containername>

### Find containers by regular expression
  For i in $(docker ps -a | grep "REGEXP_PATTERN" | cut -f1 -d" "); do echo $i; done`

### Get Environment Settings
  docker run --rm ubuntu env

### Kill running containers
  docker kill $(docker ps -q)

### Delete old containers
  docker ps -a | grep 'weeks ago' | awk '{print $1}' | xargs docker rm

### Delete stopped containers
docker rm -v `docker ps -a -q -f status=exited`

### Delete dangling images
  docker rmi $(docker images -q -f dangling=true)

### Delete all images
  docker rmi $(docker images -q)

### Show image dependencies
  docker images -viz | dot -Tpng -o docker.png

### Slimming down Docker containers [ Intercity Blog ](http://bit.ly/1Wwo61N)
#### Cleaning APT
  RUN apt-get clean
  RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
#### Flatten an image
  ID=$(docker run -d image-name /bin/bash)
  docker export $ID | docker import – flat-image-name
#### For backup
  ID=$(docker run -d image-name /bin/bash)
  (docker export $ID | gzip -c > image.tgz)
  gzip -dc image.tgz | docker import - flat-image-name

### Monitor system resource utilization for running containers

#### check the CPU, memory and network i/o usage for a single container
  docker stats <container>

#### check the CPU, memory and network i/o usage for all containers on the docker host
  docker stats $(docker ps -q)

#### Integrate a container in the host process manager
  start the daemon with -r=false 
  then use docker start -a.

#### checks the status of the docker daemon
  sudo service docker status
