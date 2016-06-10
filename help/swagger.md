---- Swagger User guide ----
============================


What is it?
---------
Swagger is API definition specification that's beeing standardised as OpenAPI Specification.
With Swagger you can specify an API interface and then use Swagger Compatible tooling to generate server and client code to serve the API.


Tools
-----

### Swagger RAD node Development Environment
RAD node environment to build Swagger based API servers.

[TODO] 
  - suivre [ce tuto](https://scotch.io/tutorials/speed-up-your-restful-api-development-in-node-js-with-swagger)
  - utiliser la version docker pour ne pas avoir à installer swagger : 
    - `sudo docker run -d -ti --name=swagger-node-2 -P -v ~play/test-swagger-node-docker/app:/opt/apps -e USER_UID=`id -u` 'mfc/swagger-node'`
    - [TODO] Vérifier que la commande ci-dessus fonctionne.
  - ne pas oublier de configurer swagger-node pour qu'il ne lance pas de browser
  - utiliser swaggger editor (ci-dessous) pour éditer le fichier swagger (swagger node est censé 'watcher' ce fichier pour régénérer le code serveur en temps réel)

### Editor
**note** 
  - as of 2016/05, swagger editor is **REALLY** cumbersome to configure and use.
  - we use several github project to obtain a usable editor
  - We had to modify the code of one of them ...
  - exact configuration and use is documented below 

Swagger-editor is a swagger file editor that provides real time linting and API docuementation viewing.


### use 
[TODO] 
  - c'est le bordel
  - trouver une autre solution ou bien
  - refactorer le code et **créer une image DOCKER** facile à lancer

**notes** the swagger-editor code is temporarily in `~dev/_SANDBOX/_EXPERIMENT/swagger-edit` directory

1. launch the swagger server 
[TODO] Pour l'instant il faut indiquer le chemin absolu du fichier swagger sinon ça ne marche pas. Il s'agit d'un bug à corriger

  ```sh
  node ~dev/_SANDBOX/_EXPERIMENT/swagger-edit/swagger-server/main.js <absolute/path/to/swagger-file.yaml>
  ```
2. launch the swagger editor 
  ```sh
  http-server ~dev/_SANDBOX/_EXPERIMENT/swagger-edit/swagger-editor
  ```
3. lauch a browser on 'localhost:8080' (if that port is occupied the editor will listen on another port)

4. edit the yaml (Modifications are saved on real time)

#### swagger-editor-server

##### [TODO] 
  - Créer un module NPM privé à installer sur Workstation

##### what is it?
Swagger-Editor-server is an npm module that serves a swagger file and modifies is each time this is requested by the editor

##### Custom code modification
  - Initial code  `https://github.com/borisirota/swagger-editor-server`
  - we had to modify the code of this module to :
    - enable CORS 
    - impose a (hard coded) port on which to listen (9871) that is entered in the config file of the editor (config/defaults.json)
  - current code is in '/home/rachid/Dev/_SANDBOX/_EXPERIMENT/swagger-edit/swagger-server/node_modules/swagger-editor-server/lib/index.js'  

##### Use
```js
 var editor = require("swagger-editor-server");
  editor.edit(swaggerFile);
```

#### swagger server (swagger editor server wrapper)

#### [TODO]
  - créer un module NPM privé à installer sur Workstation
  - on doit avoir un seul module avec swagger-editor-server

#### what is it?
**node** As swagger-editor-server is only a npm module we had to write wrapping code to provide a command line callable tool 

#### code

```js
// in main.js
var fs = require('fs')
var path = require('path')
var editor = require("swagger-editor-server")   // use the custom modified module described above

// use minimist to get swagger file path argument
var args = require('minimist')(process.argv.slice(2));

// if no swagger file is given use ./swagger.yaml by default
var swaggerFile = args._[0]? args._[0]: 'swagger.yaml'
var swaggerFilePath = path.resolve( __dirname,swaggerFile)

// edit swagger file
editor.edit(swaggerFilePath);
```

#### use 
[TODO] This has to change  
  
  ```sh
  node main.js <path/to/swagger/file> 
  ```
  
### swagger-editor

#### What is it ?
The editor is a front end web app that allows editing a swagger file by communicating with the swagger editor server.

#### Installation

  ```sh
  git clone https://github.com/swagger-api/swagger-editor.git
  cd swagger-editor
  npm install
  ```

#### Configuration
 edit `config/defaults.json` to set the following confg values

config param         | value
---                  | ---
disableCodeGen       | true
useBackendForStorage | true
backendEndpoint      | http://localhost:9871/editor/spec
useYamlBackend       | true
disableFileMenu      | true
disableNewUserIntro  | true

### Use 

  ```sh
  # configure (see above)
  npm start
  ```
