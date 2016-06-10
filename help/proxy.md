---- Web Proxies User Guide ----
================================


hotel
-----
[TODO] Est-ce qu'on continue à utiliser htpp-master (géré par pm2) ou est-ce qu'on utilise hotel à la place qui semble beaucoup plus facile à utiliser.

### what is it ?
  - easy to use local domain inversed proxy with a local '.dev' domain.
  
### usee
  see [hotel](https://github.com/typicode/hotel)

### install
  see [hotel](https://github.com/typicode/hotel)

http-master
----------
[TODO]
  - http-master devrait être géré par pm2 via configuration yaml

### what is it?
  - on workstation each HTTP application listen on 80 port on its own local domain name
  - as /etc/hosts file can't map ports we use the reverse proxy 'http-master' to  map arbitratry domain names to localhost ports (applications ports)
  - it actually can do much more and can even be used on production server...

### local domain conventions
  - '*.mfc' domains are used for compagny hosts
  - '*.local.mfc' domains are used for compagny hosts    # local here means 'local workstation'
  - '*.<project-name.mfc>' are used for compagny projects
  - '*.<project-name.local.mfc>' are used for local projects 

### how it works
1. user makes a request on <custom-local-domain>:80
2. due to '/etc/hosts' mapping, request is directed to localhost:80 (but 'technical' target remains <custom-local-domain>:80) 
3. http-master reverse proxy maps <custom-local-domain>:80 to localhost:port


### configuration of a local domain
**quick start** to add a new local subdomain in 'local.mfc', you just have to add in it `~/.config/http-master/config.yaml` and restart http-master (`pm2 restart http-master`)


1. configure route in http-master
  ```yaml
  # in ~/.config/http-master/config.yaml
  
  watchConfig: true # watch config file for changes
  ports:  # each port gets a separate configuration
    80:                                              
      router: 
        ## Curtsom rules
        domain.com : localhost:4873
        ## Proxy remaning traffic to port 8080, for example Apache could run there
        '*' : 8080
  ```                                                                          
2. configure dnsmasq
As hosts file doesn't support wildcard, we use dnsmasq to route local domains
**beware** on Ubuntu 14.04 dnsmasqk-base is used natively by network-manager. following config should be enough. **DO NOT** install dnsmasq

  ```yaml
  # in /etc/NetworkManager/dnsmasq.d/local 
  # this will route every 'local.mfc' subdomain to localhost (http-master reverse proxy will map to an application port on localhost)
  # for instance a request to 'v2.eshop.local.mfc'  could be routed to localhost:5645
  address=/local.mfc/127.0.0.1                      
  ```
  ```sh
  # restart network-manager
  sudo restart network-manager
  ```

3. configure hosts file
dnsmasq routing should be used for convention based local routing (local.mfc/.mfc/etc.)
for very specific needs, one can use simple /etc/hosts routing

  ```yaml
  # in /etc/hosts
  127.0.0.1	domain.com
  ```

4. restart reverse-proxy
[TODO] 
  - this should not be necessary.
  - it should work automatically as http-master is configured to reload config automatically on change.
  - for unknown reason it's not sufficien and we have to manually restart http-master.
  - As a workaroud, we could use YAML application declaration in PM2 to watch ~/.config/http-master/config.yaml and restart automatically http-master 

  ```sh
  $ pm2 restart http-master
  ```

### install 
  ```sh
  $ npm install -g http-master
  ```

### launch http-master manually
    # Not the most secure setup as this should not run as root (but it's ok for a dev box)
    $ sudo env PATH=$PATH http-master --config ~/.config/http-master/config.yaml

### launch through pm2
  # this works only if :
  #   - authbind is used to allow non root processes to bind to priviledged ports (http-master listens on port 80)
  #   - pm2 is aliased to 'authbind --deep pm2'
  $ pm2 start http-master -- --config ~/.config/http-master/config.yaml     

