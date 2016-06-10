---- Node.JS Modules Directory ----
===================================


mfc modules
-----------
**note** modules developped at mfc for internal use.

### common
#### what is it ?
 - es6 module wrappings usefull modules and functions for rapid prototyping
 - this module is installed in ~/node_modules and can be required from anywhere.
 - it's source code is in ~/.packages
#### use
 - see ~/.packages/node/common/README.md for user guide

official modules
----------------
  - fs    : acess file system 
  - path  : process file & directory paths
  - http: plain vanilla http server (Recommandation: Use Express as often as possible)


express modules
---------------
**notes** : since 4.0 version, Express has no Connect dependency. Connect is the official(?) middeware engine for NodeJS

  - express : minimalist web framework 
  - serve-static : express middleware **module** to serve static files
  - morgan : express middleware module for http request logging
  - connect-markdown: markdown to html autoconverter for express
  - express-session: session middleware 
  - passport: authentication middleware (using custom, openid or OAuth2 strategy)


structural modules
-------------------

### dom
  - lodash : lightweigth successor of underscore.js
  - 

### authentification
  - jaredhanson/passport: multi strategy authentification library (**note** for an MVP simply use auth0 service)

community modules
----------------


### scrapping
  - x-ray: The next web scrapper... (supports PhantomJS)
  - scrape-it : Cheerio for humans
  - cheerio: jquery light for DOM traversal


### date & time
  - moment : Parse, validate, manipulate, and display dates in JavaScript

### parsing
  - pareseurl : Parse the url of a req object in a web server (compatible with express and plain vanilla 'http' node server)



### miscellaneous
  - open  : open a file or url in the user's preferred application. Can be used to open a url in a browser.


community applications
----------------------
### CLI tools
  - pipeable-js: command line utility. pipeable javascript to filter, map and reduce from the command line
  - node-inspector: debug node.js in chrome Developper Tools 

### static web server
  - http-server : successfull static server currently used on Workstation based on node-ecstatic (maybe replaced by following express based alternatives)
  - dev-http: dead simple and hackable static server (based on express and serve-static)
  - sir : powerfull **express and serve-static based** development server (wit live-reload capability) (billymoon/sir)

external services
----------------

### mail
  - nodemailer/nodemailer: easy email sender that knows common email services (gmail, etc.)
  - bojand/mailgun-js: mailgun API helper (simpler than official 'mailgun/mailgun-js')
